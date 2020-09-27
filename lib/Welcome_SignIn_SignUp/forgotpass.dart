import 'package:DockerApp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ForgotPassScreen extends StatefulWidget {
  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  bool call = false;
  @override
  Widget build(BuildContext context) {
    var auth = FirebaseAuth.instance;
    var email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[600],
        title: Text(
          "Account recovery",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            // color: Colors.black,
            fontSize: 22,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: call,
        child: Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              TextFormField(
                obscureText: false,
                autocorrect: false,
                enableSuggestions: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  email = value;
                },
                onFieldSubmitted: (value) async {
                  setState(
                    () {
                      call = true;
                    },
                  );
                  try {
                    await auth.sendPasswordResetEmail(email: email);
                    if (auth != email) {
                      toast("wrong email");
                    } else {
                      toast("Reset Link Send to ${email}");
                      Navigator.pushNamed(context, 'signin');
                    }
                  } catch (e) {
                    print(e);
                  }
                  setState(
                    () {
                      call = false;
                    },
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.35,
                ),
                child: RaisedButton(
                  onPressed: () async {
                    try {
                      await auth.sendPasswordResetEmail(email: email);
                      Navigator.pushNamed(context, 'signin');
                      toast("Reset Link Send to ${email}");
                    } catch (e) {
                      print(e);
                    }
                  },
                  color: Colors.lightBlue,
                  child: Text("Send"),
                  elevation: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
