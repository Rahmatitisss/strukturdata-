class UndoStack {
  final List<Function> _stack = [];

  void simpan(Function aksiUndo) {
    _stack.add(aksiUndo);
  }

  void undo() {
    if (_stack.isNotEmpty) {
      _stack.removeLast()(); 
    }
  }
}