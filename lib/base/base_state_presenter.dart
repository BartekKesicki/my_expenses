import 'base_state_view.dart';

abstract class BaseStatePresenter<V extends BaseStateView> {
  void attach(V view);
  void detach();
}