import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/produk_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Keranjang extends ChangeNotifier {
  List<Produk> _listProduk = [];
  List<Produk> get listProduk => _listProduk;
  int get jmlKeranjang => _listProduk.length;
  num get hitungTotal => _totalBayar();

  Keranjang() {
    _getKeranjang();
  }

  Future<void> _getKeranjang() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? listJson = prefs.getStringList('listKeranjang');
    if (listJson != null) {
      _listProduk = listJson
          .map(
            (json) => Produk.fromJson(jsonDecode(json)),
          )
          .toList();
      notifyListeners();
    }
  }

  Future<void> tambahKeranjang(Produk produk) async {
    _listProduk.add(produk);
    notifyListeners();
  }

  Future<void> hapusProduk(int id) async {
    _listProduk.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  num _totalBayar() {
    num total = 0;
    for (var element in _listProduk) {
      total += element.price;
    }
    return total;
  }
}
