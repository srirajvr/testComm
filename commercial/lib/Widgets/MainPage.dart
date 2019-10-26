import 'package:basic_utils/basic_utils.dart';
import 'package:commercial/Models/assets.dart';
import 'package:commercial/data/appcolors.dart';
import 'package:commercial/data/getData.dart';
import 'package:flutter/material.dart';
import 'package:commercial/data/variables.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Future<dynamic> fet;

  @override
  void initState(){
    super.initState();
    fet = fetch();

  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: fet,
      builder: (context,snapshot){
        if(test==0){
          return Scaffold(
            appBar: AppBar(title: Text('Commercial'),),
            body: CircularProgressIndicator(),
          );
        }
        else{
        return Scaffold(
            backgroundColor: kAccent,
            appBar: AppBar(title: Text("Commercials"),centerTitle: true,),
            body: Container(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children:dummyProj1.map((data)=>projCard(context,data)).toList()

          ),
        ),
      )
    );

        }
      },
    );
    
    
    
  }
}


Widget projCard(BuildContext context,Projects data){

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
                     Center(child: Text(data.name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)))

                  ],

                )

              ),
/*
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
*/
          ])
      ),
    );
}

class MainPage1 extends StatefulWidget {
  @override
  _MainPage1State createState() => _MainPage1State();
}

class _MainPage1State extends State<MainPage1> {
  var proj;
  
@override
void initState(){
  super.initState();
  fetchData();
}

fetchData() async{
var res= await HttpUtils.getForFullResponse("https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=12sa6GIt2RIWTcnsseeRZOUr33qX8T7STZzcHgy2WQhE&sheet=Sheet1");
print(res.body);


}


  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}