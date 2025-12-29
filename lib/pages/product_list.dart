import 'package:flutter/material.dart';

import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/widgets/product_card.dart';
import 'package:shop_app_flutter/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = ["All", "Addias", "Nike", "Bata"];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(109, 101, 101, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
    );

    //final displayWidth = MediaQuery.of(context).size.width;
    final displayWidth = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Shoe\nCollection",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hint: Text("Search"),
                  hintStyle: TextStyle(fontSize: 16),
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
                  border: border,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (BuildContext context, int index) {
              String filter = filters[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                  child: Chip(
                    backgroundColor: selectedFilter == filter
                        ? Theme.of(context).primaryColor
                        : Color.fromRGBO(245, 247, 249, 1),
                    side: BorderSide(
                      color: selectedFilter == filter
                          ? Theme.of(context).primaryColor
                          : Color.fromRGBO(245, 247, 249, 1),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    label: Text(filter, style: TextStyle(fontSize: 16)),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: displayWidth > 650
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    Map<String, Object> product = products[index];
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(productObject: product),
                        ),
                      ),
                      child: ProductCard(
                        title: product["title"] as String,
                        price: product["price"] as double,
                        imgUrl: product["imageUrl"] as String,
                        bgColor: index.isEven
                            ? Color.fromRGBO(216, 240, 253, 1)
                            : Color.fromRGBO(245, 247, 249, 1),
                      ),
                    );
                  },
                )
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    Map<String, Object> product = products[index];
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(productObject: product),
                        ),
                      ),
                      child: ProductCard(
                        title: product["title"] as String,
                        price: product["price"] as double,
                        imgUrl: product["imageUrl"] as String,
                        bgColor: index.isEven
                            ? Color.fromRGBO(216, 240, 253, 1)
                            : Color.fromRGBO(245, 247, 249, 1),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
