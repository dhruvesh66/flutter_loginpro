import 'package:flutter/material.dart';
import 'package:flutter_loginpro/utils/MyRoutes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static var route = "/LoginPage";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            "Assets/login1.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.ltr,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "username can not be empty";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password can not be empty";
                    }
                    var password =
                        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-z\d]{6,}$');
                    if (password.hasMatch(value))
                      return null;
                    else
                      return "password cahnge must have character and number and length more than 6 character";
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "password",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      width: changeButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton
                          ? Icon(Icons.done)
                          : Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                      duration: Duration(milliseconds: 400),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 400));
      await Navigator.pushNamed(context, MyRoutes.homePage);
      setState(() {
        changeButton = false;
      });
    }
  }
}
