import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userlogin/Views/api/controller.dart';
import 'package:userlogin/Views/pages/signup.dart';
import 'package:userlogin/Views/pages/welcome.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   resizeToAvoidBottomInset: false,
    //   appBar: AppBar(
    //     backgroundColor: Colors.white,
    //     elevation: 0,
    //   ),
    //   body:
    return Container(
        child: Column(
          children: [
            // Lottie.network(
            //     "https://assets1.lottiefiles.com/packages/lf20_wzAk0pBKAp.json",
            //     height: 200,
            //     width: double.infinity),
            Form(
              key: _key,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                    Container(

                     child: Text(
                      "Multivendor",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                   ),
                    const SizedBox(
                      height: 32,
                    ),
                      Text(
                        "Welcome!",
                        style:TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 16 / 2,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        "Login to continue",
                          style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding:
                             EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: TextFormField(
                          controller: phoneController,
                          decoration:  InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
                            hintText: "Enter your email address",
                            labelText: "Email ",
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? "Email field required" : null,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: TextFormField(
                          controller: passwordController,
                          decoration:  InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
                            hintText: "Enter Your Password",
                            labelText: "password ",
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? "Password field required" : null,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_key.currentState!.validate()) {
                                await userController
                                    .login(
                                        phone: phoneController.text,
                                        password: passwordController.text)
                                    .then((response) => {
                                          if (response.message == "Login Sucessfull")
                                            {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        WelcomePage(),
                                                  ))
                                            }
                                          else
                                            {showAlertDialog(context, "Login Failed")}
                                        });
                              } else {
                                print("Form validation failed");
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.login),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text("L O G I N ")
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Do you have no account? ",style:TextStyle(fontSize: 20,fontWeight:FontWeight.w400)),
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupPage(),
                                  )),
                              child: Text(
                                "Register Now",style:TextStyle(fontSize: 20,color: Colors.blue,fontStyle:FontStyle.italic,decoration:TextDecoration.underline),
                              ),
                            ),
                          ],
                        )
                      )
                    ],
                  ),

              ),

          ],
        ),

    );
    // );
  }

  showAlertDialog(BuildContext context, String info) {
    // set up the buttons
    Widget okButton = ElevatedButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Registration"),
      content: Text(
        info,
        style: const TextStyle(color: Colors.green),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
