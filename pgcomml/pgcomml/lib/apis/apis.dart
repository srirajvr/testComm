import 'dart:convert';
import 'package:pgcomml/models/models.dart';
import 'package:http/http.dart' as http;

Future<List<Assets>> fetchAssets() async{

String sheetID = "1zXlIhjaQqL9oZxBz83a52eCkSkjAJFSrYu4uaxlIkuI";
String sheetname = "asset";
String url = "https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=$sheetID&sheet=$sheetname";

var res = await http.get(url);

var test = jsonDecode(res.body);

List<Assets> assets = getAssts(test['asset']);

return assets;
}


fetchProjs(List<Assets> assets) async{

String sheetID = "1zXlIhjaQqL9oZxBz83a52eCkSkjAJFSrYu4uaxlIkuI";
String sheetname = "project";
String url = "https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=$sheetID&sheet=$sheetname";

var res = await http.get(url);

var test = jsonDecode(res.body);

List<Projects> projec = getProj(assets,test['project']);

return projec;
}




List<Projects> getProj(List<Assets> assets,List<dynamic> projs) {

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








List<Assets> getAssts(List<dynamic> data){
List<Assets> asset=List<Assets>();
data.forEach((x){
   double chkdbl(dynamic s){
    if(s is double)
    {
      return s;
    }
    else if(s is int)
    {
      return s.toDouble();
    }
    else
    {
      return double.tryParse(s)??0.00;
    }  
    
  }

  int chkint(dynamic s){

    if(s is int){
      return s;
    }
    else if (s is double)
    {
      return s.toInt();
    }
    else
    {
    return int.tryParse(s)??0;
    }
    
  }

  Assets temp = new Assets(chkint(x['aid']), chkint(x['PID']),x['pname'].toString(), x['name'].toString(), x['COD'].toString(), x['order1419'].toString(), 
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


getProjList(List<Assets> assets){

List<Projects> projects = List<Projects>();

assets.forEach((x){
  int temp =0;
  projects.forEach((y){
    if(x.PID==y.PID){
      temp=1;
    }
  });
  if(temp==0){

    projects.add(new Projects(x.PID, x.pname));

  }
});

return projects;


}