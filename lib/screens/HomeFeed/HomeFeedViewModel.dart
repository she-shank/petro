import 'package:petro/ServiceLocator.dart';
import 'package:petro/services/DatabaseService.dart';
import 'package:petro/services/NavigationService.dart';
import 'package:stacked/stacked.dart';

class HomeFeedViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  void initialize(){
    setBusy(true);

    setBusy(false);
  }

  void dummyNavigation(String str){
    setBusy(true);
    _navigationService.navigateTo(str);
    setBusy(false);
  }
}