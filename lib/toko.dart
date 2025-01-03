import 'package:flutter/material.dart';
import 'package:myapp/detail.dart';
import 'package:myapp/format_rupiah.dart';
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
          return const Center(child: CircularProgressIndicator());
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
    return Column(
      children: [
        SizedBox(
            height: 30,
            child: FutureBuilder(
              future: ambilKategori(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List listKategori = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listKategori.length,
                    itemBuilder: (context, index) {
                      final String kategori = listKategori[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          kategori,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: LinearProgressIndicator(),
                );
              },
            )),
        Expanded(
          child: GridView.builder(
            itemCount: listProduk.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              final Produk produk = listProduk[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                // bungkus Column dengan GestureDetector
                // tambah properti onTap -> Navigator.push
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(produk: produk),
                      )),
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
                        style: const TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatRupiah(produk.price)),
                          Row(
                            children: [
                              const Icon(Icons.person),
                              Text("${produk.count}"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
