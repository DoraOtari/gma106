import 'dart:convert';

import 'package:http/http.dart' as http;

class Produk {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final num rate;
  final int count;

  Produk({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
    required this.count,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rate: json['rating']['rate'],
      count: json['rating']['count'],
    );
  }
}

Future<List<Produk>> ambilProduk() async {
  final respon = await http.get(Uri.parse('https://fakestoreapi.com/products'));
  if (respon.statusCode == 200) {
    final List<dynamic> data = jsonDecode(respon.body);
    final List<Produk> listProduk =
        data.map((e) => Produk.fromJson(e)).toList();
    return listProduk;
  } else {
    throw Exception('gagal ambil data dari api');
  }
}

Future<List<String>> ambilKategori() async {
  final respon =
      await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));
  if (respon.statusCode == 200) {
    final List<dynamic> data = jsonDecode(respon.body);
    return List<String>.from(data);
  } else {
    throw Exception('gagal ambil data dari api');
  }
}
