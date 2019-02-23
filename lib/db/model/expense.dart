import 'package:my_expenses/db/constants/db_column_constants.dart';

class Expense {
  int id;
  String category;
  double price;
  int timestamp;
  Expense(this.id, this.category, this.price, this.timestamp);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DbColumnConstants.categoryColumnName : category,
      DbColumnConstants.priceColumnName : price,
      DbColumnConstants.timestampColumnName : timestamp,
    };
    if (id != null) {
      map[DbColumnConstants.expenseIdColumnName] = id;
    }
    return map;
  }

  Expense.fromMap(Map<String, dynamic> map) {
    id = map[DbColumnConstants.expenseIdColumnName];
    category = map[DbColumnConstants.categoryColumnName];
    price = map[DbColumnConstants.priceColumnName];
    timestamp = map[DbColumnConstants.timestampColumnName];
  }
}