import 'package:flutter/material.dart';
class IncomeTax extends StatefulWidget{
  @override
  _IncomeTax createState() =>_IncomeTax();


}
class _IncomeTax extends State<IncomeTax>{
  double income=0.0;
  double percent;
  List<DropdownMenuItem> range=[];
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(title: Text("Income Tax calculator"),),
      body: SafeArea(
          child: Column(
            children: [
              Row(
                  children:[
                    Text('Income Range: ',style: TextStyle(
                      fontWeight: FontWeight.bold,

                    ),
                    ),
                    DropdownButton(

                      items: _getincomerange(),
                      onChanged:(value)=>

                          setState(() =>
                          percent=value
                          ),
                      value:  percent,

                    ),

                  ]
              ),
              TextField(
                  decoration: InputDecoration(
                      labelText: "Income "
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String value) {
                    try {
                      income = double.parse(value.toString());
                    } catch (exception) {
                      income = 0.0;
                    }
                  }
              ),
              RaisedButton(
                  child: new Text("Calculate"),
                  onPressed: () {
                    // double tax;
                    // double income;
                    // Calculate tip and total
                    var tax = income * percent / 100.0;
                    var total = income - tax;

// Generate dialog
                    AlertDialog dialog = new AlertDialog(
                        content: new Text("Tax Rs: $tax \n"
                            "Take Home Rs.: $total")
                    );

// Show dialog
                    showDialog(context: context, child: dialog);
                  }
              )

            ],
          )
      ),

    );
  }

  List<DropdownMenuItem> _getincomerange() {
    List<DropdownMenuItem> range=[];
    range.add(DropdownMenuItem(
      child: Text('0-2.5 lakh'),
      value: 0.0,));
    range.add(DropdownMenuItem(
      child: Text('2.5-5.0 lakh'),
      value: 5.0,));
    range.add(DropdownMenuItem(
      child: Text('5.0-7.5 lakh'),
      value: 10.0,));
    range.add(DropdownMenuItem(
      child: Text('7.5-10.0 lakh'),
      value: 15.0,));
    range.add(DropdownMenuItem(
      child: Text('10.0-12.5 lakh'),
      value: 20.0,));
    range.add(DropdownMenuItem(
      child: Text('12.5-15 lakh'),
      value: 25.0,));
    range.add(DropdownMenuItem(
      child: Text('Above 15 lakh'),
      value: 30.0,));
    return range;
  }
}