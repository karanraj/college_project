/*import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var currentIndex;
  var selectedIndex;
  bool call = false;
  var auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: call,
      child: ConvexAppBar(
        backgroundColor: Colors.white,
        color: Colors.blue,
        height: MediaQuery.of(context).size.height * 0.068,
        top: -0,
        initialActiveIndex: 0,
        activeColor: Colors.lightBlue[300],
        items: [
          TabItem(
              icon: IconButton(
                icon: Icon(Icons.home),
                padding: EdgeInsets.only(bottom: 3),
                color: Colors.black.withBlue(50),
                onPressed: () => Navigator.pushNamed(context, 'dashboard'),
              ),
              title: 'Home'),
          TabItem(
              icon: IconButton(
                icon: Icon(Icons.view_list),
                padding: EdgeInsets.only(bottom: 3),
                color: Colors.black.withBlue(50),
                onPressed: () => Navigator.pushNamed(context, 'viewall'),
              ),
              title: "View All"),
          TabItem(
              icon: IconButton(
                icon: Icon(Icons.notifications),
                padding: EdgeInsets.only(bottom: 3),
                color: Colors.black.withBlue(50),
                onPressed: () => print("Notification"),
              ),
              title: "Notifications"),
          TabItem(
            title: "SignOut",
            icon: IconButton(
              icon: Icon(Icons.exit_to_app),
              padding: EdgeInsets.only(bottom: 3),
              color: Colors.black.withBlue(50),
              onPressed: () async {
                setState(
                  () {
                    call = true;
                  },
                );
                await auth.signOut();
                Navigator.pushNamed(context, 'signin');
                setState(
                  () {
                    call = false;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}*/
