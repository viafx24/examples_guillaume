import 'package:function_tree/function_tree.dart';

void main() {

  String A="poids/12";
  
  int B=434;
  
  String C="poids";
  
  A = A.replaceAll(C, B.toString());
  
  print(A);
  print("'$A' -> ${A.interpret().toStringAsFixed(2)}");

// for (final expression in A) {
//   print("'$expression' -> ${expression.interpret()}");
// }
}
