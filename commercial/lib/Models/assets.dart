
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