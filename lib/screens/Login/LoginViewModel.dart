import 'package:petro/ServiceLocator.dart';
import 'package:petro/services/NavigationService.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();

  void Button() {
    _navigationService.navigateTo("/mainview");
  }
}