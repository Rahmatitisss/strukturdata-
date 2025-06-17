import 'dart:collection';
import 'penyewa.dart';

class AntrianPembayaran {
  final Queue<Penyewa> _queue = Queue<Penyewa>();

  void tambah(Penyewa penyewa) {
    _queue.addLast(penyewa);
  }

  Penyewa? proses() {
    if (_queue.isNotEmpty) {
      return _queue.removeFirst();
    }
    return null;
  }

  List<Penyewa> semua() {
    return _queue.toList();
  }
}