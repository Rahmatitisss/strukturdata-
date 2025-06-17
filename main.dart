import 'dart:io';
import 'kosmanager.dart';

void main() {
  KosManager manager = KosManager();

  while (true) {
    print("\nDaftarPilihan:");
    print("1. Tambah penyewa");
    print("2. Lihat semua penyewa");
    print("3. Tambah pembayaran");
    print("4. Proses pembayaran");
    print("5. Undo aksi terakhir");
    print("6. Keluar");

    stdout.write("Pilih opsi (1-6): ");
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        manager.tambahPenyewa();
        break;
      case '2':
        manager.tampilkanSemua();
        break;
      case '3':
        manager.tambahPembayaran();
        break;
      case '4':
        manager.prosesPembayaran();
        break;
      case '5':
        manager.batalkanAksi();
        break;
      case '6':
        print("Program selesai.");
        exit(0);
      default:
        print("Pilihan tidak valid.");
    }
  }
}