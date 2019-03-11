import 'package:my_expenses/db/constants/db_column_constants.dart';

class QueryConstants {
  static const String CREATE_USER_TABLE_QUERY =
      "CREATE TABLE ${DbColumnConstants.tableUserName} (${DbColumnConstants.idColumnName} INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "${DbColumnConstants.emailColumn} TEXT, " +
          "${DbColumnConstants.passwordColumn} TEXT, " +
          "${DbColumnConstants.incomeColumn} REAL, " +
          "${DbColumnConstants.limitColumn} REAL, " +
          "${DbColumnConstants.startFunds} REAL)";
  static const String CREATE_EXPENSE_TABLE_QUERY =
      "CREATE TABLE ${DbColumnConstants.expenseTableName} (" +
          "${DbColumnConstants.expenseIdColumnName} INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "${DbColumnConstants.expenseNameColumnName} TEXT," +
          "${DbColumnConstants.categoryIdColumnName} INTEGER, " +
          "${DbColumnConstants.priceColumnName} REAL, " +
          "${DbColumnConstants.timestampColumnName} INTEGER)";
  static const String CREATE_EXPENSE_CATEGORY_TABLE_QUERY =
      "CREATE TABLE ${DbColumnConstants.expenseCategoryTableName} (${DbColumnConstants.expenseCategoryTableIdColumnName} INTEGER PRIMARY KEY AUTOINCREMENT, " +
          "${DbColumnConstants.expenseCategoryTableNameColumnName} TEXT, ${DbColumnConstants.expenseCategoryTableIsBillColumnName} INTEGER)";
  static const String CREATE_INCOME_CATEGORY_TABLE_QUERY = "CREATE TABLE ${DbColumnConstants.incomeCategoryTableName}(${DbColumnConstants.incomeCategoryIdColumnNamePK} " +
      "INTEGER PRIMARY KEY AUTOINCREMENT, ${DbColumnConstants.incomeCategoryNameColumnName} TEXT)";

  static const String CREATE_INCOME_TABLE_QUERY = "CREATE TABLE ${DbColumnConstants.incomeTableName} (${DbColumnConstants.incomeIdColumnName} INTEGER PRIMARY KEY AUTOINCREMENT, " +
      "${DbColumnConstants.incomeAmountColumnName} REAL, ${DbColumnConstants.incomeCategoryIdColumnName} TEXT, ${DbColumnConstants.inComeTimestampColumnName} INTEGER)";

}