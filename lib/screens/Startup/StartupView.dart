import 'package:flutter/material.dart';
import 'package:petro/screens/Startup/StartupViewModel.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
        builder: (context, model, child) => Scaffold(
          body: Text("Hello EOrld!"),
        ),
        viewModelBuilder: () => StartupViewModel(),
        onModelReady: (model) => model.handleStartupLogic(),
    );
  }
}
