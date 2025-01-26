import 'package:ecommerce/bussines_logic/login_cubit/login_cubit.dart';
import 'package:ecommerce/constances/fonts.dart';
import 'package:ecommerce/constances/token.dart';
import 'package:ecommerce/presntation/login_screen/widget/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constances/role.dart';
import '../home_screen/navigateion_bar.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isregister = false;
  bool obsecuretext = true;
  TextEditingController textEditingControlleremail = TextEditingController();
  TextEditingController textEditingControllerpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/img_4.png',
                height: height / 2.5,
                width: width,
              ),
              const Text(
                'Getting Started ',
                style: ColorDesign.boldwhite,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                isregister == false ? 'Welcome back, glad to see tou again ' : 'Hello you will be interesting in our app',
                style: ColorDesign.greywhite.copyWith(color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 40,
              ),
              isregister == false ? logTextField() : const RegisterScreen(),
              const SizedBox(
                height: 60,
              ),
              isregister == false ? LogInButton() : Container(),
              const SizedBox(
                height: 60,
              ),
              isregister == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account? ', style: ColorDesign.greywhite.copyWith(color: Colors.blueGrey)),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                isregister = !isregister;
                              });
                            },
                            child: const Text(
                              'Sign up here',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                              ),
                            ))
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('You have an account? ', style: ColorDesign.greywhite.copyWith(color: Colors.blueGrey)),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                isregister = !isregister;
                              });
                            },
                            child: const Text(
                              'Log In from here',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                              ),
                            ))
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget logTextField() {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: width / 1.2,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white38)),
          child: TextField(
            controller: textEditingControlleremail,
            style: const TextStyle(color: Colors.blueGrey),
            decoration: InputDecoration(
                hintText: 'email',
                prefixIcon: Icon(Icons.email_outlined),
                hintStyle: ColorDesign.greywhite.copyWith(color: Colors.blueGrey)),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: width / 1.2,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white38)),
          child: TextField(
            obscureText: obsecuretext,
            controller: textEditingControllerpassword,
            style: const TextStyle(color: Colors.blueGrey),
            decoration: InputDecoration(
                hintText: 'password',
                prefixIcon: const Icon(Icons.lock_outlined),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.remove_red_eye,
                  ),
                  onPressed: () {
                    setState(() {
                      obsecuretext = !obsecuretext;
                    });
                  },
                ),
                hintStyle: ColorDesign.greywhite.copyWith(color: Colors.blueGrey)),
          ),
        ),
      ],
    );
  }

  Widget LogInButton() {
    return BlocConsumer<LoginCubit, LogIn_State>(
      listener: (context, state) {
        if (state.logIn_Status == LogIn_Status.success) {
          if (Role.role == 'user') {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Home_Screen()));
          }
        }
      },
      builder: (context, state) {
        if (state.logIn_Status == LogIn_Status.loading) {
          return SizedBox(
            height: 20,
            width: 20,
            child: Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            ),
          );
        }
        return GestureDetector(
          onTap: () async {
            await BlocProvider.of<LoginCubit>(context)
                .login(textEditingControlleremail.text, textEditingControllerpassword.text);
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
              'Log IN',
              style: ColorDesign.boldwhite.copyWith(fontSize: 16),
            )),
          ),
        );
      },
    );
  }
}
