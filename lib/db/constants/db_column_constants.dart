class DbColumnConstants {

  //USER TABLE COLUMN NAMES
  static const String tableUserName = "Users";
  static const String userIdColumnName = "id";
  static const String userEmailColumnName = "email";
  static const String userPasswordColumnName = "password";
  static const String userIncomeColumnName = "income";
  static const String userLimitColumnName = "expenseLimit";
  static const String userStartFundsColumnName = "startFunds";

  //EXPENSE TABLE COLUMN NAMES (WIP)

  static const String expenseTableName = "Expenses";
  static const String expenseIdColumnName = "id";
  static const String expensePriceColumnName = "price";
  static const String expenseNameColumnName = "name";
  static const String expenseCategoryIdColumnName = "categoryId";
  static const String expenseTimestampColumnName = "timestamp";

  //INCOME TABLE COLUMN NAMES (WIP)

  static const String incomeTableName = "Incomes";
  static const String incomeIdColumnName = "id";
  static const String incomeAmountColumnName = "amount";
  static const String incomeNameColumnName = "name";
  static const String incomeCategoryIdColumnName = "incomeCategoryId";
  static const String incomeTimestampColumnName = "timestamp";

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
