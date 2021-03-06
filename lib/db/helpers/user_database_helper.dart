import 'package:my_expenses/db/constants/db_column_constants.dart';
import 'package:my_expenses/db/helpers/database_helper.dart';
import 'package:my_expenses/db/model/user.dart';

class UserDatabaseHelper extends DatabaseHelper {

  Future saveUser(User user) async {
    var dbClient = await db;
    String query =
        "INSERT INTO ${DbColumnConstants.tableUserName}(${DbColumnConstants.userIdColumnName}, " +
            "${DbColumnConstants.userEmailColumnName}, ${DbColumnConstants.userPasswordColumnName}, ${DbColumnConstants.userIncomeColumnName}, "
                "${DbColumnConstants.userLimitColumnName}, ${DbColumnConstants.userStartFundsColumnName}, ${DbColumnConstants.userPhotoPathColumnName}) " +
            "VALUES(${user.id}, '${user.email}', '${user.password}', ${user.income}, ${user.limit}, ${user.startFunds}, ${user.photoPath})";
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(query);
    });
  }

  Future<bool> isUserExists(String login, String password) async {
    var dbClient = await db;
    List<Map> result = await dbClient.rawQuery(
        "SELECT * FROM ${DbColumnConstants.tableUserName} WHERE ${DbColumnConstants.userEmailColumnName}='$login' AND ${DbColumnConstants.userPasswordColumnName}='$password'");
    User user;
    if (result != null && result.isNotEmpty) {
      user = User.fromMap(result.first);
    }
    return user != null;
  }

  Future<User> getUser(int userId) async {
    var dbClient = await db;
    List<Map> result = await dbClient.rawQuery(
        "SELECT * FROM ${DbColumnConstants.tableUserName} WHERE ${DbColumnConstants.userIdColumnName}=$userId");
    User user;
    if (result != null && result.isNotEmpty) {
      user = User.fromMap(result.first);
    }
    return user;
  }
}