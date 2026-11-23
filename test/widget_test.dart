import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pm_tugas_06_4243250049/main.dart';

void main() {
  testWidgets('Navigasi dari daftar destinasi ke halaman detail berjalan baik',
      (tester) async {
    await tester.pumpWidget(const WisataSumutApp());

    // Pastikan judul aplikasi dan destinasi pertama tampil
    expect(find.text('Wisata Sumatera Utara'), findsOneWidget);
    expect(find.text('Danau Toba & Pulau Samosir'), findsOneWidget);

    // Tekan kartu destinasi pertama
    await tester.tap(find.text('Danau Toba & Pulau Samosir'));
    await tester.pumpAndSettle();

    // Pastikan halaman detail terbuka beserta Chip kategori dan tombol kembali
    expect(find.text('Danau'), findsOneWidget);
    expect(find.text('Deskripsi Wisata'), findsOneWidget);
    expect(find.byType(BackButton), findsOneWidget);
  });
}