import 'package:chem/animation/fade_animation.dart';
import 'package:chem/block/management.dart';
import 'package:chem/dbhelper.dart';
import 'package:chem/model/chemical.dart';
import 'package:chem/pages/newChemical.dart';
import 'package:chem/pages/search.dart';
import 'package:chem/pages/updateChemical.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'chemical_details.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper helper;

  double increaseDelay = 0.2;

  Color bulb;

  DbHelper _dbHelper;

  @override
  void initState() {
    _dbHelper = DbHelper();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    AppManagement _appManagement = Provider.of<AppManagement>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: () {
              _appManagement.getMood();
              if (_appManagement.isChange) {
                _appManagement.setDarkMood();
                bulb = Colors.white;
              } else {
                _appManagement.setLightMood();
                bulb = Colors.black87;
              }
            },
            color: bulb,
            iconSize: 27,
          ),
        ],
        title: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                size: 35,
                color: _appManagement.isChange ? Color(0xffA8BCD9) : Colors
                    .white,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Search();
                }));
              },
            ),
            Text(
              'Search',
              style: TextStyle(
                fontSize: 30,
                color: _appManagement.isChange ? Color(0xffA8BCD9) : Colors
                    .white,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: _dbHelper.allChemicals(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  Chemical chemical = Chemical.fromMap(snapshot.data[i]);
                  return FadeAnimation(
                    increaseDelay += 0.0002,
                    Card(
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                          '${chemical.name}',
                          style: TextStyle(
                              fontSize: 30,
                              color: _appManagement.isChange
                                  ? Colors.black87
                                  : Colors.white),
                        ),
                        trailing: Container(
                          width: 80,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: _appManagement.isChange
                                        ? Colors.green[800]
                                        : Colors.deepPurple.shade700,
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
                                    color: _appManagement.isChange
                                        ? Colors.red[900]
                                        : Colors.red[800],
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    _appManagement.deleteItem(chemical.id);
                                    showDeleteSuccessfullyOperation();
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChemicalDetails(chemical),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ChemicalsInfo();
          }));
        },
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
        elevation: 5,
        backgroundColor: _appManagement.isChange ? Colors.black : Colors.blue,
      ),
    );
  }
}
