import 'package:my_expenses/db/helpers/database_helper.dart';
import 'package:my_expenses/db/constants/db_column_constants.dart';
import 'package:my_expenses/db/model/income_category.dart';

class IncomeCategoryDatabaseHelper extends DatabaseHelper {

  Future<int> saveIncomeCategory(IncomeCategory incomeCategory) async {
    var dbClient = await db;
    String query =
        "INSERT INTO ${DbColumnConstants.incomeCategoryTableName} (${DbColumnConstants.incomeCategoryIdColumnNamePK}, ${DbColumnConstants.incomeCategoryNameColumnName}) " +
        "VALUES(${incomeCategory.id}, '${incomeCategory.name}')";
    await dbClient.transaction((txn) async {
      return txn.rawInsert(query);
    });
  }

  Future<List<IncomeCategory>> getAllIncomeCategories() async {
    var dbClient = await db;
    String query = "SELECT * FROM ${DbColumnConstants.incomeCategoryTableName}";
    List<Map> result = await dbClient.rawQuery(query);
    List<IncomeCategory> incomeCategories;
    if (result != null && result.isNotEmpty) {
      incomeCategories = result.toList().map((e) => IncomeCategory.fromMap(e));
    }
    return incomeCategories;
  }

  Future<int> getCategoryId(String categoryName) async {
    var dbClient = await db;
    String query = "SELECT ${DbColumnConstants.incomeCategoryIdColumnName} FROM ${DbColumnConstants.incomeCategoryTableName} WHERE ${DbColumnConstants.incomeCategoryNameColumnName}='$categoryName'";
    List<Map> result = await dbClient.rawQuery(query);
    List<IncomeCategory> incomeCategories;
    if (result != null && result.isNotEmpty) {
      incomeCategories = result.toList().map((e) => IncomeCategory.fromMap(e));
      return incomeCategories[0].id;
    }
    return null;
  }
}