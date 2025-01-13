import 'package:flutter/material.dart';
import 'package:myapp/keranjang.dart';
import 'package:provider/provider.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<Keranjang>(builder: (context, value, child) {
        return ListView.builder(
            itemCount: value.listProduk.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(value.listProduk[index].image),
                title: Text(value.listProduk[index].title),
              );
            });
      }),
    );
  }
}
