import 'dart:convert';
import 'package:DockerApp/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RemoveAllContainer extends StatefulWidget {
  @override
  _RemoveAllContainerState createState() => _RemoveAllContainerState();
}

class _RemoveAllContainerState extends State<RemoveAllContainer> {
  void initState() {
    // TODO: implement initState
    super.initState();

    launchedContainer();
  }

  var l = 0;
  var load = false;
  List osls, statusls, imagels;
  launchedContainer() async {
    setState(() {
      load = true;
    });
    var url = 'http://$ip/cgi-bin/LosAll.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);
      setState(() {
        osls = fo['container'];
        statusls = fo['status'];
        imagels = fo['image'];
      });
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = osls.length;
      load = false;
    });
  }

  List<TableRow> y = [
    TableRow(children: [
      TableCell(
        child: Center(
          child: Text(
            'Container',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Status',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Image',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]),
  ];

  Widget tb() {
    var len = l != null ? l : 0;
    for (var i = 0; i < l; i++) {
      y.add(
        TableRow(children: [
          TableCell(
            child: Center(
              child: Text(
                '${osls[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Text(
                '${statusls[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Text(
                '${imagels[i]}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ]),
      );
    }
    return Table(
      border: TableBorder.all(width: 2),
      columnWidths: {
        0: FixedColumnWidth(90.0),
        1: FixedColumnWidth(150.0),
        2: FixedColumnWidth(130.0),
      },
      children: y,
    );

    // return TableRow(children: [TableCell(child: Text('$y'))]);
  }

  @override
  Widget build(BuildContext context) {
    var output;
    var osn;

    stp(os) async {
      var url = 'http://$ip/cgi-bin/stop.py?osn=${os}';
      var res, o, fo, foo;
      setState(() {
        load = true;
      });
      try {
        res = await http.get(url);
        o = res.body;
        fo = jsonDecode(o);
        foo = fo['output'];
      } catch (e) {
        foo = 'something went wrong';
      }
      setState(() {
        output = '${foo}';
        load = false;
      });
      toast('${output} has been stopped');
      //Navigator.pushNamed(context, "/stop");
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Remove All Container'),
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
                  'Enter Container name:',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    onSubmitted: (value) {
                      stp(value);
                    },
                    onChanged: (value) => {osn = value},
                    decoration: InputDecoration(
                        hintText: 'container-name',
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 90,
                  height: 40,
                  child: Container(
                    child: RaisedButton(
                      onPressed: () {
                        stp(osn);
                      },
                      color: Colors.lightBlue,
                      child: Text(
                        'Remove',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Launched Container',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                height: 400,
                child: ListView(children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      tb(),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
