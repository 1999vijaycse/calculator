import 'package:expressions/expressions.dart';

String calculateResult(String expression) {
  try {
    final expressionParser = Expression.parse(expression);
    final evaluator = const ExpressionEvaluator();
    var result = evaluator.eval(expressionParser, {}); // Provide an empty map instead of null
    return result.toString();
  } catch (e) {
    return 'Error';
  }
}
