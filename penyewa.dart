class Penyewa {
  String id;
  String nama;
  String kamar;
  double biaya;

  Penyewa(this.id, this.nama, this.kamar, this.biaya);

  @override
  String toString() {
    return 'Penyewa(id: $id, nama: $nama, kamar: $kamar, biaya: $biaya)';
  }
}