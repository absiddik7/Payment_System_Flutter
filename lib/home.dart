import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:payment_system/screens/cartScreen.dart';
import 'package:payment_system/screens/favoriteScreen.dart';
import 'package:payment_system/screens/shoppingScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  //botom naivation bar pages
  final pages = [
    const ShoppingScreen(),
    const FavoriteScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 8,
              backgroundColor: Colors.grey.shade100,
              tabBackgroundColor: Colors.deepOrange.shade200,
              haptic: true,
              rippleColor: Colors.green,
              hoverColor: Colors.grey,
              //tabBorderRadius: 15,
              //tabActiveBorder: Border.all(color: Colors.black, width: 1),
              // tab button shadow
              //curve: Curves.easeOutExpo, // tab animation curves
              
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Favorite',
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: 'Cart',
                ),
              ]),
        ),
      ),
    );
  }
}
