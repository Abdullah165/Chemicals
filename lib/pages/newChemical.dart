import 'package:chem/animation/fade_animation.dart';
import 'package:chem/block/management.dart';
import 'package:chem/dbhelper.dart';
import 'package:chem/model/chemical.dart';
import 'package:chem/widget/reusable_textfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ChemicalsInfo extends StatefulWidget{
  @override
  _ChemicalsInfoState createState() => _ChemicalsInfoState();
}

class _ChemicalsInfoState extends State<ChemicalsInfo> {
  String chemicalName = 'empty',
      chemicalVolume = 'empty',
      chemicalPrice = 'empty',
      chemicalDose = 'empty';

  DbHelper _dbHelper;

  @override
  void initState() {
    _dbHelper = DbHelper();
    super.initState();
  }

  void showAddSuccessfullyOperation() {
    Fluttertoast.showToast(
      msg: 'Add Done ✔',
      fontSize: 25,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green.shade200,
      textColor: Colors.green.shade900,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 10),
                child: Align(
                  child: FadeAnimation(
                    0.8,
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 35,
                        color: Colors.orange,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
              ),
              ReusableTextField(
                onChanged: (value) {
                  chemicalName = value;
                },
                hintText: 'اسم المركب',
                fillColor: Color(0xffA8BCD9),
                delay: 1.0,
              ),
              ReusableTextField(
                onChanged: (value) {
                  chemicalVolume = value;
                },
                hintText: 'الحجم',
                fillColor: Color(0xffA8BCD9),
                keyBoardType: TextInputType.number,
                delay: 1.2,
              ),
              ReusableTextField(
                onChanged: (value) {
                  chemicalPrice = value;
                },
                hintText: 'السعر',
                fillColor: Color(0xffA8BCD9),
                keyBoardType: TextInputType.number,
                delay: 1.4,
              ),
              ReusableTextField(
                onChanged: (value) {
                  chemicalDose = value;
                },
                hintText: 'الجرعة',
                fillColor: Color(0xffA8BCD9),
                keyBoardType: TextInputType.number,
                delay: 1.6,
              ),
              SizedBox(
                height: 10,
              ),
              FadeAnimation(
                1.8,
                CupertinoButton(
                  color: Colors.black,
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    Chemical chemical = Chemical(
                      {
                        'name': chemicalName,
                        'volume': chemicalVolume,
                        'price': chemicalPrice,
                        'dose': chemicalDose,
                      },
                    );
                    if (chemicalName == 'empty' &&
                        chemicalPrice == 'empty' &&
                        chemicalVolume == 'empty' &&
                        chemicalDose == 'empty') {
                      return;
                    } else {
                      await _dbHelper.addChemical(chemical);
                      showAddSuccessfullyOperation();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
