import 'package:flutter/material.dart';
import 'package:integration_api/services/apiservice.dart';
import 'package:integration_api/models/product.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product')),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                Product product = snapshot.data![index];
                return ListTile(
                  title: Text(product.kode_product),
                  subtitle: Text(product.nama_product),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load product'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
