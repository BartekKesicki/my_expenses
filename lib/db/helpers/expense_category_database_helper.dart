import 'package:my_expenses/db/helpers/database_helper.dart';
import 'package:my_expenses/db/model/expense_category.dart';
import 'package:my_expenses/db/constants/db_column_constants.dart';

class ExpenseCategoryDatabaseHelper extends DatabaseHelper {

  Future<int> saveExpenseCategory(ExpenseCategory expenseCategory) async {
    var dbClient = await db;
    String query =
        "INSERT INTO ${DbColumnConstants.expenseCategoryTableName} (${DbColumnConstants.expenseCategoryTableIdColumnName}, ${DbColumnConstants.expenseCategoryTableNameColumnName}, " +
            "${DbColumnConstants.expenseCategoryTableIsBillColumnName} VALUES(${expenseCategory.id}, '${expenseCategory.name}', ${expenseCategory.isBill})";
    return await dbClient.transaction((txn) async {
      return txn.rawInsert(query);
    });
  }

  Future<List<ExpenseCategory>> getAllExpenseCategories() async {
    var dbClient = await db;
    String query = "SELECT * FROM ${DbColumnConstants.expenseCategoryTableName}";
    List<Map> result = await dbClient.rawQuery(query);
    List<ExpenseCategory> expenseCategories;
    if (result != null && result.isNotEmpty) {
      expenseCategories = result.toList().map((e) => ExpenseCategory.fromMap(e)).toList();
    }
    return expenseCategories;
  }

  Future<int> getCategoryId(String categoryName) async {
    var dbClient = await db;
    String query = "SELECT * FROM ${DbColumnConstants.expenseCategoryTableName} WHERE ${DbColumnConstants.expenseCategoryTableNameColumnName}='$categoryName'";
    List<Map> result = await dbClient.rawQuery(query);
    List<ExpenseCategory> incomeCategories;
    if (result != null && result.isNotEmpty) {
      incomeCategories = result.toList().map((e) => ExpenseCategory.fromMap(e)).toList();
      return incomeCategories[0].id;
    }
    return null;
  }
}
