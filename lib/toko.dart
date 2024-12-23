import 'package:flutter/material.dart';
import 'package:myapp/produk_provider.dart';

class TokoPage extends StatelessWidget {
  const TokoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ambilProduk(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TampilanProduk(listProduk: snapshot.data!);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class TampilanProduk extends StatelessWidget {
  const TampilanProduk({
    super.key,
    required this.listProduk,
  });
  final List<Produk> listProduk;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        final Produk produk = listProduk[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  produk.image,
                ),
              ),
              Text(
                produk.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${produk.price}"),
                  Row(
                    children: [
                      Icon(Icons.person),
                      Text('${produk.count}'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
