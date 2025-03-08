import 'dart:io';

// Fungsi rekursif untuk menghitung nilai segitiga Pascal
int pascal(int row, int col) {
  if (col == 0 || col == row) {
    return 1; // Basis rekursi (pinggir segitiga)
  }
  return pascal(row - 1, col - 1) + pascal(row - 1, col); // Rumus rekursif
}

// Fungsi untuk mencetak segitiga Pascal dengan rata tengah
void printPascal(int n) {
  for (int i = 0; i < n; i++) {
    // Memberikan spasi untuk membuat rata tengah
    stdout.write(' ' * (n - i));
    
    // Mencetak angka di setiap baris
    for (int j = 0; j <= i; j++) {
      stdout.write('${pascal(i, j)} ');
    }
    print('');
  }
}

void main() {
  int n = 6; // Jumlah baris
  printPascal(n);
}
