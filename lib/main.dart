import 'package:ecommerce/bussines_logic/add_prd_to_fav/add_fav_cubit.dart';
import 'package:ecommerce/bussines_logic/getProductById_cubit/get_product_by_id_cubit.dart';
import 'package:ecommerce/bussines_logic/getall_product_cubit/getall_product_cubit.dart';
import 'package:ecommerce/bussines_logic/getfavcubit/getfav_cubit.dart';
import 'package:ecommerce/bussines_logic/login_cubit/login_cubit.dart';
import 'package:ecommerce/bussines_logic/register_cubit/register_cubit.dart';
import 'package:ecommerce/presntation/home_screen/home_screen.dart';
import 'package:ecommerce/presntation/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bussines_logic/getallcategory_cubit/getall_category_cubit.dart';
import 'bussines_logic/getproductbycat_cubit/getproductbycat_cubit.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => RegisterCubit()),
    BlocProvider(create: (context) => LoginCubit()),
    BlocProvider(create: (context) => GetallCategoryCubit()),
    BlocProvider(create: (context) => GetAllProductCubit()),
    BlocProvider(create: (context) => GetproductbycatCubit()),
    BlocProvider(create: (context) => GetProductByIdCubit()),
    BlocProvider(create: (context) => GetfavCubit()),
    BlocProvider(create: (context) => AddFavCubit()),

  ],
child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
debugShowCheckedModeBanner: false,
      home:  LoginScreen(),
    );
  }
}

