import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> productObject;

  const ProductDetailsPage({super.key, required this.productObject});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;

  @override
  void initState() {
    super.initState();
  }

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addItem({
        'id': widget.productObject["id"],
        'title': widget.productObject["title"],
        'price': widget.productObject["price"],
        'imageUrl': widget.productObject["imageUrl"],
        'company': widget.productObject["company"],
        'size': selectedSize,
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Item added successfully")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please select a size.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Column(
        children: [
          Text(
            widget.productObject["title"] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(
              widget.productObject["imageUrl"] as String,
              height: 250,
            ),
          ),
          Spacer(flex: 2),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "\$${widget.productObject["price"]}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.productObject["sizes"] as List).length,
                    itemBuilder: (context, index) {
                      int size = (widget.productObject["sizes"] as List)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : null,
                            label: Text("$size"),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  width: 350,
                  child: FilledButton.icon(
                    onPressed: () {
                      onTap();
                    },
                    icon: Icon(Icons.shopping_bag, color: Colors.black),
                    label: Text(
                      "Add to cart",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
