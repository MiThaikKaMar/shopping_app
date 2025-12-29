import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imgUrl;
  final Color bgColor;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imgUrl,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          Text("\$$price", style: Theme.of(context).textTheme.bodySmall),
          Center(child: Image.asset(imgUrl, height: 175)),
        ],
      ),
    );
  }
}
