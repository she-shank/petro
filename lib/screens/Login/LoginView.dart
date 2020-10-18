import 'package:flutter/material.dart';
import 'package:petro/screens/Login/LoginViewModel.dart';
import 'package:stacked/stacked.dart';


class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
        builder: (context, model, child) => Scaffold(
            backgroundColor: Colors.green,
            appBar: AppBar(title: Text("Login")),
            body: Center(
                child: FlatButton(
                  child: Text('Login Screen ->>>> MainView'),
                  onPressed: () {
                    model.Button();
                  },
                )
            )
        ),
        viewModelBuilder: () => LoginViewModel());
  }
}
