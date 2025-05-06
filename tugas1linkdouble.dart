class DNode<T> {
  T? nodeValue;
  DNode<T>? prev;
  DNode<T>? next;

  DNode({this.nodeValue, this.prev, this.next});
}

class DoubleLinkedList<T> {
  DNode<T>? head;

  bool isEmpty() => head == null;

  void insertBeforeHead(T data) {
    DNode<T> newNode = DNode(nodeValue: data);

    if (isEmpty()) {
      head = newNode;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }

  // Method lain dari DoubleLinkedList bisa ditambahkan di sini
}

void main() {
  DoubleLinkedList<int> myList = DoubleLinkedList<int>();
  myList.insertBeforeHead(3);
  myList.insertBeforeHead(2);
  myList.insertBeforeHead(1);

  printListForward(myList.head); // Output yang diharapkan: 1 2 3
}

void printListForward(DNode? node) {
  print("Traversal Maju:");
  DNode? current = node;
  while (current != null) {
    print("${current.nodeValue} "); // Menggunakan print() biasa
    current = current.next;
  }
  print("");
}