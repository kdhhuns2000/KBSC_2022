import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'donation_list.dart';
import 'user_manage_class/alert.dart';
import 'user_manage_class/auth_management.dart';

class Start_page extends StatefulWidget {
  const Start_page({Key? key}) : super(key: key);

  @override
  State<Start_page> createState() => _Start_pageState();
}

class _Start_pageState extends State<Start_page> {
  bool SignUpState = false;

  void changeSignUp() {
    setState(() {
      if (SignUpState == false)
        SignUpState = true;
      else if (SignUpState == true) SignUpState = false;
    });
  }

  bool LogInState = false;

  void changeState() {
    setState(() {
      if (LogInState == false)
        LogInState = true;
      else if (LogInState == true) LogInState = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/start_bg_img.jpeg'),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: LogInState
              ? SignUpState
                  ? SignUpWidget(changeFunction: changeSignUp)
                  : LogInWidget(changeFunction: changeSignUp)
              : StartWidget(changeFunction: changeState),
        ),
      ),
    );
  }
}

class StartWidget extends StatefulWidget {
  const StartWidget({Key? key, required this.changeFunction}) : super(key: key);
  final Function() changeFunction;
  @override
  State<StartWidget> createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 350, 0, 30),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 5,
            child: Container(
              child: Text(
                'Find a new',
                style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Container(
              child: Text(
                'Friend',
                style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 30, 0),
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: widget.changeFunction,
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LogInWidget extends StatefulWidget {
  const LogInWidget({Key? key, required this.changeFunction}) : super(key: key);
  final Function() changeFunction;
  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  final Id = TextEditingController();
  final Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('LogIn',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 30))),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                  ),
                  labelText: 'ID',
                ),
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.blueAccent),
                ),
                controller: Id,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                  ),
                  labelText: 'Password',
                ),
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.blueAccent),
                ),
                controller: Password,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 100),
              padding: EdgeInsets.fromLTRB(40, 2, 40, 2),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                onPressed: () async {
                  bool auth = await AuthManage().signIn(Id.text, Password.text);
                  if (mounted && auth == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DonationList(),
                      ),
                    );
                  }
                },
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?",
                    style: TextStyle(color: Colors.white)),
                TextButton(
                  onPressed: widget.changeFunction,
                  child: Text(
                    'sign up',
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key, required this.changeFunction})
      : super(key: key);
  final Function() changeFunction;
  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final SignUpEmail = TextEditingController();
  final SignUpPassword = TextEditingController();
  final SignUpName = TextEditingController();
  final SignUpPhoneNumber = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 30),
                  color: Colors.white,
                  onPressed: widget.changeFunction,
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ],
            ),
            Text(
              'Sign Up',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                  ),
                  labelText: 'Email',
                ),
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.blueAccent)),
                controller: SignUpEmail,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                  ),
                  labelText: 'Password',
                ),
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.blueAccent)),
                controller: SignUpPassword,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                  ),
                  labelText: 'Name',
                ),
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.blueAccent)),
                controller: SignUpName,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                  ),
                  labelText: 'Phone Number',
                ),
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.blueAccent)),
                controller: SignUpPhoneNumber,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 100),
              padding: EdgeInsets.fromLTRB(40, 2, 40, 2),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                onPressed: () async {
                  bool auth = await SignUpManage().signIn(SignUpEmail.text, SignUpPassword.text, SignUpName.text, SignUpPhoneNumber.text, context);
                  if (mounted && auth == true) {
                    widget.changeFunction();
                  }
                },
                child: Text('Sign Up', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
