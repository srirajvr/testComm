import 'package:commercial/Models/assets.dart';
import 'package:commercial/data/appcolors.dart';
import 'package:flutter/material.dart';

class projectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Project project = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
           child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 90),
                color: kAccent,
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(project.name.toString(),
                                style: TextStyle(fontSize: 20),),
                            ),
                            SizedBox(height: 5,),
                            Container(height: 1,color: Colors.black38,),
                            SizedBox(height: 5,),
                            Row(
                              children: <Widget>[
                                SizedBox(width: 10,),
                                Expanded(
                                  flex:1,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height:5),
                                      Text("SCOD",),
                                      Text("------------"),
                                      //SizedBox(height: 8,),
                                      Text(project.SCOD),
                                      SizedBox(height:5)
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height:5),
                                      Text("FR"),
                                      Text("------------"),
                                      Text(project.FR.toString()),
                                      SizedBox(height:5)
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(

                                    children: <Widget>[
                                      SizedBox(height:5),
                                      Text("RCE"),
                                      Text("------------"),
                                      Text(
                                        project.RCE.length==0?"-": project.RCE[project.RCE.length-1].toString()
                                      ),
                                      SizedBox(height:5)
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height:5),
                                      Text("Capital Cost"),
                                      Text("------------"),
                                      Text(project.SCOD),
                                      SizedBox(height:5),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10,)
                              ],
                            ),
                          ],

                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Card(
                      child: Column(
                        children: <Widget>[
                          Text("order details"),
                          Text("14-19 Order")
                        ],
                      ),
                    )
                  ],
                ),

                //data
              ),

              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                  ),
                  ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Text(project.sname.toString(), style: TextStyle(color: Colors.white,
                                                              fontSize: 30,
                                                              fontWeight: FontWeight.bold)
                                    )
                            ),
                      IconButton(
                        padding: EdgeInsets.only(top: 40),
                        icon: Icon(Icons.keyboard_arrow_left,color: Colors.white,),
                        onPressed: (){Navigator.pop(context);},
                      )
                  ]
                  ),

                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
