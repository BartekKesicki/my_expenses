
import 'package:my_expenses/db/constants/db_column_constants.dart';

class QueryConstants {
  static const String CREATE_USER_TABLE_QUERY = "CREATE TABLE ${DbColumnConstants.tableUserName} (${DbColumnConstants.idColumnName} INTEGER PRIMARY KEY AUTOINCREMENT, " +
      "${DbColumnConstants.emailColumn} TEXT, " +
      "${DbColumnConstants.passwordColumn} TEXT, " +
      "${DbColumnConstants.incomeColumn} REAL, " +
      "${DbColumnConstants.limitColumn} REAL, " +
      "${DbColumnConstants.startFunds} REAL)";
  static const String CREATE_EXPENSE_TABLE_QUERY = "CREATE TABLE ${DbColumnConstants.expenseTableName} (" +
      "${DbColumnConstants.expenseIdColumnName} INTEGER PRIMARY KEY AUTOINCREMENT, " +
      "${DbColumnConstants.expenseNameColumnName} TEXT," +
      "${DbColumnConstants.categoryIdColumnName} INTEGER, " +
      "${DbColumnConstants.priceColumnName} REAL, " +
      "${DbColumnConstants.timestampColumnName} INTEGER)";
  static const String CREATE_CATEGORY_TABLE_QUERY = "CREATE TABLE ${DbColumnConstants.expenseTableName} (${DbColumnConstants.categoryTableIdColumnName} INTEGER PRIMARY KEY AUTOINCREMENT, " +
      "${DbColumnConstants.categoryTableNameColumnName} TEXT, ${DbColumnConstants.categoryTableIsBillColumnName} INTEGER)";
}