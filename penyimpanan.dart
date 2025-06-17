import 'penyewa.dart';

class PenyimpananKos {
  final Map<String, Penyewa> _data = {};

  void tambah(Penyewa p) {
    _data[p.id] = p;
  }

  void hapus(String id) {
    _data.remove(id);
  }

  Penyewa? ambil(String id) {
    return _data[id];
  }

  List<Penyewa> semua() {
    return _data.values.toList();
  }
}