import 'package:flutter/material.dart';
import 'package:myapp/produk_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.produk});
  final Produk produk;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Align(
              child: Image.network(
                produk.image,
                width: 200,
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Text(produk.category),
            ),
            Text(produk.title)
          ],
        ),
      ),
    );
  }
}
