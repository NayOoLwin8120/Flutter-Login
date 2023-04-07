import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:userlogin/Views/api/restapi.dart';
import 'package:userlogin/Views/model/user.dart';
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





  @override
  void initState() {
    super.initState();


  }
  final String apiUrl = 'https:jsonplaceholder.typicode.com/todos/1';
  // final Dio dio = Dio();

  Future<Post> _fetchPost() async {
    try {
      final response = await Dio().get(apiUrl);
      print(response.data);
      // print(response.runtimeType); // print the API response
       // print the API response
      if (response.statusCode! == 200) {
        print("Ok");
        // print(Post.fromJson(response.data!));
        // print(Post.fromJson());
        var dd=Post.fromJson(response.data);


        return Post.fromJson(response.data!);
      } else {
        throw Exception('Failed ');
      }
    } catch (e) {
      print(e); // print any runtime errors
      throw Exception('Failed to load post');
    }
  }
  // Future<Post> Api() async {
  //   final  data=  await RestApi.getData(base: 'https://jsonplaceholder.typicode.com/',endpoint:'todos/1' );
  //   print(data.runtimeType);
  //
  //   return data;
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
            FutureBuilder<Post>(
               future: _fetchPost(),
                builder:(context,snapshot){


                 if (snapshot.hasData) {
                   final posts = snapshot.data;
                   if(posts!=null){
                     return Text(posts.id);
                   }else{
                     return Text("Error");
                   }
                    // Text(posts.runtimeType.toString());
                    // return Text(posts?.title);
                   // Text(posts.name);

                 }

                 else if (snapshot.hasError) {
                   return Text('${snapshot.error}');
                 }


                return const SizedBox();
                }
            ),


           Container(
             child: _widgetOptions.elementAt(_selectedIndex),
           ),



          ],

        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // var  data =  RestApi.getData(base: 'https://jsonplaceholder.typicode.com/',endpoint:'todos/1' );
          //  print(data.runtimeType);
          _fetchPost();
          // var data=User.fromJson({"name":"Aung Aung","phone":"09962297286","username":"Nay oo Lwin"});
         // print(data.toJson());
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
