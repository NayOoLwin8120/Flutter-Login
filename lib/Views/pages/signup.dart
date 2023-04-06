import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:userlogin/Views/api/controller.dart';
import 'package:userlogin/Views/pages/login.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false ,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: _key,
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Multivendor",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Welcome !",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text("Regiester For Your Account",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextFormField(
                controller: emailController,
                decoration:  InputDecoration(
                  prefixIcon:Icon(Icons.email),
                  border:OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  hintText: "Email",
                  label: Text("Email"),
                ),

                textInputAction: TextInputAction.next,
                keyboardType:TextInputType.emailAddress ,
                validator: (value) =>
                    value!.isEmpty ? "Email field required" : null,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextFormField(
                controller: usernamecontroller,
                decoration:  InputDecoration(
                  prefixIcon:Icon(Icons.person),
                  border:OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  hintText: "Enter Your name",
                  label: Text("User Name"),

                ),
                validator: (value) =>
                    value!.isEmpty ? "Username  field required" : null,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextFormField(
                controller: passwordController,
                decoration:  InputDecoration(
                  prefixIcon:Icon(Icons.key),
                  border:OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  hintText: "Enter Your Password",
                  label: Text("Password"),
                ),
                validator: (value) =>
                    value!.isEmpty ? "  Password field required" : null,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextFormField(
                  controller: confirmpasswordController,
                  decoration:  InputDecoration(
                    prefixIcon:Icon(Icons.key),
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    hintText: "Enter Your Confirm Password",
                    label: Text("Confirm Password"),
                  ),
                  validator: (value) {
                    if (value!.isEmpty)
                      return " Confirm Paswword field required";
                    if (value != passwordController.text)
                      return "Password and Confrim password is not same";
                  }),
            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      await userController
                          .createAccout(
                              email: emailController.text,
                              username: usernamecontroller.text,
                              password: passwordController.text)
                          .then((response) => {
                                if (response.message ==
                                    "Account created successful")
                                  {
                                    showAlertDialog(
                                        context, "Account created successful")
                                  }
                                else
                                  {
                                    {
                                      showAlertDialog(
                                          context, 'Failed to create account')
                                    }
                                  }
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

                        SizedBox(
                          width: 8,
                          height: 10,
                        ),
                        Text("Create Account",style: TextStyle(fontSize: 18,),)
                      ],
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do You Have a Account !",style: TextStyle(fontSize: 16),),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text("Login",style: TextStyle(fontSize: 17,fontStyle:FontStyle.italic),))
              ],
            )
          ],
        ),
      ),
    );
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
