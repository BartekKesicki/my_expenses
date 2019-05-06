import 'package:my_expenses/db/model/expense.dart';

class Group {
  String groupName;
  Expense expense;

  Group(this.groupName, this.expense);
}