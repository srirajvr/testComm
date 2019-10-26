import 'package:commercial/Models/assets.dart';
import 'package:commercial/data/appcolors.dart';
import 'package:commercial/data/getData.dart';
import 'package:commercial/data/variables.dart';
import 'package:flutter/material.dart';

class projectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Project project = ModalRoute.of(context).settings.arguments;
    final double capital = getCapCost(project);
    
   // fetch();

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
                    Align(alignment: Alignment.topCenter,
                                          child: Card(
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
                                        Text(capital.toString()),
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
                    ),
                    SizedBox(height: 8,),
                    Card(
                      
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15,8,8,8),
                        child: Column(          
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(child: Text("Assets",style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)),
                            SizedBox(height: 5,),
                            Container(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: project.assets.length,
                                  itemBuilder: (context,index){
                                    return GestureDetector(
                                                                          
                                      onTap: (){
                                       Asset  asset = getAsset1(project.assets[index]);
                                       Navigator.pushNamed(context, 'assetPage',arguments: asset);
                                      },                                  
                                      child: Card(
                                        color: kPrimaryLight,
                                        margin: EdgeInsets.all(8),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${index+1}. ${project.assets[index]}"),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                            ),
                          ],
                        ),
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

  double getCapCost(Project proj){
    double capCost =0;

    for(Asset asset in dummyAssets){
      for(String name in proj.assets){
        if(asset.name==name){
          double temp = 0;
          asset.addcap.forEach((a){temp+=a;});
          capCost+=asset.dococost;
          capCost+=temp;
        }

      }

    }

    return capCost;
  }
}

Asset getAsset1(String assetname){
Asset temp;
dummyAssets.forEach((f){ 
  if(f.name==assetname){
    temp = f;
  }
});

return temp;

}
