import 'package:stack/stack.dart';

class PostfixEval {
  Stack<int> stack = Stack<int>();

  int evaluate(String expression) {
    List<String> tokens = expression.split(' ');

    for (var token in tokens) {
      if (_isOperator(token)) {
        int b = stack.pop();
        int a = stack.pop();
        int result = _applyOperator(a, b, token);
        stack.push(result);
      } else {
        stack.push(int.parse(token));
      }
    }

    return stack.pop();
  }

  bool _isOperator(String token) {
    return token == '+' || token == '-' || token == '*' || token == '/';
  }

  int _applyOperator(int a, int b, String operator) {
    switch (operator) {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        return a ~/ b; // gunakan ~/ untuk pembagian integer
      default:
        throw ArgumentError('Operator tidak dikenali: $operator');
    }
  }
}

void main() {
  var evaluator = PostfixEval();
  String expression = "4 3 5 * +";
  int result = evaluator.evaluate(expression);
  print('Hasil evaluasi: $result');
}
