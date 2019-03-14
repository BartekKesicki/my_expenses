import 'package:my_expenses/db/constants/db_column_constants.dart';
import 'package:my_expenses/db/helpers/database_helper.dart';
import 'package:my_expenses/db/model/expense.dart';

class ExpenseDatabaseHelper extends DatabaseHelper {

  Future saveExpense(Expense expense) async {
    var dbClient = await db;
    String query =
        "INSERT INTO ${DbColumnConstants.expenseTableName} (${DbColumnConstants.expenseIdColumnName}, ${DbColumnConstants.expenseNameColumnName}, " +
            "${DbColumnConstants.expenseCategoryIdColumnName}, ${DbColumnConstants.expensePriceColumnName}, ${DbColumnConstants.expenseTimestampColumnName} " +
            "VALUES(${expense.id}, '${expense.name}', ${expense.categoryId}, ${expense.price}, ${expense.timestamp})";
    await dbClient.transaction((txn) async {
      return txn.rawInsert(query);
    });
  }

  Future<List<Expense>> getAllExpenses() async {
    var dbClient = await db;
    String query = "SELECT * FROM ${DbColumnConstants.expenseTableName}";
    List<Map> result = await dbClient.rawQuery(query);
    List<Expense> expenses;
    if (result != null && result.isNotEmpty) {
      expenses = result.toList().map((e) => Expense.fromMap(e));
    }
    return expenses;
  }

  Future<List<Expense>> getExpensesFromSpecifiedMonth(
      int lowerTimeStamp, int topTimeStamp) async {
    var dbClient = await db;
    String query = "SELECT * FROM ${DbColumnConstants.expenseTableName} " +
        "WHERE $lowerTimeStamp < ${DbColumnConstants.expenseTimestampColumnName} AND $topTimeStamp > ${DbColumnConstants.expenseTimestampColumnName}";
    List<Map> result = await dbClient.rawQuery(query);
    List<Expense> expenses;
    if (result != null && result.isNotEmpty) {
      expenses = result.toList().map((e) => Expense.fromMap(e));
    }
    return expenses;
  }
}