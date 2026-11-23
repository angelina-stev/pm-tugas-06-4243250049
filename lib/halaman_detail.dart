import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'data.dart';

class HalamanDetail extends StatelessWidget {
  const HalamanDetail({super.key, required this.destinasi});

  final Destinasi? destinasi;

  @override
  Widget build(BuildContext context) {
    final item = destinasi;

    // Penanganan jika ID di URL tidak ditemukan
    if (item == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Destinasi Tidak Ditemukan')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.search_off, size: 64),
                const SizedBox(height: 12),
                const Text(
                  'Data destinasi dengan ID tersebut tidak ditemukan.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => context.go('/'),
                  child: const Text('Kembali ke Daftar'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    // Visual utama dengan Stack (badge kategori & harga di atas foto)
    final bagianVisual = AspectRatio(
      aspectRatio: 4 / 3,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              item.gambar,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: skema.surfaceContainerHighest,
                child: Icon(
                  Icons.landscape_outlined,
                  size: 96,
                  color: skema.primary,
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Chip(
              avatar: const Icon(Icons.category_outlined, size: 18),
              label: Text(item.kategori),
            ),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: skema.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Tiket: ${item.hargaTiket}',
                style: teks.labelLarge?.copyWith(
                  color: skema.onPrimaryContainer,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    final bagianInfo = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.nama, style: teks.headlineSmall),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 20, color: skema.primary),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  item.kabupaten,
                  style: teks.titleMedium?.copyWith(color: skema.primary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('Deskripsi Wisata', style: teks.titleSmall),
          const SizedBox(height: 6),
          Text(item.deskripsi, style: teks.bodyLarge),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(item.nama)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Layar lebar (>= 700 dp): foto & info berdampingan
          if (constraints.maxWidth >= 700) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: bagianVisual),
                Expanded(
                  child: SingleChildScrollView(child: bagianInfo),
                ),
              ],
            );
          }

          // Layar sempit (< 700 dp): tersusun vertikal
          return ListView(
            children: [bagianVisual, bagianInfo],
          );
        },
      ),
    );
  }
}