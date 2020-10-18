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
                appBar: AppBar(
                  title: Text("rgrg"),
                ),
                backgroundColor: Colors.blueAccent,
                body: Center(
                  child: Container(
                    color: Colors.amberAccent,
                    height: 100,
                    width: 100,
                  ),
                ),
              )
            ),
        viewModelBuilder: () => HomeFeedViewModel());
  }
}

// class BottomBar extends ViewModelWidget<HomeFeedViewModel> {
//   const BottomBar({
//     Key key,
//   }) : super(key: key, reactive: true);
//
//
//   @override
//   Widget build(BuildContext context, HomeFeedViewModel model) {
    // return BottomNavigationBar(
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.fact_check_outlined),
    //         label: "jai Shree ram",
    //       ),
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.fact_check_outlined),
    //           label: "jhree ram"
    //       ),
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.ac_unit),
    //           label: "jhree ram"
    //       ),
    //     ],
    // );
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("rgrg"),
//       ),
//       backgroundColor: Colors.blueAccent,
//       body: Center(
//         child: Container(
//           color: Colors.amberAccent,
//           height: 100,
//           width: 100,
//         ),
//       ),
//     );
//   }
// }

