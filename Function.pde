
class Function{
  String formula;
  int number;
  color c;
  boolean efective;
  
  Function(int number){
    this.formula = "0";
    this.number = number;
    this.efective = true;
  }
  
  void printFunction(int x,int y){
    text("f" + Integer.toString(number) + "(x) = " + this.formula, x, y);
  }
}