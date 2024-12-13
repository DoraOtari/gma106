import 'package:flutter/material.dart';

class GaleriPage extends StatefulWidget {
  const GaleriPage({super.key});

  @override
  State<GaleriPage> createState() => _GaleriPageState();
}

class _GaleriPageState extends State<GaleriPage> {
  List isFavorit = List.generate(
    12,
    (index) => false,
  );
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 2, crossAxisSpacing: 2, crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/id/${index * 3 + 3}/200',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Gambar $index'),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorit[index] = !isFavorit[index];
                    });
                  },
                  child: isFavorit[index]
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
