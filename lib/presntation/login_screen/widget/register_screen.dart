import 'package:ecommerce/bussines_logic/register_cubit/register_cubit.dart';
import 'package:ecommerce/constances/fonts.dart';
import 'package:ecommerce/constances/role.dart';
import 'package:ecommerce/presntation/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constances/token.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController textEditingControllername=TextEditingController();
  TextEditingController textEditingControlleraddress=TextEditingController();
  TextEditingController textEditingControllerphoneNumber=TextEditingController();
  TextEditingController textEditingControlleremail=TextEditingController();
  TextEditingController textEditingControllerrole=TextEditingController();
  TextEditingController textEditingControllerpassword=TextEditingController();
  TextEditingController textEditingControllerpassconirmation=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return  Column(

children: [
  Container(
  width: width / 1.2,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white38)),
  child: TextField(
    controller: textEditingControllername,
    style: const TextStyle(color: Colors.blueGrey),
    decoration:  InputDecoration(
        hintText: 'name',
        prefixIcon: Icon(Icons.person_outline_outlined),

        hintStyle: ColorDesign.greywhite.copyWith(color: Colors.blueGrey)),
  ),
),
SizedBox(height: 20,),
  Container(
    width: width / 1.2,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white38)),
    child: TextField(
      controller: textEditingControlleraddress,
      style: const TextStyle(color: Colors.blueGrey),
      decoration:  InputDecoration(
          hintText: 'address',
          prefixIcon: Icon(Icons.home_outlined),

    hintStyle: ColorDesign.greywhite.copyWith(color: Colors.blueGrey),

      ),
    ),
  ),
  SizedBox(height: 20,),

  Container(
    width: width / 1.2,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white38)),
    child: TextField(
      controller: textEditingControllerphoneNumber,
      style: const TextStyle(color: Colors.blueGrey),
      decoration:  InputDecoration(
          hintText: 'phone number',
          prefixIcon: Icon(Icons.email_outlined),

    hintStyle: ColorDesign.greywhite.copyWith(color: Colors.blueGrey),),
    ),
  ),
  SizedBox(height: 20,),

  Container(
    width: width / 1.2,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white38)),
    child: TextField(
      controller: textEditingControlleremail,
      style: const TextStyle(color: Colors.blueGrey),
      decoration:  InputDecoration(
          hintText: 'email',
          prefixIcon: Icon(Icons.email_outlined),

        hintStyle: ColorDesign.greywhite.copyWith(color: Colors.blueGrey),),
    ),
  ),
  SizedBox(height: 20,),

  Container(
    width: width / 1.2,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white38)),
    child: TextField(
      controller: textEditingControllerrole,
      style: const TextStyle(color: Colors.blueGrey),
      decoration:  InputDecoration(
          hintText: 'role',
          prefixIcon: Icon(Icons.email_outlined),

        hintStyle: ColorDesign.greywhite.copyWith(color: Colors.blueGrey),),
    ),
  ),
  SizedBox(height: 20,),

  Container(
    width: width / 1.2,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white38)),
    child: TextField(
      controller: textEditingControllerpassword,
      style: const TextStyle(color: Colors.blueGrey),
      decoration:  InputDecoration(
          hintText: 'passowrd',
          prefixIcon: Icon(Icons.email_outlined),

        hintStyle: ColorDesign.greywhite.copyWith(color: Colors.blueGrey),),
    ),
  ),
  SizedBox(height: 20,),

  Container(
    width: width / 1.2,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white38)),
    child: TextField(
      controller: textEditingControllerpassconirmation,
      style: const TextStyle(color: Colors.blueGrey),
      decoration:  InputDecoration(
          hintText: 'confirm password',
          prefixIcon: Icon(Icons.email_outlined),

        hintStyle: ColorDesign.greywhite.copyWith(color: Colors.blueGrey),),
    ),
  ),
  SizedBox(height: 60,),
  Register_Button()
],

    );
  }
  Widget Register_Button() {
    return BlocConsumer<RegisterCubit, Register_State>(

  listener: (context, state) {
    // TODO: implement listener
if(state.register_status==Register_Status.success){
if(Role.role=='user'){
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Home_Screen()));
}
}
  },
  builder: (context, state) {
    return GestureDetector(
      onTap: () async{
       print(Token.token);
        await BlocProvider.of<RegisterCubit>(context).register(textEditingControllername.text, textEditingControlleraddress.text, textEditingControllerphoneNumber.text, textEditingControlleremail.text, textEditingControllerrole.text, textEditingControllerpassword.text, textEditingControllerpassconirmation.text);
   if(state.register_status==Register_Status.success){

     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Home_Screen()));

   }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueGrey,
        ),
        width: 120,
        height: 40,
        child: Center(
            child: Text(
              'Sign up',
              style: ColorDesign.boldwhite.copyWith(fontSize: 16),
            )),
      ),
    );
  },
);
  }
}
