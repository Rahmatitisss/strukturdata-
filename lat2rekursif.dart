void generateCombinations(String chars, String prefix, int length, List<String> results) {
  if (prefix.length == length) {
    results.add(prefix);
    return;
  }
  
  for (int i = 0; i < chars.length; i++) {
    generateCombinations(chars, prefix + chars[i], length, results);
  }
}

void main() {
  int n = 3; // Jumlah karakter dalam kombinasi
  String characters = "abc"; // Karakter yang digunakan dalam kombinasi
  List<String> results = [];
  
  generateCombinations(characters, "", n, results);
  print(results.join(" "));
}


