import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart' as http;

class Terminal extends StatefulWidget {
  @override
  _TerminalState createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  var authc = FirebaseAuth.instance;
  var fs = FirebaseFirestore.instance;
  var load = false, input = '', output;
  var msgc = TextEditingController();

  api(c) async {
    var url = 'http://172.20.10.8/cgi-bin/web.py?x=${c}';
    var res = await http.get(url);
    var out = res.body;
    setState(() {
      output = out;
    });
    await fs.collection('docker').add({
      'cmd': c,
      'output': out,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('${authc.currentUser.email}'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: load,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              input ?? '',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              height: 250,
              child: ListView(
                children: [
                  Text(
                    output ?? '',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              controller: msgc,
              onChanged: (value) => input = value,
              cursorColor: Colors.white70,
              cursorWidth: 7,
              autofocus: false,
              onSubmitted: (value) async {
                msgc.clear();
                setState(() {
                  load = true;
                });
                try {
                  await api(value);
                } catch (e) {
                  print(e);
                }
                setState(() {
                  load = false;
                });
              },
              decoration: InputDecoration(
                  focusColor: Colors.white,
                  prefix: Text(
                    '[${authc.currentUser.email}]\$',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Send'),
                  onPressed: () async {
                    msgc.clear();
                    setState(() {
                      load = true;
                    });
                    try {
                      await api(input);
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      load = false;
                    });
                  },
                ),
                SizedBox(
                  width: 80,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
