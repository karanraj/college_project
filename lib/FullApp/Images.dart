import 'package:DockerApp/main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

//TODO Image List

class ImageList extends StatefulWidget {
  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    imgs();
  }

  var output;
  List imgls;
  List tagls;
  List idls;
  var l = 0;
  var load = false;

  imgs() async {
    setState(() {
      load = true;
    });
    var url = 'http://${ip}/cgi-bin/showImage.py';
    var res, fo;
    try {
      res = await http.get(url);
      fo = jsonDecode(res.body);

      imgls = fo['images'];
      tagls = fo['versions'];
      idls = fo['ids'];
    } catch (e) {
      print('Something went wrong');
    }
    setState(() {
      l = imgls.length;
      load = false;
    });
  }

  List<TableRow> y = [
    TableRow(children: [
      TableCell(
        child: Center(
          child: Text(
            'Image',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'Version',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      TableCell(
        child: Center(
          child: Text(
            'ID',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ])
  ];
  Widget tb() {
    var len = l != null ? l : 0;
    for (var i = 0; i < l; i++) {
      y.add(TableRow(children: [
        TableCell(
          child: Center(
            child: Text(
              '${imgls[i]}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        TableCell(
          child: Center(
            child: Text(
              '${tagls[i]}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        TableCell(
          child: Center(
            child: Text(
              '${idls[i]}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ]));
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Images Available'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: load,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            tb(),
          ],
        ),
      ),
    );
  }
}

// TODO Create Image

class CreateImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Create Image"),
      ),
      body: CreateImageBody(),
    );
  }
}

class CreateImageBody extends StatefulWidget {
  @override
  _CreateImageBodyState createState() => _CreateImageBodyState();
}

class _CreateImageBodyState extends State<CreateImageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: TextFormField(
              scrollPadding: EdgeInsets.all(20),
              autocorrect: false,
              enableSuggestions: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Os name',
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
            child: TextFormField(
              scrollPadding: EdgeInsets.all(20),
              autocorrect: false,
              enableSuggestions: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'image name:version',
              ),
            ),
          ),
          RaisedButton(
            onPressed: () => print("created"),
            color: Colors.lightBlue,
            child: Text("Create"),
            elevation: 10,
          ),
        ],
      ),
    );
  }
}

// TODO Download Image

class DownloadImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Download Image"),
      ),
      body: DownloadImageBody(),
    );
  }
}

class DownloadImageBody extends StatefulWidget {
  @override
  _DownloadImageBody createState() => _DownloadImageBody();
}

class _DownloadImageBody extends State<DownloadImageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: TextFormField(
              scrollPadding: EdgeInsets.all(20),
              autocorrect: false,
              enableSuggestions: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'image name',
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
            child: TextFormField(
              scrollPadding: EdgeInsets.all(20),
              autocorrect: false,
              enableSuggestions: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'version',
              ),
            ),
          ),
          RaisedButton(
            onPressed: () => print("created"),
            color: Colors.lightBlue,
            child: Text("Download"),
            elevation: 10,
          ),
        ],
      ),
    );
  }
}

// TODO Remove Image

class RemoveImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Remove Image"),
      ),
      body: RemoveImageBody(),
    );
  }
}

class RemoveImageBody extends StatefulWidget {
  @override
  _RemoveImageBody createState() => _RemoveImageBody();
}

class _RemoveImageBody extends State<RemoveImageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 15),
            child: TextFormField(
              scrollPadding: EdgeInsets.all(20),
              autocorrect: false,
              enableSuggestions: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'image name:version',
              ),
            ),
          ),
          RaisedButton(
            onPressed: () => print("created"),
            color: Colors.lightBlue,
            child: Text("Remove"),
            elevation: 10,
          ),
        ],
      ),
    );
  }
}

// TODO Push Image

class PushImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push Image"),
      ),
      body: PushImageBody(),
    );
  }
}

class PushImageBody extends StatefulWidget {
  @override
  _PushImageBodyState createState() => _PushImageBodyState();
}

class _PushImageBodyState extends State<PushImageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.only(
              top: 13,
              left: 10,
              right: 10,
              bottom: 15,
            ),
            child: TextFormField(
              scrollPadding: EdgeInsets.all(20),
              autocorrect: false,
              enableSuggestions: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'image name:version',
              ),
            ),
          ),
          RaisedButton(
            onPressed: () => print("created"),
            color: Colors.lightBlue,
            child: Text("Push"),
            elevation: 10,
          ),
        ],
      ),
    );
  }
}
