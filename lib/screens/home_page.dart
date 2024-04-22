import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> productList = [];
  bool isLoading = true;

  Future<void> fetchAllProducts() async {
    var client = http.Client();
    var response =
        await client.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      print("success");
      var jsonData = jsonDecode(response.body);
      for (var products in jsonData) {
        productList.add(Product.fromJson(products));
      }
      print(productList);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:isLoading?const Center(child: CircularProgressIndicator(),) :GridView.builder(
      itemCount: productList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 200,
            child: Column(
              children: [
                Expanded(child: Image.network(productList[index].image,),),
                Expanded(child:  Text(productList[index].title))

              ],
            ),
          ),
        );
      },
    ));
  }
}
