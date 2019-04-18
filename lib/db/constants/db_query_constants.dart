import 'package:my_expenses/db/constants/db_column_constants.dart';

class QueryConstants {

  static const String CREATE_USER_TABLE_QUERY =
      "CREATE TABLE ${DbColumnConstants.tableUserName} (${DbColumnConstants.userIdColumnName} INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "${DbColumnConstants.userEmailColumnName} TEXT, " +
          "${DbColumnConstants.userPasswordColumnName} TEXT, " +
          "${DbColumnConstants.userIncomeColumnName} REAL, " +
          "${DbColumnConstants.userLimitColumnName} REAL, " +
          "${DbColumnConstants.userStartFundsColumnName} REAL)";

  static const String CREATE_EXPENSE_TABLE_QUERY =
      "CREATE TABLE ${DbColumnConstants.expenseTableName} (" +
          "${DbColumnConstants.expenseIdColumnName} INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "${DbColumnConstants.expenseNameColumnName} TEXT," +
          "${DbColumnConstants.expenseCategoryIdColumnName} INTEGER, " +
          "${DbColumnConstants.expensePriceColumnName} REAL, " +
          "${DbColumnConstants.expenseTimestampColumnName} INTEGER)";

  static const String CREATE_EXPENSE_CATEGORY_TABLE_QUERY =
      "CREATE TABLE ${DbColumnConstants.expenseCategoryTableName} (${DbColumnConstants.expenseCategoryTableIdColumnName} INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "${DbColumnConstants.expenseCategoryTableNameColumnName} TEXT, ${DbColumnConstants.expenseCategoryTableIsBillColumnName} INTEGER)";

  static const String CREATE_INCOME_CATEGORY_TABLE_QUERY = "CREATE TABLE ${DbColumnConstants.incomeCategoryTableName}(${DbColumnConstants.incomeCategoryIdColumnNamePK} " +
      "INTEGER PRIMARY KEY AUTOINCREMENT, ${DbColumnConstants.incomeCategoryNameColumnName} TEXT)";

  static const String CREATE_INCOME_TABLE_QUERY = "CREATE TABLE ${DbColumnConstants.incomeTableName} (${DbColumnConstants.incomeIdColumnName} INTEGER PRIMARY KEY AUTOINCREMENT, " +
      "${DbColumnConstants.incomeAmountColumnName} REAL, ${DbColumnConstants.incomeNameColumnName} TEXT, " +
          "${DbColumnConstants.incomeCategoryIdColumnName} INTEGER, ${DbColumnConstants.incomeTimestampColumnName} INTEGER)";

}