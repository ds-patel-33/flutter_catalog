import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/login_image.png"),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Username", labelText: "Useranme :"),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Username", labelText: "Useranme :"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 36,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  changeButton = true;
                });
                await Future.delayed(Duration(seconds: 1));
                Navigator.pushNamed(context, Routes.homePageRoute);
              },
              child: AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: Duration(seconds: 1),
                child: Container(
                  height: 50,
                  width: changeButton ? 50 : 120,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8)),
                  child: Center(
                    child: changeButton
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : Text("Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1.1)),
                  ),
                ),
              ),
            )
            // MaterialButton(
            //   elevation: 0.5,
            //   minWidth: 120,
            //   height: 40,
            //   color: Colors.deepPurple,
            //   child: Text(
            //     "Login",
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   onPressed: () {
            //     Navigator.pushNamed(context, Routes.homePageRoute);
            //   },
            // )
          ],
        ),
      ),
    ));
  }
}
