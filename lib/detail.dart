import 'package:flutter/material.dart';
import 'package:myapp/format_rupiah.dart';
import 'package:myapp/keranjang.dart';
import 'package:myapp/keranjang_page.dart';
import 'package:myapp/produk_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.produk});
  final Produk produk;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Tambah Produk',
                style: TextStyle(color: Colors.pink),
              ),
              const VerticalDivider(),
              InkWell(
                onTap: () => Provider.of<Keranjang>(context, listen: false)
                    .tambahKeranjang(produk),
                child: const Icon(
                  Icons.add,
                  color: Colors.pink,
                ),
              )
            ],
          )),
      appBar: AppBar(title: const Text('Detail Produk'), actions: [
        IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const KeranjangPage(),
                )),
            icon: Badge(
                label: Consumer<Keranjang>(
                    builder: (context, value, child) =>
                        Text('${value.jmlKeranjang}')),
                child: const Icon(Icons.shopping_bag))),
      ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: Image.network(
                produk.image,
                width: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Colors.pink, borderRadius: BorderRadius.circular(8)),
              child: Text(
                produk.category.toUpperCase(),
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              produk.title,
              style: const TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatRupiah(produk.price),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
                Wrap(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text('(${produk.rate})', style: const TextStyle(fontSize: 18))
                  ],
                ),
              ],
            ),
            const Text('DESKRIPSI PRODUK',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Card(
              color: Colors.amber.shade100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(produk.description),
              ),
            )
          ],
        ),
      ),
    );
  }
}
