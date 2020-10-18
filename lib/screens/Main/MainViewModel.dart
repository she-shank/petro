import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel{

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void NavBarfunction(int index) {
    setBusy(true);
    _currentIndex = index;
    notifyListeners();
    setBusy(false);
  }

}