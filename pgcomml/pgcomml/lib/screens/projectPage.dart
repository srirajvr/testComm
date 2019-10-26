import 'package:flutter/material.dart';
import 'package:pgcomml/models/colors.dart';
import 'package:pgcomml/models/models.dart';

class projectPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final List<Assets> assets = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(assets[0].pname),
      ),
      body: Container(
            height: MediaQuery.of(context).size.height,
            color: kPrimaryLight,
            child: Column(
              children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Center(
                     child: Text("Assets",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),),
                 ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: assets.length,
                        itemBuilder: (context,index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context, 'assetPage',arguments: assets[index]);
                                    },                        
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(assets[index].name,
                                        style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      ),
                                  ),
                                );
                          },
                        ),
                      ),
                    ),
                ],
              ),
          ),
      );
  }
}