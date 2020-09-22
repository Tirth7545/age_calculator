import 'package:flutter/material.dart';
import 'package:age/age.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DateTime birthday;
  DateTime today = DateTime.now();
  AgeDuration age;
  @override
  Widget build(BuildContext context) {


    // Find out your age

    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: OutlineButton(
                child: birthday == null
                    ? Text("Select Your Birthdate")
                    : Text("${birthday.day}/${birthday.month}/${birthday.year}"),
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1000, 3, 5),
                      maxTime: DateTime(2025, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        birthday = date;
                        age = Age.dateDifference(
                            fromDate: birthday, toDate: today, includeToDate: false);
                        setState(() {});
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(20)),

            age.toString()=="null"?Container():Text("Your age is",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            age.toString()=="null"?Container():Text("${age}",style:TextStyle(fontSize: 20),)

          ],
        ),
      ),
    );
  }
}
