import 'dart:async';

import 'package:my_expenses/app_properties/app_dimens.dart';
import 'package:my_expenses/app_properties/app_strings.dart';

mixin RegisterPersonalDataValidator {

  var emailValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (email,sink){
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if(regex.hasMatch(email)){
          sink.add(email);
        }else{
          sink.addError(AppStrings.emailIsNotValid);
        }
      }
  );

  var passwordValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (password,sink){
        if(password.length > AppDimens.passwordMinCharacters){
          sink.add(password);
        }else{
          sink.addError(AppStrings.passwordIsTooShort);
        }
      }
  );
}