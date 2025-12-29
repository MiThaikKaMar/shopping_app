import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    //final cartItems = Provider.of<CartProvider>(context).cartItems;
    final cartItems = context.watch<CartProvider>().cartItems;
    return Scaffold(
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem["imageUrl"] as String),
            ),
            title: Text(
              cartItem["title"] as String,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text("Size: ${cartItem["size"]}"),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Delete Item",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text(
                        "Are you sure you want to delete this item?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "No",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<CartProvider>().removeItem(cartItem);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Yes",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );

                //Provider.of<CartProvider>(context).removeItem(cartItem);
              },
            ),
          );
        },
      ),
    );
  }
}
