import 'package:my_expenses/db/constants/db_column_constants.dart';

class ExpenseCategory {
  int id;
  String name;
  bool isBill;

  ExpenseCategory(this.id, this.name, this.isBill);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DbColumnConstants.expenseCategoryTableNameColumnName: name,
      DbColumnConstants.expenseCategoryTableIsBillColumnName: isBill,
    };
    if (id != null) {
      map[DbColumnConstants.expenseCategoryTableIdColumnName] = id;
    }
    return map;
  }

  ExpenseCategory.fromMap(Map<String, dynamic> map) {
    id = map[DbColumnConstants.expenseCategoryTableIdColumnName];
    name = map[DbColumnConstants.expenseCategoryTableNameColumnName];
    isBill = map[DbColumnConstants.expenseCategoryTableIsBillColumnName] == 1;
  }
}
