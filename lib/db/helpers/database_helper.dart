import 'dart:async';
import 'dart:io' as io;
import 'package:my_expenses/db/constants/db_query_constants.dart';
import 'package:my_expenses/db/model/expense.dart';
import 'package:my_expenses/db/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
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
  }

  Future saveUser(User user) async {
    var dbClient = await db;
    String query = "INSERT INTO User(id, email, password, income, limit, startFunds) VALUES(null, ${user.email}, ${user.password}, ${user.income}, ${user.limit}, ${user.startFunds})";
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(query);
    });
  }

  void saveExpense(Expense expense) {
    //todo save expense
  }
}