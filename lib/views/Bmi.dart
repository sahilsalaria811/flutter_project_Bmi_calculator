import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';

class Bmi extends StatefulWidget {
  @override
  _Bmistate createState() => _Bmistate();
}

class _Bmistate extends State<Bmi> {
  final TextEditingController _heightcontroller = TextEditingController();
  final TextEditingController _weightcontroller = TextEditingController();
  double? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Bmi Calculator'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _heightcontroller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  labelText: 'Enter Your Height in Cms',
                  icon: Icon(Icons.trending_up)),
            ),
            SizedBox(
              height: 20,
              width: null,
            ),
            TextField(
              controller: _weightcontroller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Enter Your weight Kgs',
                icon: Icon(Icons.line_weight),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
              onPressed: calculateBMI,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              _result == null
                  ? "Enter Value"
                  : "${_result?.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Image(
              image: AssetImage('assets/BMIScale.jpg'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlueAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.ad_units_outlined,
                color: Colors.black,
              ),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.ad_units_outlined,
                color: Colors.black,
              ),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.ad_units_outlined,
                color: Colors.black,
              ),
              label: 'Home',
              backgroundColor: Colors.white),
        ],
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(_heightcontroller.text) / 100;
    double weight = double.parse(_weightcontroller.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;
    setState(() {});
  }
}
