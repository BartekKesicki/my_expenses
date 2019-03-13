import 'package:my_expenses/db/constants/db_column_constants.dart';

class Income {
  int id;
  double amount;
  String name;
  int incomeCategoryId;
  int timestamp;

  Income(this.id, this.amount, this.name, this.incomeCategoryId, this.timestamp);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DbColumnConstants.incomeAmountColumnName: amount,
      DbColumnConstants.incomeNameColumnName: name,
      DbColumnConstants.incomeCategoryIdColumnName: incomeCategoryId,
      DbColumnConstants.incomeTimestampColumnName: timestamp,
    };
    if (id != null) {
      map[DbColumnConstants.incomeIdColumnName] = id;
    }
    return map;
  }

  Income.fromMap(Map<String, dynamic> map) {
    id = map[DbColumnConstants.incomeIdColumnName];
    amount = map[DbColumnConstants.incomeAmountColumnName];
    name = map[DbColumnConstants.incomeNameColumnName];
    incomeCategoryId = map[DbColumnConstants.incomeCategoryIdColumnName];
    timestamp = map[DbColumnConstants.incomeTimestampColumnName];
  }
}