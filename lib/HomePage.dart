import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MaterialColor> _color = [
    Colors.brown,
    Colors.pink,
    Colors.indigo,
    Colors.teal,
    Colors.deepOrange,
    Colors.purple,
    Colors.cyan,
    Colors.green,
    Colors.lime,
    Colors.yellow
  ];

  List usersData;
  getAllData() async {
    var api = 'http://jsonplaceholder.typicode.com/users';
    http.Response data = await http.get(api);
    setState(() {
      usersData = json.decode(data.body);
    });
  }

  Future fetchData() async {
    getAllData();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Complex Json API Queries',
          ),
          backgroundColor: Color(0xff0063e0),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: null,
              color: Colors.white,
            ),
            IconButton(
              color: Colors.deepOrange,
              icon: Icon(Icons.close),
              onPressed: null,
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: fetchData,
          child: usersData == null
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xff0063e0),
                    ),
                  ),
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      MaterialColor mColor = _color[index % _color.length];
                      return Card(
                        elevation: 10.0,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: mColor,
                                foregroundColor: Colors.black54,
                                child: Text(usersData[index]['id'].toString()),
                              ),
                            ),
                            Container(
                              width: 300.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name: ' + usersData[index]['name'],
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Username: ' + usersData[index]['username'],
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Email: ' + usersData[index]['email'],
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Street: ' +
                                        usersData[index]['address']['street'],
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Street: ' +
                                        usersData[index]['address']['suite'],
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'City: ' +
                                        usersData[index]['address']['city'],
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Zipcode: ' +
                                        usersData[index]['address']['zipcode'],
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Latitude: ' +
                                        usersData[index]['address']['geo']
                                            ['lat'],
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Latitude: ' +
                                        usersData[index]['address']['geo']
                                            ['lng'],
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Phone: ' + usersData[index]['phone'],
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Company Name: ' +
                                        usersData[index]['company']['name'],
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Company Phrase: ' +
                                        usersData[index]['company']
                                            ['catchPhrase'],
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Company Tagline: ' +
                                        usersData[index]['company']['bs'],
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: usersData == null ? 0 : usersData.length,
                  )),
        ));
  }
}
