// ignore_for_file: prefer_const_constructors
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobs/model/search_model.dart';
import 'package:jobs/screens/profiles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

Future<SearchModel?> submitData(String name, String job) async {
  var response = await http.post(Uri.https('reqres.in', 'api/users'),
      body: {"name": name, "job": job});

  var data = response.body;
  print(data);

  if (response.statusCode == 201) {
    String responseString = response.body;
    searchModelFromJson(responseString);
  } else
    return null;
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchModel _searchModel;
  TextEditingController fullnameController = TextEditingController();
  TextEditingController jobnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10 * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Full Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: fullnameController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Job Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: jobnameController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    height: 20 * 2.5,
                    color: Colors.blue,
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () async {
                      // String name = fullnameController.text;
                      // String job = jobnameController.text;
                      // SearchModel? data = await submitData(name, job);
                      // setState(() {
                      //   _searchModel = data!;
                      // });

                      // if (data?.statuscode == 201) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                      // }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
