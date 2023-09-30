import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  _centerImage(),
                  Container(
                      child: Column(children: [
                        _headline(),
                        _contentPage(),
                      ]))
                ],
              ),
            );
          } else {
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 300,
                      width: 300,
                      margin: EdgeInsets.all(10),
                      child: _centerImage()),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [_headline(), _contentPage()]))),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}

Container _centerImage() {
  return Container(
    padding: EdgeInsets.all(15),
    child: CircleAvatar(
      radius: 150,
      backgroundImage: NetworkImage(
        'https://i.pinimg.com/1200x/e7/5d/db/e75ddbda351d44e24b6b8099fa200aad.jpg',
      ),
    ),
  );
}

Container _headline() {
  return Container(
    child: Text(
      'John Doe',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
    ),
  );
}

Container _contentPage() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Wrap(
          children: [
            Text(
              'Lorem ipsum dolor sit amet, consectetur adip iscing elit. Nullam ac tortor euismod, bibendum libero vel, congue odio.',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 500,
          width: 500,
          child: Container(
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    child: Image.network(
                        'https://wallpaperaccess.com/full/1724575.jpg'),
                  );
                }),
          ),
        ),
      ],
    ),
  );
}