import 'package:flutter/material.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: ListView(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ColoredBox(color: skema.primaryContainer),
                ),
                Positioned(
                  right: -16,
                  bottom: -20,
                  child: Icon(
                    Icons.map_outlined,
                    size: 150,
                    color: skema.primary.withValues(alpha: 0.2),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  right: 20,
                  child: Text(
                    'Panduan Wisata Sumatera Utara',
                    style: teks.headlineSmall?.copyWith(
                      color: skema.onPrimaryContainer,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Informasi Destinasi'),
            subtitle: Text(
              'Menampilkan rekomendasi wisata alam, budaya, dan sejarah di Sumatera Utara.',
            ),
          ),
          const ListTile(
            leading: Icon(Icons.devices),
            title: Text('Desain Responsif'),
            subtitle: Text(
              'Menyesuaikan tampilan otomatis dari layar ponsel hingga tablet dan desktop.',
            ),
          ),
          const ListTile(
            leading: Icon(Icons.school_outlined),
            title: Text('Tugas Rutin 6 — Pemrograman Mobile'),
            subtitle: Text('Ilmu Komputer, FMIPA Universitas Negeri Medan'),
          ),
        ],
      ),
    );
  }
}