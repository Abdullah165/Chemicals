import 'package:chem/animation/fade_animation.dart';
import 'package:chem/dbhelper.dart';
import 'package:chem/model/chemical.dart';
import 'package:chem/widget/reusable_textfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateChemical extends StatefulWidget {
  Chemical chemical;

  UpdateChemical(this.chemical);

  @override
  _UpdateChemicalState createState() => _UpdateChemicalState();
}

class _UpdateChemicalState extends State<UpdateChemical> {
  TextEditingController teName = TextEditingController();
  TextEditingController teVolume = TextEditingController();
  TextEditingController tePrice = TextEditingController();
  TextEditingController teDose = TextEditingController();
  DbHelper helper;

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
    teName.text = widget.chemical.name;
    teVolume.text = widget.chemical.volume;
    tePrice.text = widget.chemical.price;
    teDose.text = widget.chemical.dose;
  }

  void showEditSuccessfullyOperation() {
    Fluttertoast.showToast(
      msg: 'Edit Done ✔',
      fontSize: 25,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green.shade200,
      textColor: Colors.green.shade900,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update ${teName.text} info',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                ReusableTextField(
                  controller: teName,
                  hintText: 'تعديل اسم المركب',
                  fillColor: Color(0xffA8BCD9),
                  delay: 0.8,
                ),
                ReusableTextField(
                  controller: teVolume,
                  hintText: 'تعديل الحجم',
                  fillColor: Color(0xffA8BCD9),
                  keyBoardType: TextInputType.number,
                  delay: 1.0,
                ),
                ReusableTextField(
                  controller: tePrice,
                  hintText: 'تعديل السعر',
                  fillColor: Color(0xffA8BCD9),
                  keyBoardType: TextInputType.number,
                  delay: 1.2,
                ),
                ReusableTextField(
                  controller: teDose,
                  hintText: 'تعديل الجرعة',
                  fillColor: Color(0xffA8BCD9),
                  keyBoardType: TextInputType.number,
                  delay: 1.4,
                ),
                FadeAnimation(
                  1.6,
                  CupertinoButton(
                    color: Colors.black,
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      var updatedChemical = Chemical({
                        'id': widget.chemical.id,
                        'name': teName.text,
                        'volume': teVolume.text,
                        'price': tePrice.text,
                        'dose': teDose.text,
                      });
                      helper.updateChemical(updatedChemical);
                      showEditSuccessfullyOperation();
                      Navigator.of(context).pop();
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
