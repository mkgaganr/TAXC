import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:taxc/screens/home/home.dart';

class Policies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    child: Center(child: Text( "Introduction"
        "                                                 This is the Privacy Policy of tax calculator,we refer to our products and services as the 'Service'."
        "your use of the Service signifies that you agree with the terms of this privacy policy."
        "When you agree to use our Service,you accept the collection and use of information in relation to this policy."
        "The Personal information that we collect is used for providing and improving the service."
        "We will not use or share your information with anyone as described in this Privacy Policy."

        ,
        style: TextStyle(fontSize: 20,color: Colors.grey[800])))
    );
  }
}
