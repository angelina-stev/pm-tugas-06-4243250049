class Destinasi {
  const Destinasi({
    required this.id,
    required this.nama,
    required this.kabupaten,
    required this.kategori,
    required this.deskripsi,
    required this.hargaTiket,
    required this.gambar,
  });

  final int id;
  final String nama;
  final String kabupaten;
  final String kategori;
  final String deskripsi;
  final String hargaTiket;
  final String gambar;
}

const daftarDestinasi = <Destinasi>[
  Destinasi(
    id: 1,
    nama: 'Danau Toba & Pulau Samosir',
    kabupaten: 'Kab. Samosir',
    kategori: 'Danau',
    deskripsi:
        'Danau vulkanik terbesar di Asia Tenggara dengan panorama perbukitan hijau serta wisata budaya Batak di Tomok dan Tuk-Tuk.',
    hargaTiket: 'Rp15.000',
    gambar: 'assets/images/danau_toba.jpg',
  ),
  Destinasi(
    id: 2,
    nama: 'Ekowisata Bukit Lawang',
    kabupaten: 'Kab. Langkat',
    kategori: 'Alam & Satwa',
    deskripsi:
        'Kawasan konservasi di tepi Taman Nasional Gunung Leuser yang terkenal sebagai pusat rehabilitasi orangutan Sumatera dan river tubing.',
    hargaTiket: 'Rp25.000',
    gambar: 'assets/images/bukit_lawang.jpg',
  ),
  Destinasi(
    id: 3,
    nama: 'Air Terjun Sipiso-piso',
    kabupaten: 'Kab. Karo',
    kategori: 'Air Terjun',
    deskripsi:
        'Air terjun setinggi 120 meter di sisi utara kaldera Danau Toba dengan udara sejuk dataran tinggi Karo.',
    hargaTiket: 'Rp10.000',
    gambar: 'assets/images/sipiso_piso.jpg',
  ),
  Destinasi(
    id: 4,
    nama: 'Istana Maimun',
    kabupaten: 'Kota Medan',
    kategori: 'Sejarah',
    deskripsi:
        'Istana peninggalan Kesultanan Deli yang memadukan arsitektur Melayu, Islam, India, dan Eropa dengan dominasi warna kuning khas Melayu.',
    hargaTiket: 'Rp10.000',
    gambar: 'assets/images/istana_maimun.jpg',
  ),
  Destinasi(
    id: 5,
    nama: 'Taman Alam Lumbini',
    kabupaten: 'Kab. Karo',
    kategori: 'Religi & Taman',
    deskripsi:
        'Replika Pagoda Shwedagon berlapis cat emas yang dikelilingi taman bunga rapi di kawasan Berastagi.',
    hargaTiket: 'Gratis',
    gambar: 'assets/images/lumbini.jpg',
  ),
  Destinasi(
    id: 6,
    nama: 'Bukit Holbung',
    kabupaten: 'Kab. Samosir',
    kategori: 'Perbukitan',
    deskripsi:
        'Rangkaian perbukitan savana dengan jalur trekking ringan untuk menikmati pemandangan Danau Toba dari ketinggian.',
    hargaTiket: 'Rp10.000',
    gambar: 'assets/images/bukit_holbung.jpg',
  ),
];

Destinasi? cariDestinasi(int id) {
  for (final item in daftarDestinasi) {
    if (item.id == id) return item;
  }
  return null;
}