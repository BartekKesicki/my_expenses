import 'package:my_expenses/db/constants/db_column_constants.dart';

class IncomeCategory {
  int id;
  String name;

  IncomeCategory(this.id, this.name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DbColumnConstants.incomeCategoryNameColumnName: name,
    };
    if (id != null) {
      map[DbColumnConstants.incomeCategoryIdColumnNamePK] = id;
    }
    return map;
  }

  IncomeCategory.fromMap(Map<String, dynamic> map) {
    id = map[DbColumnConstants.incomeCategoryIdColumnNamePK];
    name = map[DbColumnConstants.incomeCategoryNameColumnName];
  }
}