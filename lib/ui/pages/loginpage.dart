import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../store/loginpage_form_store.dart';
import 'homepage.dart';
class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var store;
  final textFieldFocusNode = FocusNode();
  @override
  void initState() {
    store = LoginPageFormStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/flutter-logo.png',
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Log in to continue',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Form(
              child: Column(
                children: <Widget>[
                  Observer(
                    builder: (_) => Padding(
                      padding:
                          const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          labelText: 'Username',
                          hintText: 'Enter username',
                          errorText: store.error.usernameError,
                        ),
                        onChanged: (value) => store.setUsername(value),
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) => Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
                      child: TextField(
                        focusNode: textFieldFocusNode,
                        obscureText: !store.isPasswordVisible,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          labelText: 'Password',
                          hintText: 'Enter password',
                          errorText: store.error.passwordError,
                          suffixIcon: IconButton(
                            icon: Icon(
                              store.isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              //Flutter issue to disable keyboard when icon is pressed
                              textFieldFocusNode.unfocus();
                              textFieldFocusNode.canRequestFocus = false;
                              store.toggleVisibility();
                              Future.delayed(Duration(milliseconds: 100), () {
                                textFieldFocusNode.canRequestFocus = true;
                              });
                            },
                          ),
                        ),
                        onChanged: (value)=>store.setPassword(value),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: (){
                      if(store.validateAll()){
                        Navigator.pushReplacementNamed(
                          context, 
                          HomePage.routeName,
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
