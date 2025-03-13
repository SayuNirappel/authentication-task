import 'package:auth_task/main.dart';
import 'package:auth_task/view/home_screen/home_screen.dart';
import 'package:auth_task/view/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final semailkey = GlobalKey<FormState>();
  final spasswordkey = GlobalKey<FormState>();

  TextEditingController semailcontroller = TextEditingController();
  TextEditingController spasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Todo : write code  create controllers and form keys
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign in to Your Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),

              // email input fied
              Form(
                key: semailkey,
                child: TextFormField(
                  controller: semailcontroller,
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
                    if (semailcontroller.text.contains("@")) {
                      return null;
                    }
                    return "Email Mismatch";
                  },
                ),
              ),
              SizedBox(height: 20),
              // password input field
              Form(
                key: spasswordkey,
                child: TextFormField(
                  obscureText: true,
                  obscuringCharacter: "\*",
                  controller: spasswordcontroller,
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
                    if (spasswordcontroller.text.isNotEmpty) {
                      return null;
                    }
                    return "Wrong PassWord";
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 10,
                          ),
                        ),
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Forgot password",
                    style: TextStyle(
                      color: Color(0xff1a75d2),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  if (semailkey.currentState!.validate() &&
                      spasswordkey.currentState!.validate()) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    String? storedEmail = prefs.getString("email");
                    String? storedPassword = prefs.getString("pass");

                    if (semailcontroller.text == storedEmail &&
                        spasswordcontroller.text == storedPassword) {
                      await prefs.setBool("islogged", true);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                          (Route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Invalid Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ));
                    }
                  }
                  // Todo : write code  to navigate to home screen on successful Login with registered credentials
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff1a75d2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Sign in",
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
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationScreen()));
                      },
                      child: Text(
                        "Sign Up",
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
        ));
  }
}
