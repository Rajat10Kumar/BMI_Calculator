import 'package:bmi_calculator/Itemmodel.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

ItemModel itemsData = ItemModel();

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Know More About BMI'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Scrollbar(
            isAlwaysShown: true,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: itemsData.getItems().length,
              itemBuilder: (context, index) {
                return ExpansionPanelList(
                  animationDuration: Duration(seconds: 1),
                  expandedHeaderPadding: EdgeInsets.all(15.0),
                  children: [
                    ExpansionPanel(
                      backgroundColor: Color(0xFFFFAE42),
                      canTapOnHeader: true,
                      body: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          itemsData.getItems()[index].description,
                          style: InfoTextStyle,
                        ),
                      ),
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            itemsData.getItems()[index].headerItem,
                            style: isExpanded
                                ? HeaderInfoTextStyle
                                : InfoTextStyle,
                          ),
                        );
                      },
                      isExpanded: itemsData.getItems()[index].expanded,
                    )
                  ],
                  expansionCallback: (int item, bool status) {
                    setState(() {
                      itemsData.getItems()[index].expanded =
                          !itemsData.getItems()[index].expanded;
                    });
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
