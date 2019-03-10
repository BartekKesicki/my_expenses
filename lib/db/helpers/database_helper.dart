import 'dart:async';
import 'dart:io' as io;
import 'package:my_expenses/db/constants/db_column_constants.dart';
import 'package:my_expenses/db/constants/db_query_constants.dart';
import 'package:my_expenses/db/model/expense.dart';
import 'package:my_expenses/db/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "my_expenses.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(QueryConstants.CREATE_USER_TABLE_QUERY);
    await db.execute(QueryConstants.CREATE_EXPENSE_TABLE_QUERY);
    await db.execute(QueryConstants.CREATE_CATEGORY_TABLE_QUERY);
  }

  Future saveUser(User user) async {
    var dbClient = await db;
    String query =
        "INSERT INTO ${DbColumnConstants.tableUserName}(${DbColumnConstants.idColumnName}, " +
            "${DbColumnConstants.emailColumn}, ${DbColumnConstants.passwordColumn}, ${DbColumnConstants.incomeColumn}, ${DbColumnConstants.limitColumn}, ${DbColumnConstants.startFunds}) " +
            "VALUES(${user.id}, '${user.email}', '${user.password}', ${user.income}, ${user.limit}, ${user.startFunds})";
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(query);
    });
  }

  Future<int> getUserIdOrNull(String login, String password) async {
    var dbClient = await db;
    List<Map> result = await dbClient.rawQuery(
        "SELECT * FROM ${DbColumnConstants.tableUserName} WHERE ${DbColumnConstants.emailColumn}='$login' AND ${DbColumnConstants.passwordColumn}='$password'");
    User user;
    if (result != null && result.isNotEmpty) {
      user = User.fromMap(result.first);
    }
    return user.id;
  }

  Future saveExpense(Expense expense) async {
    var dbClient = await db;
    String query =
        "INSERT INTO ${DbColumnConstants.expenseTableName} (${DbColumnConstants.expenseIdColumnName}, ${DbColumnConstants.expenseNameColumnName}, " +
            "${DbColumnConstants.categoryIdColumnName}, ${DbColumnConstants.priceColumnName}, ${DbColumnConstants.timestampColumnName} " +
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
        "WHERE $lowerTimeStamp < ${DbColumnConstants.timestampColumnName} AND $topTimeStamp > ${DbColumnConstants.timestampColumnName}";
    List<Map> result = await dbClient.rawQuery(query);
    List<Expense> expenses;
    if (result != null && result.isNotEmpty) {
      expenses = result.toList().map((e) => Expense.fromMap(e));
    }
    return expenses;
  }
}
