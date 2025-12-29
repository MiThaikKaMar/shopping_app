import 'package:flutter/material.dart';
import 'package:shop_app_flutter/pages/cart_page.dart';

import 'package:shop_app_flutter/pages/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  final List<Widget> pages = [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: currentPageIndex, children: pages),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) => setState(() {
          currentPageIndex = value;
        }),
        items: [
          BottomNavigationBarItem(label: "", icon: Icon(Icons.home, size: 35)),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.shopping_cart, size: 35),
          ),
        ],
      ),
    );
  }
}
