import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:taxc/screens/home/home.dart';
import 'package:url_launcher/url_launcher.dart';



class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 60.0,),
                Text(
                  'You need any help plz message us on this email ',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 60.0,),
                Card(
                  color: Colors.blue[100],
                  margin:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.mail_sharp,
                      color: Colors.red[900],
                    ),
                    title: Text(
                      'gagan.cs18@bmsce.ac.in',
                      style:
                      TextStyle(fontFamily: 'BalooBhai', fontSize: 18.0),
                    ),
                    onTap: () => launch("mailto:gagan.cs18@bmsce.ac.in"),
                  ),
                ),
                Card(
                  color: Colors.blue[100],
                  margin:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blueAccent[900],
                    ),
                    title: Text(
                      '+91 9380417069',
                      style:
                      TextStyle(fontFamily: 'BalooBhai', fontSize: 18.0),
                    ),
                    onTap: () => launch("tel:+91 93804 17069"),
                  ),
                ),
              ]
          )
      ),
    );

  }
}