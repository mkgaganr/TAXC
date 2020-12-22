import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:taxc/screens/home/home.dart';

class Faqs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text( "Q1:When is it mandatory to file return of income ?"
          "                                                                      A: it is mandatory to file return of income for a company and a firm.however,individuals,HUF,AOP,BOI are mandatorily required to file return of income if the income exceed basis exemption limit of rs.2.5 lakhs."
          " This limit is different for senior citizens and super senior citizens."
          "                          Q2:Can i file return of income even if my income is below taxable limits?"
          "                               A:Yes,you can file return of income voluntarily even if your income is less than basic exemption limit."
          "                                                       Q3: What documents are to be enclosed along the return of income?"
          "                                             A:there is no need to enclose any documents with the return of income.However,one should retain the documents to produce"
          "any complement authority as and when required in future."
          "                                                                    "
          ,
          style: TextStyle(fontSize: 16,color: Colors.deepPurple[800]))),

    );
  }
}
