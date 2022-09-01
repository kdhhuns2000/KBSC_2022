import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'donation_list.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool signUpState = false;

  void changeSignUp() {
    setState(() {
      if (signUpState == false) {
        signUpState = true;
      } else if (signUpState == true) {
        signUpState = false;
      }
    });
  }

  bool logInState = false;

  void changeState() {
    setState(() {
      if (logInState == false) {
        logInState = true;
      } else if (logInState == true) {
        logInState = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/start_bg_img.jpeg'),
              ),
            ),
          ),
          logInState
              ? signUpState
                  ? SignUpWidget(changeFunction: changeSignUp)
                  : LogInWidget(changeFunction: changeSignUp)
              : StartWidget(changeFunction: changeState),
        ],
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
      margin: const EdgeInsets.fromLTRB(0, 350, 0, 30),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find a new',
            style: GoogleFonts.lobster(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          Text(
            'Friend',
            style: GoogleFonts.lobster(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 40, 30, 0),
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: widget.changeFunction,
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ),
            ],
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
  final idTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('LogIn', style: GoogleFonts.roboto(textStyle: const TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 30))),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                  ),
                  labelText: 'ID',
                ),
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blueAccent),
                ),
                controller: idTextEditingController,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                  ),
                  labelText: 'Password',
                ),
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blueAccent),
                ),
                controller: passwordTextEditingController,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 100),
              padding: const EdgeInsets.fromLTRB(40, 2, 40, 2),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DonationList(),
                    ),
                  );
                },
                child: const Text('Login', style: TextStyle(color: Colors.white)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Don't have an account?", style: TextStyle(color: Colors.white)),
                TextButton(
                  onPressed: widget.changeFunction,
                  child: Text(
                    'sign up',
                    style: GoogleFonts.acme(
                      textStyle: const TextStyle(
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
  const SignUpWidget({Key? key, required this.changeFunction}) : super(key: key);
  final Function() changeFunction;
  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final signUpIdTextEditingController = TextEditingController();
  final signUpPasswordTextEditingController = TextEditingController();
  final signUpNameTextEditingController = TextEditingController();
  final signUpPhoneNumberTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
                color: Colors.white,
                onPressed: widget.changeFunction,
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ],
          ),
          Text(
            'Sign Up',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 30),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                ),
                labelText: 'ID',
              ),
              style: GoogleFonts.roboto(textStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blueAccent)),
              controller: signUpIdTextEditingController,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                ),
                labelText: 'Password',
              ),
              style: GoogleFonts.roboto(textStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blueAccent)),
              controller: signUpPasswordTextEditingController,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                ),
                labelText: 'Name',
              ),
              style: GoogleFonts.roboto(textStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blueAccent)),
              controller: signUpNameTextEditingController,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
                ),
                labelText: 'Phone Number',
              ),
              style: GoogleFonts.roboto(textStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blueAccent)),
              controller: signUpPhoneNumberTextEditingController,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 100),
            padding: const EdgeInsets.fromLTRB(40, 2, 40, 2),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text('Sign Up', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
