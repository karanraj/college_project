import 'package:DockerApp/BottomBar/bottomBar.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  var animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate)
      ..addListener(() {
        setState(() {
          animation.value;
        });

        print(animation.value);
      });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Dashboard'),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () => print("account"),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () => print("help"),
          )
        ],
      ),
      // TODO BottomBar
      //bottomNavigationBar: BottomBar(),
      body: Container(
        color: Colors.black,
        // padding: EdgeInsets.all(3),
        // margin: EdgeInsets.only(right: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  // TODO Launch Container
                  width: MediaQuery.of(context).size.width *
                      0.75 *
                      animation.value,
                  height: MediaQuery.of(context).size.height *
                      0.22 *
                      animation.value,
                  child: Container(
                    margin: EdgeInsets.only(
                        right: 3 * animation.value,
                        top: 3 * animation.value,
                        bottom: 3 * animation.value),
                    child: RaisedButton(
                      color: Colors.purple[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.launch,
                            color: Colors.white70,
                            size: 30 * animation.value,
                          ),
                          Text(
                            'Launch Container',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'launchContainer');
                      },
                    ),
                  ),
                ),
                Container(
                  // TODO Stop Container
                  // padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(top: 3 * animation.value),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.23 *
                            animation.value,
                        height: MediaQuery.of(context).size.height *
                            0.100 *
                            animation.value,
                        child: Container(
                          // margin: EdgeInsets.only(top: 4, right: 4, left: 4),
                          child: RaisedButton(
                            color: Colors.deepOrangeAccent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.stop,
                                  color: Colors.white70,
                                  size: 30 * animation.value,
                                ),
                                Text(
                                  'Stop',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "stopContainer");
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        // TODO Start Container
                        width: MediaQuery.of(context).size.width *
                            0.23 *
                            animation.value,
                        height: MediaQuery.of(context).size.height *
                            0.112 *
                            animation.value,
                        child: Container(
                          margin: EdgeInsets.only(top: 3 * animation.value),
                          child: RaisedButton(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.image,
                                  color: Colors.white70,
                                  size: 30 * animation.value,
                                ),
                                Text(
                                  'Start',
                                  style: TextStyle(color: Colors.white70),
                                )
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "startContainer");
                            },
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // TODO Remove Container
                  width: MediaQuery.of(context).size.width *
                      0.50 *
                      animation.value,
                  height: MediaQuery.of(context).size.height *
                      0.19 *
                      animation.value,
                  child: Container(
                    margin: EdgeInsets.only(left: 3 * animation.value),
                    child: RaisedButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.remove_circle,
                            color: Colors.white70,
                            size: 30 * animation.value,
                          ),
                          Text(
                            'Remove Container',
                            style: TextStyle(color: Colors.white70),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'removeContainer');
                      },
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                SizedBox(
                  // TODO Remove All Container
                  width: MediaQuery.of(context).size.width *
                      0.50 *
                      animation.value,
                  height: MediaQuery.of(context).size.height *
                      0.19 *
                      animation.value,
                  child: Container(
                    margin: EdgeInsets.only(
                        right: 3 * animation.value, left: 3 * animation.value),
                    child: RaisedButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.remove_circle_outline,
                            color: Colors.white70,
                            size: 30 * animation.value,
                          ),
                          Text(
                            'Remove All Container',
                            style: TextStyle(color: Colors.white70),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'removeAllContainer');
                      },
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(
                      // TODO Image List
                      width: MediaQuery.of(context).size.width *
                          0.23 *
                          animation.value,
                      height: MediaQuery.of(context).size.height *
                          0.107 *
                          animation.value,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 3 * animation.value,
                            top: 3 * animation.value),
                        child: RaisedButton(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.launch, color: Colors.white70),
                              Text(
                                'Image\n  List',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'imageList');
                          },
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                    SizedBox(
                      // TODO Remove Image
                      width: MediaQuery.of(context).size.width *
                          0.23 *
                          animation.value,
                      height: MediaQuery.of(context).size.height *
                          0.107 *
                          animation.value,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 3 * animation.value,
                            left: 3 * animation.value),
                        child: RaisedButton(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.image,
                                color: Colors.white70,
                              ),
                              Text(
                                'Remove\n Image',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13 * animation.value,
                                ),
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'removeImage');
                          },
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  // TODO Download Image
                  // padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(
                      top: 3 * animation.value,
                      right: 3 * animation.value,
                      left: 3 * animation.value),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.75 *
                            animation.value,
                        height: MediaQuery.of(context).size.height *
                            0.21 *
                            animation.value,
                        child: Container(
                          // margin: EdgeInsets.only(top: 3),
                          child: RaisedButton(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.stop,
                                  color: Colors.white70,
                                  size: 30 * animation.value,
                                ),
                                Text(
                                  'Download Image',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, 'downloadImage');
                            },
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // TODO Terminal Mode
                  width:
                      MediaQuery.of(context).size.width * 0.5 * animation.value,
                  height: MediaQuery.of(context).size.height *
                      0.195 *
                      animation.value,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 3 * animation.value, top: 3 * animation.value),
                    child: RaisedButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.airplay,
                            color: Colors.white70,
                            size: 30 * animation.value,
                          ),
                          Text(
                            'Terminal Mode',
                            style: TextStyle(color: Colors.white70),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "terminal");
                      },
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                SizedBox(
                  // TODO View All
                  width: MediaQuery.of(context).size.width *
                      0.50 *
                      animation.value,
                  height: MediaQuery.of(context).size.height *
                      0.195 *
                      animation.value,
                  child: Container(
                    margin: EdgeInsets.only(
                        right: 3 * animation.value,
                        left: 3 * animation.value,
                        top: 3 * animation.value),
                    child: RaisedButton(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.view_list,
                            color: Colors.white70,
                            size: 30 * animation.value,
                          ),
                          Text(
                            'View All',
                            style: TextStyle(color: Colors.white70),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "viewall");
                      },
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
