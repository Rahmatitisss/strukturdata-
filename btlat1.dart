class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinarySearchTree {
  Node? root;

  // Method untuk menambahkan node
  void insert(int value) {
    root = _insertNode(root, value);
  }

  Node _insertNode(Node? node, int value) {
    if (node == null) return Node(value);

    if (value < node.value) {
      node.left = _insertNode(node.left, value);
    } else {
      node.right = _insertNode(node.right, value);
    }

    return node;
  }

  // ✅ Method untuk mendapatkan nilai terkecil (first)
  int? first() {
    if (root == null) return null;

    Node current = root!;
    while (current.left != null) {
      current = current.left!;
    }
    return current.value;
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(50);
  bst.insert(30);
  bst.insert(70);
  bst.insert(20);
  bst.insert(40);

  print("Nilai terkecil (first): ${bst.first()}"); // Output: 20
}