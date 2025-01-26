import 'package:ecommerce/bussines_logic/getfavcubit/getfav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bussines_logic/getProductById_cubit/get_product_by_id_cubit.dart';
import '../../constances/fonts.dart';
import '../details_screen/details_Screen.dart';

class Fav_Screen extends StatefulWidget {
  const Fav_Screen({Key? key}) : super(key: key);

  @override
  State<Fav_Screen> createState() => _Fav_ScreenState();
}

class _Fav_ScreenState extends State<Fav_Screen> {
  int productid = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<GetfavCubit>(context).getfav();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourites',
          style: ColorDesign.boldwhite.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: BlocBuilder<GetfavCubit, GetFavState>(
        builder: (context, state) {
          if (state.getFavStatus == GetFavStatus.loading) {
            return CircularProgressIndicator(
              color: Colors.blueGrey,
            );
          }
          if (BlocProvider.of<GetfavCubit>(context).getallfav == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            );
          }
          var favlist = BlocProvider.of<GetfavCubit>(context).getallfav;
          return GridView.builder(
            itemCount: favlist['Favorites'].length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) => Container(
              margin: const EdgeInsets.all(35),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    productid = index + 1;
                    print(favlist);
                    BlocProvider.of<GetProductByIdCubit>(context).getproductbyId(productid);
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => Details_Screen(
                            image: 'http://192.168.1.104:3000/images/${favlist['Favorites'][index]['photo']}',
                            description: ' ${favlist['Favorites'][index]['description']}',
                            name: '${favlist['Favorites'][index]['name']}',
                            price: '${favlist['Favorites'][index]['price']}',
                            brand: '${favlist['Favorites'][index]['brand']}',
                        id: '${favlist['Favorites'][index]['product_id']}'
                          )));
                },
                child: Column(
                  children: [
                    Image.network(
                      'http://192.168.1.104:3000/images/${favlist['Favorites'][index]['photo']}',
                      height: 150,
                      fit: BoxFit.fitWidth,
                    ),
                    Center(
                      child: Text(
                        '${favlist['Favorites'][index]['name']}',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
