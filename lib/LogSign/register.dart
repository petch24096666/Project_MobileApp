import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mobile/LogSign/login.dart';
import 'package:mobile/home.dart';
import 'auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Become Red"),
          backgroundColor: Theme.of(context).primaryColor),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Please Enter Email"),
                      EmailValidator(errorText: "Email Bad Formatted")
                    ]),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String? email) {
                      profile.email = email!;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      validator:
                          RequiredValidator(errorText: "Please Enter Password"),
                      obscureText: _obscureText,
                      onSaved: (String? password) {
                        profile.password = password!;
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ))),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Text("Become Red", style: TextStyle(fontSize: 20)),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: profile.email,
                                    password: profile.password)
                                .then((value) {
                              formKey.currentState!.reset();
                              Fluttertoast.showToast(
                                  msg: "Now You are Part of Man U",
                                  gravity: ToastGravity.TOP);
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Home();
                              }));
                            });
                          } on FirebaseAuthException catch (e) {
                            print(e.code);
                            String message;
                            if (e.code == 'email-already-in-use') {
                              message = "email is already use";
                            } else if (e.code == 'weak-password') {
                              message =
                                  "Please enter a password of 6 or more characters";
                            } else {
                              message = e.message!;
                            }
                            Fluttertoast.showToast(
                                msg: message, gravity: ToastGravity.CENTER);
                          }
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
