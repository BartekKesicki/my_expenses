
import 'package:my_expenses/db/constants/db_column_constants.dart';

class QueryConstants {
  static const String CREATE_USER_TABLE_QUERY = "CREATE TABLE ${DbColumnConstants.tableUser}(${DbColumnConstants.idColumnName} INTEGER PRIMARY KEY AUTOINCREMENT, " +
      "${DbColumnConstants.emailColumn} TEXT, " +
      "${DbColumnConstants.passwordColumn} TEXT, " +
      "${DbColumnConstants.incomeColumn} REAL , " +
      "${DbColumnConstants.limitColumn} REAL, " +
      "${DbColumnConstants.startFunds} REAL)";
  static const String CREATE_EXPENSE_TABLE_QUERY = "CREATE TABLE ${DbColumnConstants.expenseTable}("
      "${DbColumnConstants.expenseIdColumnName} INTEGER PRIMARY KEY AUTOINCREMENT, "
      "${DbColumnConstants.categoryColumnName} TEXT, "
      "${DbColumnConstants.priceColumnName} REAL, "
      "${DbColumnConstants.timestampColumnName} INTEGER)";
}