import 'package:meta/meta.dart';
import 'package:sqlparser/src/reader/tokenizer/token.dart';

part 'clauses/limit.dart';

part 'expressions/expressions.dart';
part 'expressions/literals.dart';
part 'expressions/reference.dart';
part 'expressions/simple.dart';

part 'statements/select.dart';

abstract class AstNode {
  Iterable<AstNode> get childNodes;
  T accept<T>(AstVisitor<T> visitor);

  /// Whether the content of this node is equal to the [other] node of the same
  /// type. The "content" refers to anything stored only in this node, children
  /// are ignored.
  bool contentEquals(covariant AstNode other);
}

abstract class AstVisitor<T> {
  T visitSelectStatement(SelectStatement e);
  T visitResultColumn(ResultColumn e);

  T visitLimit(Limit e);

  T visitBinaryExpression(BinaryExpression e);
  T visitUnaryExpression(UnaryExpression e);
  T visitIsExpression(IsExpression e);
  T visitLiteral(Literal e);
  T visitReference(Reference e);
}
