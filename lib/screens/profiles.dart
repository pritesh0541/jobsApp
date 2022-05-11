// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jobs/screens/search.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final url = "https://reqres.in/api/users?page=1";
  var _postJson = [];

  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postJson = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initstate() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Profile",
            textAlign: TextAlign.center,
          ),
          elevation: 0,
          leading: GestureDetector(
            onTap: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                )),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 10,
          //_postJson.length,

          itemBuilder: (context, i) {
            //  final post = _postJson[i];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 75,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Text("First Name"),
                                  //        Text("firstname: ${post["first_name"]}"),
                                  SizedBox(width: 5),
                                  Text("Last Name"),
                                  //        Text("lastname: ${post["last_name"]}"
                                ]),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Email Address"),
                                //      Text("Email: ${post["email"]}"),
                              ],
                            )
                          ],
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
