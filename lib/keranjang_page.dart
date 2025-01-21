import 'package:flutter/material.dart';
import 'package:myapp/format_rupiah.dart';
import 'package:myapp/keranjang.dart';
import 'package:provider/provider.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<Keranjang>(builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: value.listProduk.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      confirmDismiss: (_) async {
                        bool konfirm = await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Hapus Produk'),
                            content: const Text(
                                'Apakah anda yakin ingin hapus produk'),
                            actions: [
                              TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text('Tidak')),
                              TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text('Ya')),
                            ],
                          ),
                        );
                        return konfirm;
                      },
                      onDismissed: (_) =>
                          Provider.of<Keranjang>(context, listen: false)
                              .hapusProduk(value.listProduk[index].id),
                      direction: DismissDirection.endToStart,
                      key: GlobalKey(),
                      child: ListTile(
                        leading: AspectRatio(
                            aspectRatio: 1 / 1,
                            child:
                                Image.network(value.listProduk[index].image)),
                        title: Text(value.listProduk[index].title),
                        subtitle:
                            Text(formatRupiah(value.listProduk[index].price)),
                      ),
                    );
                  }),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Column(
                children: [
                  Text(
                    'Total Bayar',
                    style: TextStyle(fontSize: 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Harga'),
                      Text(formatRupiah(value.hitungTotal))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Item'),
                      Text('${value.jmlKeranjang} Produk')
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      }),
      bottomNavigationBar: InkWell(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            height: 300,
            color: Colors.white,
            
          )
        ),
        child: Container(
          height: 30,
          color: Colors.brown,
          child: Align(
              child: Text(
            'Bayar',
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
