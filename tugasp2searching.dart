import 'dart:io';
import 'dart:math';

int binarySearchOnUnsorted(List<int> data, int target) {
  // Simpan pasangan (indeks asli, nilai)
  List<MapEntry<int, int>> indexedData = data.asMap().entries.toList();

  // Urutkan berdasarkan nilai
  indexedData.sort((a, b) => a.value.compareTo(b.value));

  // Pisahkan nilai dan indeks asli
  List<int> sortedValues = indexedData.map((e) => e.value).toList();
  List<int> originalIndices = indexedData.map((e) => e.key).toList();

  // Binary search
  int left = 0;
  int right = sortedValues.length - 1;

  while (left <= right) {
    int mid = (left + right) ~/ 2;

    if (sortedValues[mid] == target) {
      // Kembalikan indeks asli
      return originalIndices[mid];
    } else if (sortedValues[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return -1; // Tidak ditemukan
}

void main() {
  // Buat data acak
  final random = Random();
  List<int> data = List.generate(10, (_) => random.nextInt(100));
  print("Data acak: $data");

  // Input target dari pengguna
  stdout.write("Masukkan nilai yang ingin dicari: ");
  int? target = int.tryParse(stdin.readLineSync()!);

  if (target == null) {
    print("Input tidak valid.");
    return;
  }

  int result = binarySearchOnUnsorted(data, target);

  if (result != -1) {
    print("Nilai $target ditemukan pada indeks asli: $result");
  } else {
    print("Nilai $target tidak ditemukan dalam data.");
  }
}
