import 'package:ecommerce/presntation/fav_screen/fav_screen.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  @override

  Widget build(BuildContext context) {
    int selected=0;

    return StylishBottomBar(
backgroundColor: Colors.white,
      notchStyle: NotchStyle.circle,

      items: [
        BottomBarItem(
          icon: const Icon(Icons.cabin),
          title: const Text('Home'),
          backgroundColor: Colors.blueGrey,
          selectedIcon: const Icon(Icons.read_more),
        ),
        BottomBarItem(
          icon: const Icon(Icons.favorite_border_outlined),
          title: const Text('Fav'),
          backgroundColor: Colors.blueGrey,
          selectedIcon: const Icon(Icons.read_more),
        ),
        BottomBarItem(
          icon: const Icon(Icons.credit_card_outlined),
          title: const Text('Cart'),
          backgroundColor: Colors.blueGrey,
          selectedIcon: const Icon(Icons.read_more),
        ),
      ],
      hasNotch: true,
      currentIndex:selected ,
      onTap: (index){
        setState(() {
          selected=index;
if(selected==1){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Fav_Screen()));}
        });
      },
      option: AnimatedBarOptions(
        iconSize: 32,
        barAnimation: BarAnimation.fade ,
        iconStyle: IconStyle.animated,
        inkColor: Colors.black12,
        inkEffect: true ,
        opacity: 0.1,
      ),
    );
  }
}
