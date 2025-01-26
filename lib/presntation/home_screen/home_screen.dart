import 'package:ecommerce/bussines_logic/getProductById_cubit/get_product_by_id_cubit.dart';
import 'package:ecommerce/bussines_logic/getall_product_cubit/getall_product_cubit.dart';
import 'package:ecommerce/bussines_logic/getallcategory_cubit/getall_category_cubit.dart';
import 'package:ecommerce/bussines_logic/getproductbycat_cubit/getproductbycat_cubit.dart';
import 'package:ecommerce/constances/fonts.dart';
import 'package:ecommerce/presntation/home_screen/navigateion_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../details_screen/details_Screen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

int selectedindex = 0;
int categoryid=0;
int productid=1;

class _Home_ScreenState extends State<Home_Screen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<GetallCategoryCubit>(context).getallcategory();
    }); WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<GetAllProductCubit>(context).getallproduct();
    }); WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<GetproductbycatCubit>(context).getproductbycategory(categoryid);
    });WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<GetProductByIdCubit>(context).getproductbyId(productid);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'E-Commerce',
          style: ColorDesign.boldwhite.copyWith(color: Colors.white),
        ),

        backgroundColor:  Colors.blueGrey,

      ),

      endDrawer: Drawer(
        backgroundColor: Colors.white,

      child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text(
                'Town Center',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle Home tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle Settings tap
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<GetallCategoryCubit, GetallCategoryState>(

      builder: (context, state) {
    if(state.getallCategoryStatus==GetallCategoryStatus.loading)
    {
      return const Expanded(
    child: CircularProgressIndicator(
    color: Colors.blueGrey,
      ),
        );

    }
    if(BlocProvider.of<GetallCategoryCubit>(context).getcategory==null){

      return const Expanded(
        child: CircularProgressIndicator(
    color:Colors.blueGrey,
        ),
      );
    }
    var allcat= BlocProvider.of<GetallCategoryCubit>(context).getcategory;
    return Container(
            width: double.infinity,
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              shrinkWrap: false,
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: width / 2.2,
                decoration: BoxDecoration(
                  border: Border.all(color: selectedindex == index ? Colors.blueGrey : Colors.grey,width: 3   ),
                  borderRadius: BorderRadius.circular(12),
                   ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      categoryid=index;
                      selectedindex = index;
                      BlocProvider.of<GetproductbycatCubit>(context).getproductbycategory(categoryid);
                      print(categoryid);
                    });
                  },
                  child: Center(
                    child: Text(
                       " ${allcat['Categories'][index]['name']}",
                      style: ColorDesign.boldwhite.copyWith(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
              itemCount: allcat['Categories'].length,

            ),
          );
      },
    ),
          BlocBuilder<GetproductbycatCubit, GetProductByCatState>(
      builder: (context, state) {
        if(state.getProductByCatStatus==GetProductByCatStatus.loading)
        {
    return const Expanded(
      child: CircularProgressIndicator(
        color: Colors.blueGrey,
      ),
    );

        }
        if(BlocProvider.of<GetproductbycatCubit>(context).getprodcat==null){

    return const Expanded(
      child: CircularProgressIndicator(
        color:Colors.blueGrey,
      ),
    );
        }
        var productcat  = BlocProvider.of<GetproductbycatCubit>(context).getprodcat;
    var rr= BlocProvider.of<GetProductByIdCubit>(context).rr;
        return Expanded(
            flex: 1,
            child: GridView.builder(
              itemCount: productcat['Products'].length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 40,
                mainAxisSpacing: 20,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) =>

                  Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(12),
                  border:Border.all(color: Colors.grey,)

                ),
                child: GestureDetector(
                  onTap: (){
             setState(() {
               productid=index+1;
               print(productid);
               print(rr);
               BlocProvider.of<GetProductByIdCubit>(context).getproductbyId(productid);

             });
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Details_Screen(image: 'http://192.168.1.104:3000/images/${productcat['Products'][index]['photo']}',description: ' ${productcat['Products'][index]['description']}', name: '${productcat['Products'][index]['name']}', price: '${productcat['Products'][index]['price']}', brand: '${productcat['Products'][index]['brand']}',id:'${productcat['Products'][index]['id']}' ,)));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        child: Image.network(
                          'http://192.168.1.104:3000/images/${productcat['Products'][index]['photo']}',
                          height: 150,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                       Center(
                         child: Text(
                          '${productcat['Products'][index]['name']}',
                          style: TextStyle(color: Colors.black,fontSize: 20),
                                                 ),
                       ),

                    ],
                  ),
                ),
              ),
            ),
          );
      },
    ),
          NavigationBarWidget(),
        ],
      ),
    );
  }
}


//             BlocBuilder<GetAllProductCubit, GetAllProductState>(
//   builder: (context, state) {
//     if(state.getallProductStatus==GetallProductStatus.loading)
//     {
//       return const Expanded(
//         child: CircularProgressIndicator(
//           color: const Color.fromRGBO(255, 153, 0, 1),
//         ),
//       );
//
//     }
//     if(BlocProvider.of<GetAllProductCubit>(context).getproduct==null){
//
//       return const Expanded(
//         child: CircularProgressIndicator(
//           color:Colors.blue,
//         ),
//       );
//     }
//     var allpro  = BlocProvider.of<GetAllProductCubit>(context).getproduct;
//
//     return Expanded(
//               flex: 1,
//               child: GridView.builder(
//                 itemCount: allpro['Products'].length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.8,
//                 ),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.vertical,
//                 itemBuilder: (_, index) => Container(
//                   margin: const EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.3), // Shadow color
//                           spreadRadius: 5, // Extends the shadow beyond the widget
//                           blurRadius: 1, // Blurs the shadow
//                           offset: const Offset(0, 5), // Position of the shadow
//                         ),
//                       ],
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(12),
//
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Card(
//                         child: Image.network(
//                           'http://192.168.1.104:3000/images/${allpro['Products'][index]['photo']}',
//                           height: 150,
//                           fit: BoxFit.fitWidth,
//                         ),
//                       ),
//                        Text(
//                         'name:   ${allpro['Products'][index]['name']}',
//                         style: ColorDesign.normalblack,
//                       ),
//                        Text(
//                         'Price:   ${allpro['Products'][index]['price']}',
//                         style: ColorDesign.normalblack,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             );
//   },
// ),