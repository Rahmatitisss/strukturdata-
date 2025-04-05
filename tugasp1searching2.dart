int binarySearch(List<int> arr, int target) {
  int low = 0;
  int high = arr.length - 1;
  int comparisons = 0;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    comparisons++;

    if (arr[mid] == target) {
      print("Elemen ditemukan pada indeks $mid");
      print("Jumlah perbandingan: $comparisons");
      return mid;
    } else if (arr[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  print("Elemen tidak ditemukan");
  print("Jumlah perbandingan: $comparisons");
  return -1;
}
