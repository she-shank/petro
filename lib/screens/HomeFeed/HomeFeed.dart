import 'package:flutter/material.dart';
import 'package:petro/screens/HomeFeed/HomeFeedViewModel.dart';
import 'package:stacked/stacked.dart';


class HomeFeed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeFeedViewModel>.reactive(
        builder: (context, model, child) =>
            SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    BottomNavigationBar(
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.fact_check_outlined);
                        ),
                      ]
                    )
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => HomeFeedViewModel());
  }
}

