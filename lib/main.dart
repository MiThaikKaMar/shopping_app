import 'package:flutter/material.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';
import 'package:shop_app_flutter/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(254, 206, 1, 1),
            primary: Color.fromRGBO(254, 206, 1, 1),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          ),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}
