class TNode {
  int value;
  TNode? left;
  TNode? right;

  TNode(this.value);
}

class BinarySearchTree {
  TNode? root;

  // Insert node ke dalam BST
  void insert(int value) {
    root = _insertNode(root, value);
  }

  TNode _insertNode(TNode? node, int value) {
    if (node == null) return TNode(value);
    if (value < node.value) {
      node.left = _insertNode(node.left, value);
    } else {
      node.right = _insertNode(node.right, value);
    }
    return node;
  }

  // ✅ Method untuk menyalin pohon (deep copy)
  TNode? copyTree(TNode? t) {
    if (t == null) return null;
    TNode newNode = TNode(t.value);
    newNode.left = copyTree(t.left);
    newNode.right = copyTree(t.right);
    return newNode;
  }

  // Optional: inOrder traversal untuk mengecek isi pohon
  void inOrder(TNode? node) {
    if (node != null) {
      inOrder(node.left);
      print(node.value);
      inOrder(node.right);
    }
  }
}

void main() {
  BinarySearchTree tree1 = BinarySearchTree();
  tree1.insert(50);
  tree1.insert(30);
  tree1.insert(70);
  tree1.insert(20);
  tree1.insert(40);

  print("Pohon asli (tree1):");
  tree1.inOrder(tree1.root);

  // Salin tree1 ke tree2
  BinarySearchTree tree2 = BinarySearchTree();
  tree2.root = tree1.copyTree(tree1.root);

  print("Salinan pohon (tree2):");
  tree2.inOrder(tree2.root);
}
