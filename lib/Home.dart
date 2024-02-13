import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idute/TwoTextsColumn.dart';
import 'package:idute/Users.dart';

Home homeWidget = Home();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      drawer: Drawer(
        child: Container(
          color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "IDUTE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 45),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>UsersWidget),
                      );
                    },
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      "User",
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.pin_drop,
                      color: Colors.white,
                    ),
                    title: Text(
                      "MVI",
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.rocket_launch,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Join Startups",
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.report,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Reports",
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.help,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Help",
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.receipt,
                      color: Colors.white,
                    ),
                    title: Text(
                      "App Suggestions",
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white,fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TwoTextsColumn(text1: 'Total Users', text2: '108'),
                TwoTextsColumn(text1: 'Average Uses Time', text2: '')
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TwoTextsColumn(text1: 'Monthly Active Users', text2: ''),
                TwoTextsColumn(text1: 'Daily Active Users', text2: '')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
