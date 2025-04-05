int sequentialSearch(List<int> arr, int target) {
  int comparisons = 0;

  for (int i = 0; i < arr.length; i++) {
    comparisons++;
    if (arr[i] == target) {
      print("Elemen ditemukan pada indeks $i");
      print("Jumlah perbandingan: $comparisons");
      return i;
    }
  }

  print("Elemen tidak ditemukan");
  print("Jumlah perbandingan: $comparisons");
  return -1;
}
