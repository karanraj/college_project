import 'package:flutter/material.dart';

class CreateVolume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Create Volume"),
      ),
      body: CreateVolumeBody(),
    );
  }
}

class CreateVolumeBody extends StatefulWidget {
  @override
  _CreateVolumeBody createState() => _CreateVolumeBody();
}

class _CreateVolumeBody extends State<CreateVolumeBody> {
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
                labelText: 'Volume name',
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
