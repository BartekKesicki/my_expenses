
import 'package:my_expenses/db/constants/db_column_constants.dart';

class User {
  int id;
  String email;
  String password;
  double income;
  double limit;
  double startFunds;
  User(this.id, this.email, this.password, this.income, this.limit, this.startFunds);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DbColumnConstants.emailColumn : email,
      DbColumnConstants.passwordColumn : password,
      DbColumnConstants.incomeColumn : income,
      DbColumnConstants.limitColumn : limit,
      DbColumnConstants.startFunds : startFunds
    };
    if (id != null) {
      map[DbColumnConstants.idColumnName] = id;
    }
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map[DbColumnConstants.idColumnName];
    email = map[DbColumnConstants.emailColumn];
    password = map[DbColumnConstants.passwordColumn];
    income = map[DbColumnConstants.incomeColumn];
    limit = map[DbColumnConstants.limitColumn];
    startFunds = map[DbColumnConstants.startFunds];
  }
}