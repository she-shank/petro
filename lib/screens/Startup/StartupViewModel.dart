import 'package:petro/ServiceLocator.dart';
import 'package:petro/services/AuthenticationService.dart';
import 'package:petro/services/NavigationService.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends BaseViewModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void handleStartupLogic() async {
    setBusy(true);
    bool result = await _authenticationService.isUserLoggedIn();
    if(result){
      _navigationService.navigateTo('/Homefeed');
    } else {
      _navigationService.navigateTo('/Login');
    }
    setBusy(false);
  }
}