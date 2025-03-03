void alihkanTugasJikaTidakHadir(
    List<String> pemanen, Map<String, List<int>> tugas, String yangTidakHadir) {
  int indexPemanenTidakHadir = pemanen.indexOf(yangTidakHadir);

  if (indexPemanenTidakHadir == -1) {
    print('Pemanen $yangTidakHadir tidak ditemukan.');
    return;
  }

  // Cari tetangga terdekat
  String tetangga = '';
  if (indexPemanenTidakHadir > 0) {
    tetangga = pemanen[indexPemanenTidakHadir - 1]; // Prioritas tetangga kiri
  }
  if (indexPemanenTidakHadir < pemanen.length - 1) {
    // Kalau ada tetangga kanan, dia yang diambil
    tetangga = pemanen[indexPemanenTidakHadir + 1];
  }

  print('Tugas $yangTidakHadir akan dialihkan ke $tetangga');

  // Pindahkan tugas dari yang tidak hadir ke tetangga
  if (tugas.containsKey(tetangga)) {
    List<int> tugasTidakHadir = tugas[yangTidakHadir] ?? [];
    for (int baris in tugasTidakHadir) {
      if (!tugas[tetangga]!.contains(baris)) {
        tugas[tetangga]!.add(baris);
      }
    }
  }

  // Hapus data pemanen yang tidak hadir
  tugas.remove(yangTidakHadir);
}

void main() {
  // INPUTAN dari user (bisa diganti sesuai kebutuhan)
  List<String> pemanen = ['Ucok', 'Siti', 'Budi', 'Andi', 'Rina'];
  Map<String, List<int>> tugas = {
    'Ucok': [1, 2],
    'Siti': [3, 4],
    'Budi': [5, 6],
    'Andi': [7, 8],
    'Rina': [9, 10]
  };

  // Pemanen yang tidak hadir (contoh inputan user)
  String yangTidakHadir = 'Siti';

  // Proses pengalihan tugas
  alihkanTugasJikaTidakHadir(pemanen, tugas, yangTidakHadir);

  // TAMPILKAN HASIL AKHIR
  for (var pemanenName in pemanen) {
    print('Pemanen: $pemanenName');
    print('Tugas:');
    if (tugas.containsKey(pemanenName)) {
      for (var baris in tugas[pemanenName]!) {
        print('Baris $baris: belum');
      }
    }
    print('');
  }
}
