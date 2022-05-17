import 'package:flutter/material.dart';
import 'package:search_app/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchProduct = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (String value) {
                  setState(() {
                    searchProduct = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Search product",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
            searchProduct.isNotEmpty &&
                    products
                        .where((element) => element.contains(searchProduct))
                        .toList()
                        .isEmpty
                ? Center(
                    child: Text("Sorry..  This product is not on stock"),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchProduct.trim().isEmpty
                        ? products.length
                        : products
                            .where((element) => element.contains(searchProduct))
                            .toList()
                            .length,
                    itemBuilder: (context, index) {
                      String product = searchProduct.trim().isEmpty
                          ? products[index]
                          : products
                              .where(
                                  (element) => element.contains(searchProduct))
                              .toList()[index];
                      return ListTile(
                        title: Text(product),
                      );
                    }),
          ],
        ),
      ),
    );
  }
}
