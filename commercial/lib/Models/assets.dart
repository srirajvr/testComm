
class Asset{
  int aid;
  int PID;
  String name;
  String DOCO;
  String order1419;
  String trueup1419;
  String order1924;
  double dococost;
  List<double> addcap;
  List<double> tariff1419;
  List<double> tariff1924;
  double apporCost;
  List<double> omAddcap;


  Asset(this.aid, this.PID,this.name, this.DOCO, this.order1419,
      this.trueup1419, this.order1924, this.dococost, this.addcap,
      this.tariff1419, this.tariff1924,this.apporCost,this.omAddcap);


}



class Project{
  int PID;
  String sname;
  String name;
  String IA;
  double FR;
  List<double> RCE;
  String SCOD;
  List<String> assets;

  Project(this.PID, this.sname,this.name, this.IA, this.FR, this.RCE, this.SCOD,
      this.assets);


}

class Projects{
  int PID;
  String name;

  Projects(this.PID,this.name);
}

class Assets {

  int aid;
  int PID;
  String name;
  String DOCO;
  String order1419;
  String SCOD;
  double fr;
  double rce;
  double dococost;
  double ac1;
  double ac2;
  double ac3;
  double ac4;
  double ac5;
  double ac6;
  double ac7;
  double adococost;
  double aac1;
  double aac2;
  double aac3;
  double aac4;
  double aac5;
  double aac6;
  double aac7;
  double idc;
  double iedc;
  double aidc;
  double aiedc;
  double sparetl;
  double sparess;
  double spareplcc;
  double asparetl;
  double asparess;
  double aspareplcc;
  int dto;
  String aroe;

  Assets(this.aid,this.PID,this.name,this.DOCO,this.order1419,this.SCOD,this.fr,this.rce,this.dococost,this.ac1,this.ac2,this.ac3,this.ac4,this.ac5,
  this.ac6,this.ac7,this.adococost,this.aac1,this.aac2,this.aac3,this.aac4,this.aac5,this.aac6,this.aac7,this.idc,this.iedc,this.aidc,this.aiedc,
  this.sparetl,this.sparess,this.spareplcc,this.asparetl,this.asparess,this.aspareplcc,this.dto,this.aroe);

}