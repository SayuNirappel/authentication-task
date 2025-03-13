import 'package:auth_task/main.dart';
import 'package:auth_task/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // final formKey = GlobalKey<FormState>();
  final formkey1 = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  final formkey3 = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Todo : write code  create controllers and form keys

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          //child: Form(
          // key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign Up for Free",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Form(
                key: formkey1,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: "Your Eamil Address",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff1a75d2),
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.shade400,
                        )),
                  ),
                  validator: (value) {
                    if (emailController.text.contains("@")) {
                      return null;
                    } else {
                      return "Wrong Email";
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: formkey2,
                child: TextFormField(
                  obscureText: true,
                  obscuringCharacter: "\*",
                  controller: passController,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      hintText: "Your Password",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff1a75d2),
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red.shade400,
                          )),
                      suffixIcon: Icon(
                        Icons.visibility_off_rounded,
                        color: Colors.grey,
                      )),
                  validator: (value) {
                    if (passController.text.isNotEmpty) {
                      return null;
                    }
                    return "Enter a valid Password";
                  },
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: formkey3,
                child: TextFormField(
                  obscureText: true,
                  obscuringCharacter: "\*",
                  controller: confirmPassController,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      hintText: "Confirm Your Password",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xff1a75d2),
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red.shade400,
                          )),
                      suffixIcon: Icon(
                        Icons.visibility_off_rounded,
                        color: Colors.grey,
                      )),
                  validator: (value) {
                    if (passController.text == confirmPassController.text) {
                      return null;
                    }
                    return "Passwords Mismatch";
                  },
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  // Todo : write code  to navigate to login screen on successful registration
                  //formKey.currentState!.validate();
                  if (formkey1.currentState!.validate() &&
                      formkey2.currentState!.validate() &&
                      formkey3.currentState!.validate()) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString("email", emailController.text);
                    await prefs.setString("pass", passController.text);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff1a75d2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xff1a75d2),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                ],
              )
            ],
          ),
          //),
        ));
  }
}
