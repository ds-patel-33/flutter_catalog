import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";

  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;

  moveToHomePage() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, Routes.homePageRoute).then((value) {
        setState(() {
          changeButton = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Image.asset("assets/images/hey.png"),
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
              child: Form(
                key: _formKey,
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return " Username can't be empty";
                        }
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password :"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return " Password can't be empty";
                        } else if (value.length < 6) {
                          return "Password lenght shold atleast 6";
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Material(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(changeButton ? 40 : 8),
              child: InkWell(
                splashColor: Colors.white,
                onTap: () => moveToHomePage(),
                child: AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(seconds: 1),
                  width: changeButton ? 40 : 140,
                  height: 40,
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
          ],
        ),
      ),
    ));
  }
}
