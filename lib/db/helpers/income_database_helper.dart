import 'package:my_expenses/db/helpers/database_helper.dart';
import 'package:my_expenses/db/constants/db_column_constants.dart';
import 'package:my_expenses/db/model/income.dart';

class IncomeDatabaseHelper extends DatabaseHelper {

  Future saveIncome(Income income) async {
    var dbClient = await db;
    String query =
        "INSERT INTO ${DbColumnConstants.incomeTableName} (${DbColumnConstants.incomeIdColumnName}, ${DbColumnConstants.incomeAmountColumnName}, " +
            "${DbColumnConstants.incomeNameColumnName}, ${DbColumnConstants.incomeCategoryIdColumnName}, ${DbColumnConstants.incomeTimestampColumnName}) " +
                "VALUES(${income.id}, ${income.amount}, '${income.name}', ${income.incomeCategoryId}, ${income.timestamp})";
    await dbClient.transaction((txn) async {
      return txn.rawInsert(query);
    });
  }

  Future<List<Income>> getAllIncomes() async {
    var dbClient = await db;
    String query = "SELECT * FROM ${DbColumnConstants.incomeTableName}";
    List<Map> result = await dbClient.rawQuery(query);
    List<Income> incomes;
    if (result != null && result.isNotEmpty) {
      incomes = result.toList().map((e) => Income.fromMap(e)).toList();
    }
    return incomes;
  }

  Future<List<Income>> getIncomeByName(String phrase) async {
    var dbClient = await db;
    String query = "SELECT * FROM ${DbColumnConstants.incomeTableName} WHERE ${DbColumnConstants.incomeNameColumnName} LIKE '$phrase%'";
    List<Map> result = await dbClient.rawQuery(query);
    List<Income> incomes;
    if (result != null && result.isNotEmpty) {
      incomes = result.toList().map((e) => Income.fromMap(e)).toList();
    }
    return incomes;
  }
}