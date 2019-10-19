import 'package:commercial/Models/assets.dart';
import 'package:commercial/data/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:commercial/data/variables.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kAccent,
      appBar: AppBar(title: Text("Commercial"),centerTitle: true,),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children:dummyProj.map((data)=>projCard(context,data)).toList()

          ),
        ),
      )
    );
  }
}


Widget projCard(BuildContext context,Project data){

    return GestureDetector(
      onTap: (){Navigator.pushNamed(context, 'projectPage',arguments: data);},
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[

               Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color:kPrimaryLight,borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                        backgroundColor: kPrimary,
                        maxRadius: 13,
                        child: Text(data.PID.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),)
                        ),
                     Center(child: Text(data.sname.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)))

                  ],

                )

              ),

              Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Text(data.name.toString(),style: TextStyle(fontSize: 18),),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text("No of elements : ${data.assets.length.toString()}")
                      ),
                    ],
                  )
              ),

          ])
      ),
    );
}
