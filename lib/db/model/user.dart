import 'package:my_expenses/db/constants/db_column_constants.dart';

class User {
  int id;
  String email;
  String password;
  double income;
  double limit;
  double startFunds;
  String photoPath = "";
  User(this.id, this.email, this.password, this.income, this.limit,
      this.startFunds);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DbColumnConstants.userEmailColumnName: email,
      DbColumnConstants.userPasswordColumnName: password,
      DbColumnConstants.userIncomeColumnName: income,
      DbColumnConstants.userLimitColumnName: limit,
      DbColumnConstants.userStartFundsColumnName: startFunds,
      DbColumnConstants.userPhotoPathColumnName: photoPath
    };
    if (id != null) {
      map[DbColumnConstants.userIdColumnName] = id;
    }
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map[DbColumnConstants.userIdColumnName];
    email = map[DbColumnConstants.userEmailColumnName];
    password = map[DbColumnConstants.userPasswordColumnName];
    income = map[DbColumnConstants.userIncomeColumnName];
    limit = map[DbColumnConstants.userLimitColumnName];
    startFunds = map[DbColumnConstants.userStartFundsColumnName];
    photoPath = map[DbColumnConstants.userPhotoPathColumnName];
  }
}
