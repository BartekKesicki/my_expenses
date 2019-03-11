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

  //INCOME TABLE COLUMN NAMES (WIP)

  static const String incomeTableName = "Incomes";
  static const String incomeIdColumnName = "id";
  static const String incomeAmountColumnName = "amount";
  static const String incomeCategoryIdColumnName = "incomeCategoryId";
  static const String inComeTimestampColumnName = "timestamp";

  //EXPENSES CATEGORY TABLE COLUMN NAMES (WIP)

  static const String expenseCategoryTableName = "Categories";
  static const String expenseCategoryTableIdColumnName = "id";
  static const String expenseCategoryTableNameColumnName = "name";
  static const String expenseCategoryTableIsBillColumnName = "isBill";

  //INCOMES CATEGORY COLUMN NAMES (WIP)

  static const String incomeCategoryTableName = "IncomeCategories";
  static const String incomeCategoryIdColumnNamePK = "id";
  static const String incomeCategoryNameColumnName = "name";
}
