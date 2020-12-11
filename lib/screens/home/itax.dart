import 'package:flutter/material.dart';

class Itax extends StatefulWidget {
  @override
  GSTForm createState() => GSTForm();
}

class GSTForm extends State<Itax> {
  var rates = [0 , 5, 10, 15, 20 , 25 , 30];
  var gstRate = 30;
  double includingRate = 0;
  double gstAmount = 0;
  double excludingRate = 0;

  @override
  void initState() {
    super.initState();
    gstRate = rates[6];
  }

  TextEditingController includingGSTController = new TextEditingController();
  TextEditingController excludingGSTController = new TextEditingController();
  TextEditingController gstController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Income Calculator'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            getGSTIcon(),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Select Tax  Rate',
                      style: textStyle,
                    ),
                  ),
                  Container(
                    width: 10.0,
                  ),
                  Expanded(
                    child: DropdownButton<int>(
                      items: rates.map((rate) {
                        return DropdownMenuItem<int>(
                          value: rate,
                          child: Text(
                            '$rate %',
                            style: textStyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (rate) {
                        if (rate != gstRate)
                          setState(() {
                            gstRate = rate;
                            includingGSTController.clear();
                            gstController.clear();
                            excludingGSTController.clear();
                          });
                      },
                      value: gstRate,
                    ),
                  )
                ],
              ),
            ),
            //Widget getGSTRateDropDown(),

            Padding(
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                onChanged: (value) {
                  setState(() {
                    excludingRate = value.length > 0 ? double.parse(value) : 0;
                    double gst = (gstRate * excludingRate) / 100;
                    double including = excludingRate - gst;

                    gstController.text = gst.toStringAsFixed(3);
                    includingGSTController.text = including.toStringAsFixed(3);
                  });
                },
                controller: excludingGSTController,
                decoration: InputDecoration(
                    labelText: 'Annual income',
                    hintText: 'enter ur salary',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            ),
            Padding(
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                onChanged: (value) {
                  double excluding;
                  double including;
                  setState(() {
                    if(gstRate != 0){
                      gstAmount = value.length > 0 ? double.parse(value) : 0;
                      excluding = (100 / gstRate) * gstAmount;
                      including = excluding + gstAmount;
                    }else {
                      gstAmount= 0;
                      excluding = (100 / 1) * gstAmount;
                      including = excluding + gstAmount;
                    }


                    includingGSTController.text = including.toStringAsFixed(3);
                    excludingGSTController.text = excluding.toStringAsFixed(3);
                  });
                },
                controller: gstController,
                decoration: InputDecoration(
                    hintText: 'Tax',
                    labelText: 'Tax ($gstRate%)',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  onChanged: (value) {
                    setState(() {
                      includingRate =
                      value.length > 0 ? double.parse(value) : 0;
                      double gst = (includingRate * gstRate / 100);
                      double excluding = includingRate - gst;
                      gstController.text = gst.toStringAsFixed(3);
                      excludingGSTController.text =
                          excluding.toStringAsFixed(3);
                    });
                  },
                  controller: includingGSTController,
                  decoration: InputDecoration(
                      hintText: 'Amount you get',
                      labelText: 'Take Home',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),

            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: RaisedButton(
                color: Colors.teal,
                padding: EdgeInsets.only(
                    top: 15.0, bottom: 15.0, left: 100.0, right: 100.0),
                child: Text(
                  'Clear',
                  style: textStyle,
                ),
                onPressed: () {
                  includingGSTController.clear();
                  excludingGSTController.clear();
                  gstController.clear();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getGSTIcon() {
    AssetImage assetImage = AssetImage('images/icon.png');
    Image image = Image(image: assetImage, height: 125.0, width: 125.0);
    return Container(
      child: image,
      alignment: Alignment(0.0, 0.0),
      margin: EdgeInsets.all(25.0),
    );
  }

//  Widget getGSTRateDropDown() {
//    DropdownButton<String>(
//
//    )
//  }
}
