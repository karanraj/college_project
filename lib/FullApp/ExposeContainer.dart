import 'package:flutter/material.dart';

class ExposeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Expose Container"),
      ),
      body: Expose(),
    );
  }
}

class Expose extends StatefulWidget {
  @override
  _ExposeState createState() => _ExposeState();
}

class _ExposeState extends State<Expose> {
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
            ),
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
            margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
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
          Card(
            margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: TextFormField(
              scrollPadding: EdgeInsets.all(20),
              autocorrect: false,
              enableSuggestions: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Volume name:directory name',
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: TextFormField(
              scrollPadding: EdgeInsets.all(20),
              autocorrect: false,
              enableSuggestions: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'base port number',
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: TextFormField(
              scrollPadding: EdgeInsets.all(20),
              autocorrect: false,
              enableSuggestions: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'container port number',
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.only(
              top: 10,
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
                labelText: 'network name',
              ),
            ),
          ),
          RaisedButton(
            onPressed: () => print("created"),
            color: Colors.lightBlue,
            child: Text("Expose"),
            elevation: 10,
          ),
        ],
      ),
    );
  }
}
