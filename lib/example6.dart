// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

final themeData1 = ThemeData(
  primarySwatch: Colors.cyan,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.purple,
    textTheme: ButtonTextTheme.primary,
    shape: StadiumBorder(),
  ),
);

final themeData2 = ThemeData(
  primarySwatch: Colors.green,
  colorScheme: ColorScheme.dark(),
//  textTheme: TextTheme(body1: TextStyle(color: Colors.red)),
  buttonTheme: ButtonThemeData(
//    buttonColor: Colors.lightBlue,
  ),
);

class Example6 extends StatefulWidget {
  @override
  createState() => _Example6State();
}

class _Example6State extends State<Example6> {
  ThemeData themeData;

  @override
  void initState() {
    super.initState();
    themeData = themeData1;
  }

  void _updateTheme() {
    setState(() {
      themeData = themeData == themeData1 ? themeData2 : themeData1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: const Duration(milliseconds: 2000),
      curve: ElasticInOutCurve(),
      data: themeData,
      child: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedTheme Example'),
          actions: [
            IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: _updateTheme,
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text('I am a button'),
                onPressed: _updateTheme,
              ),
              Text('I am some text'),
            ],
          ),
        ),
      ),
    );
  }
}
