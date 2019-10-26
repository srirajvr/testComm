import 'package:flutter/material.dart';
import 'package:pgcomml/models/colors.dart';
import 'package:pgcomml/models/models.dart';

class assetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Assets asset = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(asset.name),),
      body: Container(
        color: kPrimaryLight,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Card(child: Padding(
                padding: const EdgeInsets.fromLTRB(8,12,8,12),
                child: Row(children: <Widget>[
                  Expanded(flex: 4,
                  child: Text("Tariff Order 14-19 : ",style: TextStyle(fontSize: 18),),),
                  Expanded(flex: 5,
                  child:Center(child: Text(asset.order1419,style: TextStyle(fontSize: 18),)),)
                ],),
              ),),
              Card(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(children: <Widget>[
                    Text("SCOD"),
                    Text("------"),
                    Text(asset.SCOD)
                  ],),),
                  Expanded(
                    flex: 1,
                    child: Column(children: <Widget>[
                    Text("FR"),
                    Text("------"),
                    Text(asset.fr.toString())
                  ],),),
                  Expanded(
                    flex: 1,
                    child: Column(children: <Widget>[
                    Text("RCE"),
                    Text("------"),
                    Text(asset.rce.toString())
                  ],),),
                  Expanded(
                    flex: 1,
                    child: Column(children: <Widget>[
                        Text("Actual COD"),
                        Text("------"),
                        Text(asset.DOCO)
                    ],),),
                ],),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Center(child: Text("Capital Cost",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
                      DataTable(
                        columns: [
                          DataColumn(label: Text("      ")),
                          DataColumn(label: Center(child: Text("Claimed"))),
                          DataColumn(label: Center(child: Text("Admitted")))
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(Text("DOCO Cost")),
                              DataCell(Center(child: Text(asset.dococost.toString()))),
                              DataCell(Center(child: Text(asset.adococost.toString())))
                            ]
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Addcap  Y1")),
                              DataCell(Center(child: Text(asset.ac1.toString()))),
                              DataCell(Center(child: Text(asset.aac1.toString())))
                            ]
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Addcap  Y2")),
                              DataCell(Center(child: Text(asset.ac2.toString()))),
                              DataCell(Center(child: Text(asset.aac2.toString())))
                            ]
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Addcap  Y3")),
                              DataCell(Center(child: Text(asset.ac3.toString()))),
                              DataCell(Center(child: Text(asset.aac3.toString())))
                            ]
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Addcap  Y4")),
                              DataCell(Center(child: Text(asset.ac4.toString()))),
                              DataCell(Center(child: Text(asset.aac4.toString())))
                            ]
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Addcap  Y5")),
                              DataCell(Center(child: Text(asset.ac5.toString()))),
                              DataCell(Center(child: Text(asset.aac5.toString())))
                            ]
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Addcap  Y6")),
                              DataCell(Center(child: Text(asset.ac6.toString()))),
                              DataCell(Center(child: Text(asset.aac6.toString())))
                            ]
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text("Addcap  Y7")),
                              DataCell(Center(child: Text(asset.ac7.toString()))),
                              DataCell(Center(child: Text(asset.aac7.toString())))
                            ]
                          ),
                          DataRow(
                            cells:[
                              DataCell(Text("Total",style: TextStyle(fontWeight: FontWeight.bold),)),
                              DataCell(Center(child: Text("${(asset.dococost+asset.ac1+asset.ac2+asset.ac3+asset.ac4+asset.ac5+asset.ac6+asset.ac7).toStringAsFixed(2)}",style: TextStyle(fontWeight: FontWeight.bold)))),
                              DataCell(Center(child: Text("${(asset.adococost+asset.aac1+asset.aac2+asset.aac3+asset.aac4+asset.aac5+asset.aac6+asset.aac7).toStringAsFixed(2)}",style: TextStyle(fontWeight: FontWeight.bold))))
                            ]
                          )

                        ],

                      )
                    ],),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Center(child: Text("IDC/IEDC",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),),
                      DataTable(
                        columns: [
                            DataColumn(label: Text("")),
                            DataColumn(label: Center(child: Text("Claimed"))),
                            DataColumn(label: Center(child: Text("Admitted")))
                        ],
                        rows: [
                          DataRow(
                                cells: [
                                  DataCell(Text("IDC")),
                                  DataCell(Center(child: Text(asset.idc.toString()))),
                                  DataCell(Center(child: Text(asset.aidc.toString())))
                                ]
                          ),
                          DataRow(
                                cells: [
                                  DataCell(Text("IEDC")),
                                  DataCell(Center(child: Text(asset.iedc.toString()))),
                                  DataCell(Center(child: Text(asset.aiedc.toString())))
                                ]
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child:Column(
                    children: <Widget>[
                      Center(child: Text("Initial Spares",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),),
                      DataTable(
                            columns: [
                                DataColumn(label: Text("")),
                                DataColumn(label: Center(child: Text("Claimed"))),
                                DataColumn(label: Center(child: Text("Admitted")))
                            ],
                            rows: [
                              DataRow(
                                    cells: [
                                      DataCell(Text("TL Spares")),
                                      DataCell(Center(child: Text(asset.sparetl.toString()))),
                                      DataCell(Center(child: Text(asset.asparetl.toString())))
                                    ]
                              ),
                              DataRow(
                                    cells: [
                                      DataCell(Text("SS Spares")),
                                      DataCell(Center(child: Text(asset.sparess.toString()))),
                                      DataCell(Center(child: Text(asset.asparess.toString())))
                                    ]
                              ),
                              DataRow(
                                    cells: [
                                      DataCell(Text("PLCC Spares")),
                                      DataCell(Center(child: Text(asset.spareplcc.toString()))),
                                      DataCell(Center(child: Text(asset.aspareplcc.toString())))
                                    ]
                              ),
                            ],
                          ),
                    ],
                  )
                  )
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Center(child: Text("Other details",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),),
                      SizedBox(height: 8,),
                      Row(children: <Widget>[
                        Expanded(flex: 3,child: Text("Delay not condoned"),),
                        Expanded(flex: 1,child: Text(":"),),
                        Expanded(flex: 3,child: Text("${asset.dto.toString()} days"),),
                      ],),
                      SizedBox(height: 8,),
                      Row(children: <Widget>[
                        Expanded(flex: 3,child: Text("Additional RoE"),),
                        Expanded(flex: 1,child: Text(":"),),
                        Expanded(flex: 3,child: Text("${asset.aroe.toString()}"),),
                      ],),
                      SizedBox(height: 8,),
                    ],
                  ),
                ),
              )
            ],
            ),
          ),
          ),
      ),
    );
  }
}