import 'package:flutter/material.dart';
import 'package:pgcomml/apis/apis.dart';
import 'package:pgcomml/models/colors.dart';
import 'package:pgcomml/models/models.dart';

class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {

  var assets;
  var projects;
  List<Assets> updatedAssets;

  @override
  void initState(){
    super.initState();
      assets = fetchAssets();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test run"),),
      body: FutureBuilder(
        future: assets,
        builder: (context,snapshot){
          if(snapshot.data!=null){
            projects = getProjList(snapshot.data);
            return dataBody(context, projects, snapshot.data);
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }

  dataBody(BuildContext context,List<Projects> projects,List<Assets> assetss){
      return Container(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children:projects.map((data)=>projCard(context,data,assetss)).toList()
                    ),
                ),
        );
  }

  Widget projCard(BuildContext context,Projects data,List<Assets> assetss){
    return GestureDetector(
      onTap: (){
        print(assetss.length);
        print(data.PID);
        List<Assets> projAssets = List<Assets>();
        assetss.forEach((ass){
          if(data.PID==ass.PID){
            projAssets.add(ass);
          }
        });
        Navigator.pushNamed(context, 'projectPage',arguments: projAssets);
      },
        
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color:kPrimaryLight,borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          backgroundColor: kPrimary,
                          maxRadius: 13,
                          child: Text(data.PID.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),)
                          ),
                      ),
                    Expanded(
                       flex: 7,
                       child: Text(data.name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25))
                      )
                    ],
                  )
                )
      ),
    );
  }
}