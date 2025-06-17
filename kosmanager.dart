import 'dart:io';
import 'penyewa.dart';
import 'penyimpanan.dart';
import 'pembayaran.dart';
import 'undo_stack.dart';

class KosManager {
  final PenyimpananKos penyimpanan = PenyimpananKos();
  final AntrianPembayaran antrian = AntrianPembayaran();
  final UndoStack undoStack = UndoStack();

  void tambahPenyewa() {
    stdout.write("Masukkan ID penyewa: ");
    String id = stdin.readLineSync()!;
    stdout.write("Masukkan nama penyewa: ");
    String nama = stdin.readLineSync()!;
    stdout.write("Masukkan nomor kamar: ");
    String kamar = stdin.readLineSync()!;
    stdout.write("Masukkan biaya sewa: ");
    double biaya = double.parse(stdin.readLineSync()!);

    var penyewa = Penyewa(id, nama, kamar, biaya);
    penyimpanan.tambah(penyewa);
    undoStack.simpan(() => penyimpanan.hapus(id));

    print("Penyewa berhasil ditambahkan.");
  }

  void tampilkanSemua() {
    print("\nDaftar Penyewa:");
    penyimpanan.semua().forEach((p) => print(p));
  }

  void tambahPembayaran() {
    stdout.write("Masukkan ID penyewa yang membayar: ");
    String id = stdin.readLineSync()!;
    var penyewa = penyimpanan.ambil(id);
    if (penyewa != null) {
      antrian.tambah(penyewa);
      print("Pembayaran ditambahkan ke antrian.");
    } else {
      print("Penyewa tidak ditemukan.");
    }
  }

  void prosesPembayaran() {
    var diproses = antrian.proses();
    if (diproses != null) {
      print("Pembayaran diproses: ${diproses.nama}");
    } else {
      print("Antrian kosong.");
    }
  }

  void batalkanAksi() {
    undoStack.undo();
    print("Aksi terakhir dibatalkan.");
  }
}