import 'package:chem/block/management.dart';
import 'package:chem/model/chemical.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChemicalDetails extends StatelessWidget {
  Chemical chemical;

  ChemicalDetails(this.chemical);

  @override
  Widget build(BuildContext context) {
    AppManagement appManagement = Provider.of<AppManagement>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details about ${chemical.name}',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: Container(
        width: screenWidth,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Center(
              child: LayoutBuilder(
                builder: (context, constrains) {
                  double localWidth = constrains.maxWidth;
                  double localHeight = constrains.maxHeight;
                  return Container(
                    height: (screenHeight / 50) * 32,
                    width: localWidth / 1.089,
                    child: Card(
                      elevation: 15,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 15),
                        child: LayoutBuilder(
                          builder: (context, constrains) {
                            double width = constrains.maxWidth;
                            return Text(
                              ' Name: ${chemical.name} \n\n Volume: ${chemical.volume} \n\n Price: ${chemical.price} \n\n Dose: ${chemical.dose}',
                              style: TextStyle(
                                fontSize: width / 9.4,
                                color: appManagement.isChange
                                    ? Colors.black
                                    : Colors.white,
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
    );
  }
}
