import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'data.dart';

class HalamanWisata extends StatelessWidget {
  const HalamanWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Sumatera Utara'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Jumlah kolom menyesuaikan lebar area konten (3 ukuran)
          final jumlahKolom = switch (constraints.maxWidth) {
            < 600 => 2, // Ponsel
            < 900 => 3, // Tablet
            _ => 4, // Layar lebar / desktop
          };

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: jumlahKolom,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.78,
            ),
            itemCount: daftarDestinasi.length,
            itemBuilder: (context, i) =>
                KartuDestinasi(destinasi: daftarDestinasi[i]),
          );
        },
      ),
    );
  }
}

class KartuDestinasi extends StatelessWidget {
  const KartuDestinasi({super.key, required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go('/destinasi/${destinasi.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                destinasi.gambar,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  color: skema.surfaceContainerHighest,
                  child: Icon(
                    Icons.landscape_outlined,
                    size: 48,
                    color: skema.primary,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destinasi.nama,
                    style: teks.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.place_outlined, size: 14),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          destinasi.kabupaten,
                          style: teks.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tiket: ${destinasi.hargaTiket}',
                    style: teks.labelMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}