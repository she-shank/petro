import 'package:flutter/material.dart';
import 'package:petro/screens/HomeFeed/HomeFeed.dart';
import 'package:petro/screens/Main/MainViewModel.dart';
import 'package:petro/screens/Profile/Profile.dart';
import 'package:petro/screens/RecentActivities.dart';
import 'package:petro/screens/UploadPost.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
              child: Scaffold(
                body : IndexedStack(
                  index: model.currentIndex,
                  children: [
                    HomeFeed(),
                    RecentActivities(),
                    UploadPost(),
                    Profile(),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: model.currentIndex,
                  onTap: (index) {
                    model.NavBarfunction(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.fact_check_outlined, color: Colors.deepOrange,),
                      label: "HomeFeed"
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.accessibility_new_outlined, color: Colors.deepOrange,),
                        label: "Recents"
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add_a_photo, color: Colors.deepOrange,),
                        label: "Upload"
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.bar_chart, color: Colors.deepOrange,),
                        label: "Profile"
                    )
                  ],
                ),
              )
          );
        },
        viewModelBuilder: () => MainViewModel());
  }
}
