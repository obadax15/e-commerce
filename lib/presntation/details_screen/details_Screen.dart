import 'package:ecommerce/bussines_logic/add_prd_to_fav/add_fav_cubit.dart';
import 'package:ecommerce/bussines_logic/getfavcubit/getfav_cubit.dart';
import 'package:ecommerce/constances/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Details_Screen extends StatefulWidget {
  const Details_Screen(
      {Key? key,
      required this.description,
      required this.name,
      required this.price,
      required this.brand,
      required this.image,  required this.id})
      : super(key: key);
  final String description;
  final String name;
  final String price;
  final String brand;
  final String image;
final String id;

  @override
  State<Details_Screen> createState() => _Details_ScreenState();
}

class _Details_ScreenState extends State<Details_Screen> {

  @override
  @override
  void initState() {
 WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<GetfavCubit>(context).getfav();

    });

    super.initState();
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          )),
                      const SizedBox(
                        width: 100,
                      ),
                      Center(
                        child: Text(
                          'Details',
                          style: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.network(
                    widget.image,
                    height: height / 2.2,
                    width: width,
                  ),
                  SizedBox(height: 30,),
                  Text(
                   "model : ${ this.widget.name}",
                    style: ColorDesign.normalblack.copyWith(fontSize: 23, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "price : ${this.widget.price}\$",
                    style: const TextStyle(color: Colors.green, fontSize: 22, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "description:\n${this.widget.description}",
                    style: ColorDesign.normalblack.copyWith(fontSize: 15, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Center(
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: Colors.blueGrey,
                    ),
                    width: width / 1.2,
                    height: 50,
                    child: const Center(
                        child: Text(
                      'Add to cart',
                      style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900),
                    )),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  BlocBuilder<GetfavCubit, GetFavState>(
  builder: (context, state) {
    var rr=BlocProvider.of<GetfavCubit>(context).getallfav;
    bool isfav=(rr['Favorites'] as List).any((item) => item['id'].toString() == widget.id);
    return BlocBuilder<AddFavCubit, AddFavState>(
  builder: (context, state) {
    return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.blueGrey,
                    ),
                    width: width / 8,
                    height: 50,
                    child: GestureDetector(
                      onTap: (){

                        print(isfav);
                        print(rr);
setState(() {
  BlocProvider.of<AddFavCubit>(context).addproducttofav(widget.id);
  BlocProvider.of<GetfavCubit>(context).getfav();
});
                      },
                      child:  Center(
                        child: Icon(isfav==true?Icons.favorite:Icons.favorite_border_outlined,color: Colors.white,),
                      ),
                    ),
                  );
  },
);
  },
),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
