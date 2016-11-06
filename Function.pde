
class Function{
  String formula;
  int number;
  color c;
  boolean effective;
  
  Function(int number){
    this.formula = "0";
    this.number = number;
    this.effective = true;
  }
  
  void printFunction(int x,int y){
    text("f" + Integer.toString(number) + "(x) = " + this.formula, x, y);
  }
}