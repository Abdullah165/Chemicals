import 'package:chem/animation/fade_animation.dart';
import 'package:chem/block/management.dart';
import 'package:chem/constants.dart';
import 'package:chem/dbhelper.dart';
import 'package:chem/model/chemical.dart';
import 'package:chem/pages/chemical_details.dart';
import 'package:chem/pages/updateChemical.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  DbHelper helper;
  TextEditingController teSearch = TextEditingController();
  var allChemicals = [];
  var items = List();
  double increaseDelay = 0.2;

  @override
  void initState() {
    helper = DbHelper();
    super.initState();
    helper.allChemicals().then((chemical) {
      setState(() {
        allChemicals = chemical;
        items = allChemicals;
      });
    });
  }

  void showDeleteSuccessfullyOperation() {
    Fluttertoast.showToast(
      msg: 'Delete Done ✔',
      fontSize: 25,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red.shade200,
      textColor: Colors.red.shade900,
    );
  }

  void filterSearch(String query) async {
    var dummySearchList = allChemicals;
    if (query.isNotEmpty) {
      var dummyListData = List();
      dummySearchList.forEach((item) {
        var chemical = Chemical.fromMap(item);
        if (chemical.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items = [];
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items = [];
        items = allChemicals;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
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
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                0.6,
                TextField(
                  controller: teSearch,
                  style: kTextFieldLabelStyle,
                  onChanged: (value) {
                    setState(() {
                      filterSearch(value);
                    });
                  },
                  decoration: kTextFieldInputDecorationStyle,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    Chemical chemical = Chemical.fromMap(items[index]);
                    return Container(
                      child: FadeAnimation(
                        increaseDelay += 0.0002,
                        Card(
                          margin: EdgeInsets.all(8),
                          elevation: 5,
                          child: ListTile(
                            title: Text(
                              '${chemical.name}',
                              style: TextStyle(
                                  fontSize: 30, color: Colors.black87),
                            ),
                            trailing: Container(
                              width: 80,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.green[800],
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UpdateChemical(chemical),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red[900],
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          helper.deleteChemical(chemical.id);
                                        });
                                        showDeleteSuccessfullyOperation();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChemicalDetails(chemical),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
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
