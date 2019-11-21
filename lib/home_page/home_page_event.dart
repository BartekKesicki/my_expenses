import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomePageEvent extends Equatable {
  HomePageEvent([List props = const []]) : super(props);
}

class RedirectToSettingsPageEvent extends HomePageEvent { }

class RedirectToCategoriesPageEvent extends HomePageEvent { }

class RedirectToFundsManagementPageEvent extends HomePageEvent { }

class InitialHomePageEvent extends HomePageEvent { }

class RedirectToMyProfilePageEvent extends HomePageEvent { }

class BackButtonEvent extends HomePageEvent { }