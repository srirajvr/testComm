import 'package:commercial/Models/assets.dart';
import 'package:commercial/data/variables.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

Future fetch() async {
var data;
var pdata;
String googlesheetID= "1zXlIhjaQqL9oZxBz83a52eCkSkjAJFSrYu4uaxlIkuI";
await http.get("https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=$googlesheetID&sheet=Sheet1")
        .then((f){
          print("Response code is : ${f.statusCode}");
          data = jsonDecode(f.body);
          print(data);
          print(data['asset'][5]);
          dummyAssets1=getAssts(data['asset']);
          print("got assets");
        }
        );

await http.get(
        "https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=$googlesheetID&sheet=project").then((d){
          pdata = jsonDecode(d.body);
          print('got dtata proj');
          dummyProj1=getPrjects(dummyAssets1,pdata['project']);
          print('got projects');
          test = 1;
        });
    //data = jsonDecode(res.body);
    //pdata = jsonDecode(proj.body);
    //dummyAssets1=getAssets(data);
    //dummyProj1=getPrjects(dummyAssets1,pdata);

}

List<Assets> getAssts(List<Map<dynamic,dynamic>> data){
List<Assets> asset=List<Assets>();
data.forEach((x){
   double chkdbl(dynamic s){
    print('double');
    if(s is double)
    {
      return s;
    }
    else{
      return double.tryParse(s)??0.00;
    }  
    
  }

  int chkint(dynamic s){
    print("int  int");
    if(s is int){
      return s;
    }
    else{
    return int.tryParse(s)??0;
    }
    
  }

  Assets temp = new Assets(chkint(x['aid']), chkint(x['PID']), x['name'].toString(), x['COD'].toString(), x['order1419'].toString(), 
  x['SCOD'].toString(), chkdbl(x['FR']), chkdbl(x['RCE']), chkdbl(x['DOCO']), chkdbl(x['addcap1']), chkdbl(x['addcap2']), 
  chkdbl(x['addcap3']), chkdbl(x['addcap4']), chkdbl(x['addcap5']), chkdbl(x['addcap6']), chkdbl(x['addcap7']), 
  chkdbl(x['aDOCO']), chkdbl(x['aaddcap1']), chkdbl(x['aaddcap2']), chkdbl(x['aaddcap3']), chkdbl(x['aaddcap4']), chkdbl(x['aaddcap5']), 
  chkdbl(x['aaddcap6']), chkdbl(x['aaddcap7']), chkdbl(x['IDC']), chkdbl(x['IEDC']), chkdbl(x['aIDC']), chkdbl(x['aIEDC']), 
  chkdbl(x['spTL']), chkdbl(x['spSS']), 
  chkdbl(x['spPLCC']), chkdbl(x['aspTL']), chkdbl(x['aspSS']), chkdbl(x['aspPLCC']), chkint(x['dto']), x['aroe'].toString());

  asset.add(temp);
});
return asset;
}

List<Projects> getPrjects(List<Assets> assets,List<dynamic> projs){
List<Projects> projects = List<Projects>();
assets.forEach((x){
  int temp =0;
  projects.forEach((y){
    if(x.PID==y.PID){
      temp=1;
    }
  });
  if(temp==0){
    var name = "";
    projs.forEach((f){
      if(f['PID']==x.PID){
        name = f['name'];
      }
    });
    projects.add(new Projects(x.PID, name));

  }
});
return projects;
}