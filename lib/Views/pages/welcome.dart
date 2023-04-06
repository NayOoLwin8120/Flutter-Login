import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:userlogin/Views/api/restapi.dart';
import 'package:userlogin/Views/pages/login.dart';
import 'package:userlogin/Views/pages/signup.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _selectedIndex = 0;
  static  List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',

    ),
    Text(
      'Index 3: Settings',
      // style: optionStyle,
    ),

    Text(
      'Index 2: School',
      // style: optionStyle,
    ),
    LoginScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void initState() {
   RestApi.getData();
  }


  // void getData() async {
  //   try {
  //     var response = await Dio()
  //         .get('https://protocoderspoint.com/jsondata/superheros.json');
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children:  [
            // Text(
            //   "WELCOME",
            //   style: TextStyle(color: Colors.green, fontSize: 30),
            // ),
            // Container(
            //     child:Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text("Do you have no account? ",style:TextStyle(fontSize: 20,fontWeight:FontWeight.w400)),
            //         InkWell(
            //           onTap: () => Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => SignupPage(),
            //               )),
            //           child: Text(
            //             "Register Now",style:TextStyle(fontSize: 20,color: Colors.blue,fontStyle:FontStyle.italic,decoration:TextDecoration.underline),
            //           ),
            //         ),
            //       ],
            //     )
            // ),

           Container(
             child: _widgetOptions.elementAt(_selectedIndex),
           ),


          ],

        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // RestApi.get(
          //   baseUrl: "https://pokeapi.co/api/v2/",
          //   query: "ability/?limit=20&offset=20",
          // );

         RestApi.getData(base: 'https://protocoderspoint.com/',endpoint:'jsondata/superheros.json' );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),



    );
  }
}
