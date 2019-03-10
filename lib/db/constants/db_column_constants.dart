class DbColumnConstants {
  //USER TABLE COLUMN NAMES
  static const String tableUserName = "Users";
  static const String idColumnName = "id";
  static const String emailColumn = "email";
  static const String passwordColumn = "password";
  static const String incomeColumn = "income";
  static const String limitColumn = "expenseLimit";
  static const String startFunds = "startFunds";

  //EXPENSE TABLE COLUMN NAMES (WIP)

  static const String expenseTableName = "Expenses";
  static const String expenseIdColumnName = "id";
  static const String priceColumnName = "price";
  static const String expenseNameColumnName = "name";
  static const String categoryIdColumnName = "categoryId";
  static const String timestampColumnName = "timestamp";

  //CATEGORY TABLE COLUMN NAMES (WIP)
  static const String categoryTableName = "Categories";
  static const String categoryTableIdColumnName = "id";
  static const String categoryTableNameColumnName = "name";
  static const String categoryTableIsBillColumnName = "isBill";
}
