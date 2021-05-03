import 'dart:convert';
import 'package:DockerApp/main.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;

class LaunchContainer extends StatefulWidget {
  @override
  _LaunchContainerState createState() => _LaunchContainerState();
}

class _LaunchContainerState extends State<LaunchContainer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imgs();
    //vol();
    net();
  }

  var output, osn, im, st, ntn, l, load = false;
  List image,
      //volume,
      network,
      driverNet,
      driverVol,
      tag,
      y = [],
      z = [],
      N = [];

  /*vol() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/showVol.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);

      volume = fo['volume'];
      driverVol = fo['driver'];
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = volume.length;
      load = false;
      var len = l != null ? l : 0;
      for (var i = 0; i < len; i++) {
        z.add('${volume[i]}:${driverVol[i]}');
      }
    });
  }*/

  imgs() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/showImage.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);

      image = fo['images'];
      tag = fo['versions'];
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = image.length;
      load = false;
      var len = l != null ? l : 0;
      for (var i = 0; i < len; i++) {
        y.add('${image[i]}:${tag[i]}');
      }
    });
  }

  net() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/showNet.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);

      network = fo['name'];
      driverNet = fo['driver'];
    } catch (e) {
      print('Something went wrong');
    }
    setState(
      () {
        l = network.length;
        load = false;
        var len = l != null ? l : 0;
        for (var i = 0; i < len; i++) {
          N.add('${network[i]}:${driverNet[i]}');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    lnch(os, i, n) async {
      var url = 'http://$ip/cgi-bin/launch.py?osn=${os}&im=${i}&ntn=${n}';
      var res, o, fo, foo;
      try {
        res = await http.get(url);
        o = res.body;
        fo = jsonDecode(o);
        foo = fo['output'];
      } catch (e) {
        foo = 'Plzzz connect to the Internet';
      }
      setState(() {
        output = '${foo}';
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Enter Details'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: load,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'OS Name:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    onChanged: (value) => {osn = value},
                    decoration: InputDecoration(
                      hintText: 'os-name',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Image And Version:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    child: DropdownButton(
                      hint: Text('Select Image'),
                      dropdownColor: Colors.grey,
                      value: im,
                      isExpanded: true,
                      elevation: 5,
                      onChanged: (value) {
                        setState(() {
                          im = value;
                        });
                      },
                      items: y.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Storage & Folder:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              /*Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton(
                      hint: Text('Select Storage'),
                      value: st,
                      elevation: 5,
                      isExpanded: true,
                      dropdownColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          st = value;
                        });
                      },
                      items: z.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),*/
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Network:',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton(
                      hint: Text('Select Network'),
                      value: ntn,
                      elevation: 5,
                      isExpanded: true,
                      dropdownColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          ntn = value;
                        });
                      },
                      items: N.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: Container(
                        child: RaisedButton(
                          onPressed: () {
                            lnch(osn, im, ntn);
                          },
                          color: Colors.lightBlue,
                          child: Text(
                            'Launch',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(output ?? ''),
              )
            ],
          ),
        ),
      ),
    );
  }
}
