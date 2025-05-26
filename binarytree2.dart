import 'dart:io';
import 'dart:collection';

class Node<T> {
  T nodeValue;
  Node<T>? left, right; 

  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;

  //  RECURSIVE TRAVERSAL 
  void printPreorder(Node<T>? node) {
    if (node != null) {
      stdout.write("${node.nodeValue} ");
      printPreorder(node.left);
      printPreorder(node.right);
    }
  }

  void printInOrder(Node<T>? node) {
    if (node != null) {
      printInOrder(node.left);
      stdout.write("${node.nodeValue} ");
      printInOrder(node.right);
    }
  }

  void printPostOrder(Node<T>? node) {
    if (node != null) {
      printPostOrder(node.left);
      printPostOrder(node.right);
      stdout.write("${node.nodeValue} ");
    }
  }

  // INSERTION BY LEVEL ORDER
  void insertLevelOrder(T value) {
    Node<T> newNode = Node<T>(value);
    if (root == null) {
      root = newNode;
      return;
    }

    Queue<Node<T>> queue = Queue<Node<T>>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      Node<T> current = queue.removeFirst();

      if (current.left == null) {
        current.left = newNode;
        return;
      } else {
        queue.add(current.left!);
      }

      if (current.right == null) {
        current.right = newNode;
        return;
      } else {
        queue.add(current.right!);
      }
    }
  }

  // INSERT BASED ON TARGET NODE 
  bool insertAfterTarget(T target, T value) {
    if (root == null) return false;

    Queue<Node<T>> queue = Queue<Node<T>>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      Node<T> current = queue.removeFirst();

      if (current.nodeValue == target) {
        if (current.left == null) {
          current.left = Node<T>(value);
        } else if (current.right == null) {
          current.right = Node<T>(value);
        } else {
          return false; 
        }
        return true;
      }

      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }

    return false;
  }

  // NON-RECURSIVE TRAVERSAL
  void preOrderNonRecursive() {
    if (root == null) return;

    List<Node<T>> stack = [];
    stack.add(root!);

    while (stack.isNotEmpty) {
      Node<T> current = stack.removeLast();
      stdout.write("${current.nodeValue} ");

      if (current.right != null) stack.add(current.right!);
      if (current.left != null) stack.add(current.left!);
    }
  }

  void inOrderNonRecursive() {
    List<Node<T>> stack = [];
    Node<T>? current = root;

    while (current != null || stack.isNotEmpty) {
      while (current != null) {
        stack.add(current);
        current = current.left;
      }

      current = stack.removeLast();
      stdout.write("${current.nodeValue} ");
      current = current.right;
    }
  }

  void postOrderNonRecursive() {
    if (root == null) return;

    List<Node<T>> stack1 = [];
    List<T> output = [];
    stack1.add(root!);

    while (stack1.isNotEmpty) {
      Node<T> current = stack1.removeLast();
      output.add(current.nodeValue);

      if (current.left != null) stack1.add(current.left!);
      if (current.right != null) stack1.add(current.right!);
    }

    for (var value in output.reversed) {
      stdout.write("$value ");
    }
  }
}

void main() {
  BinaryTree<dynamic> bTree = BinaryTree<dynamic>();

  // Insert beberapa node
  bTree.insertLevelOrder("a");
  bTree.insertLevelOrder(1);
  bTree.insertLevelOrder(2);
  bTree.insertLevelOrder(3);
  bTree.insertLevelOrder(4);
  bTree.insertLevelOrder(5);

  print("== Recursive Traversals ==");
  print("Preorder:");
  bTree.printPreorder(bTree.root);

  print("\nInorder:");
  bTree.printInOrder(bTree.root);

  print("\nPostorder:");
  bTree.printPostOrder(bTree.root);

  print("\n\n== Non-Recursive Traversals ==");
  print("Preorder:");
  bTree.preOrderNonRecursive();

  print("\nInorder:");
  bTree.inOrderNonRecursive();

  print("\nPostorder:");
  bTree.postOrderNonRecursive();

  print("\n\nInsert after target (add 'x' after 1):");
  bTree.insertAfterTarget(1, 'x');

  print("Inorder setelah penambahan:");
  bTree.printInOrder(bTree.root);
}
