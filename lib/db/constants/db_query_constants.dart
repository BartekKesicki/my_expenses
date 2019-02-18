
class QueryConstants {
  static const String CREATE_USER_TABLE_QUERY = "CREATE TABLE User(id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT, income REAL ,limit REAL, startFunds REAL)";
  static const String CREATE_EXPENSE_TABLE_QUERY = "CREATE TABLE Expense(id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT, price REAL, timestamp INTEGER)";
}