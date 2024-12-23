import 'package:flutter/material.dart';
import 'package:myapp/galeri.dart';
import 'package:myapp/toko.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int halSaatIni = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          selectedIndex: halSaatIni,
          onDestinationSelected: (value) {
            setState(() {
              halSaatIni = value;
            });
          },
          indicatorColor: Colors.lightGreen,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.browse_gallery),
              label: 'Galeri',
            ),
            NavigationDestination(
              icon: Icon(Icons.store),
              label: 'Toko',
            ),
          ]),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        title: const Text(
          'Whatsapp',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: [const HomePage(), const GaleriPage(),const TokoPage()][halSaatIni],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) => ListTile(
        trailing: Text('12.0$index'),
        leading: const CircleAvatar(
          foregroundImage: NetworkImage('https://picsum.photos/id/4/200'),
        ),
        title: const Text('Samiya'),
        subtitle: Text('Pinjam dulu ${index + 1}00 kk besok ganti'),
      ),
    );
  }
}
