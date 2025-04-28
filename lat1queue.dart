class CircularQueue {
  List<int> queue = [];
  int front = 0;
  int rear = -1;
  int size = 0;
  int capacity = 0;

  void buatQueue(int kapasitas) {
    capacity = kapasitas;
    queue = List<int>.filled(capacity, 0);
  }

  bool isEmpty() {
    return size == 0;
  }

  bool isFull() {
    return size == capacity;
  }

  void enqueue(int data) {
    if (isFull()) {
      print("Queue penuh, tidak bisa menambahkan $data");
      return;
    }
    rear = (rear + 1) % capacity;
    queue[rear] = data;
    size++;
    print("$data ditambahkan ke queue");
  }

  void dequeue() {
    if (isEmpty()) {
      print("Queue kosong, tidak bisa mengambil data");
      return;
    }
    int data = queue[front];
    front = (front + 1) % capacity;
    size--;
    print("$data dihapus dari queue");
  }

  void tampilkan() {
    if (isEmpty()) {
      print("Queue kosong");
      return;
    }
    print("Isi Queue:");
    for (int i = 0; i < size; i++) {
      int index = (front + i) % capacity;
      print(queue[index]);
    }
  }
}

void main() {
  CircularQueue q = CircularQueue();
  q.buatQueue(5); // Kapasitas queue 5

  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.enqueue(40);
  q.enqueue(50);

  q.tampilkan();

  q.dequeue();
  q.dequeue();

  q.enqueue(60);
  q.enqueue(70);

  print("\nSetelah dequeue dan enqueue lagi:");
  q.tampilkan();
}