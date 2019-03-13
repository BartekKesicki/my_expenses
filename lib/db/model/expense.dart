import 'package:my_expenses/db/constants/db_column_constants.dart';

class Expense {
  int id;
  int categoryId;
  String name;
  double price;
  int timestamp;
  Expense(this.id, this.name, this.categoryId, this.price, this.timestamp);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DbColumnConstants.expenseNameColumnName: name,
      DbColumnConstants.expenseCategoryIdColumnName: categoryId,
      DbColumnConstants.expensePriceColumnName: price,
      DbColumnConstants.expenseTimestampColumnName: timestamp,
    };
    if (id != null) {
      map[DbColumnConstants.expenseIdColumnName] = id;
    }
    return map;
  }

  Expense.fromMap(Map<String, dynamic> map) {
    id = map[DbColumnConstants.expenseIdColumnName];
    name = map[DbColumnConstants.expenseNameColumnName];
    categoryId = map[DbColumnConstants.expenseCategoryIdColumnName];
    price = map[DbColumnConstants.expensePriceColumnName];
    timestamp = map[DbColumnConstants.expenseTimestampColumnName];
  }
}
