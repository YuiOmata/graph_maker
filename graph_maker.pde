//when it doesnt work, please import libraly "controlP5"
import controlP5.*;
import java.awt.*;

ControlP5 b_draw, b_flush;
ControlP5 plus, sub, mul, div, del, variable;
ControlP5 one, two, three, four, five;
ControlP5[] tab = new ControlP5[3];
int window_h, tab_height = 40, tab_num = 3;  //tab_height変更時、size()も変更すること
color[] func_color = new color[4];
int FUNK_NUM = 4;
String[] func = {"", "default2", "default3", "default4"};
String[] tab_name = {"function", "edit", "graph"};

int tab_now = 0;
int edit_now = 0;

float ratio_x, ratio_y;
float range_x = 0.2, range_y = 4;
int grid_y = 1; int grid_x = 1;

void setup(){
  smooth();
  size(840, 600); //tab_heightを変更したらここも変更すること
  window_h = height - tab_height;
  ratio_x = width / ( range_x * 2 );
  ratio_y = window_h / ( range_y * 2 );
  func_color[0] = #FF0000;
  func_color[1] = #00FF00;
  func_color[2] = #0000FF;
  func_color[3] = #00EFEF;
  SetTub();
  Flush();
}

float vs(float t){
  return cos( 50 * t ) + 1;
}
float vc(float t){
  return cos(1000 * t);
}
float va(float t){
  return vs(t) * vc(t);
}

void draw(){
  switch(tab_now){
    case 0:
      //関数一覧
      Flush();
      for(int i=0; i<FUNK_NUM; i++){
        fill(func_color[i]);
        text("f" + Integer.toString(i+1) + "(x) = " + func[i], 100, 300+(i*50));
      }
      break;
    case 1:
      //関数編集
      Flush();
      DrawButtons();
      break;
    case 2:
      //関数描画
      Flush();
      break;
      
  }
}

void Flush(){
  background(255);
  SetTub();
}

void DrawGrids(){
  strokeWeight(0.1);
  stroke(color(0, 200, 0));
  for(int i=0; i<window_h; i+=int(window_h/(range_y*2)*grid_y))
    line(0, i, width, i);
  for(int i=0; i<width; i+=int(width/(range_x*2)*grid_x))
    line(i, 0, i, width);
  strokeWeight(1);
  stroke(0);
  line(0, window_h/2, width, window_h/2);  //draw axis x　
  line(width/2, 0, width/2, window_h);   //draw axis y
  
}
void DrawGraph(){
  tab_now = 2;
  Flush();
  stroke(color(255, 0, 0));
  for(float i=-range_x; i<range_x; i+=0.00001)
    point(i*ratio_x + width/2, -vs(i)*ratio_y + window_h/2);
  stroke(color(0, 80, 200));
  for(float i=-range_x; i<range_x; i+=0.00001)
    point(i*ratio_x + width/2, -va(i)*ratio_y + window_h/2);
}

void SetTub(){
  int tab_width = width / tab_num;
  for(int i=0; i<tab_num; i++){
    tab[i] = new ControlP5(this);
    tab[i].addButton("tab" + i)
      .setLabel(tab_name[i])
      .setPosition(tab_width*i, window_h)
      .setSize(tab_width, tab_height);
    //rect(tab_width*i, window_h, tab_width*(i+1),height);
  }
}

void tab0(){
  tab_now = 0;
}

void tab1(){
  tab_now = 1;
}

void tab2(){
  tab_now = 2;
}

void DrawButtons(){
  b_draw = new ControlP5(this);
  b_draw.addButton("DrawGraph")
    .setLabel("draw")
    .setPosition(50, 40)
    .setSize(40, 40);
    
  b_flush = new ControlP5(this);
  b_flush.addButton("Flush")
    .setLabel("reset")
    .setPosition(100, 40)
    .setSize(40, 40);
  
  plus = new ControlP5(this);
  plus.addButton("Plus")
    .setLabel("+")
    .setPosition(150, 40)
    .setSize(40, 40);
    
  one = new ControlP5(this);
  one.addButton("One")
    .setLabel("1")
    .setPosition(200, 40)
    .setSize(40, 40);

  del = new ControlP5(this);
  del.addButton("Del")
    .setLabel("del")
    .setPosition(250, 40)
    .setSize(40, 40);
    
  variable = new ControlP5(this);
  variable.addButton("Variable")
    .setLabel("X")
    .setPosition(300, 40)
    .setSize(40, 40);
}

void Plus(){
  func[edit_now - 1] += " +";
}

void One(){
  func[edit_now - 1 ] += " 1";
}

void Del(){
  func[edit_now - 1] = func[edit_now - 1].substring(0,func[edit_now - 1].length()-2);
}

void Variable(){
  func[edit_now - 1 ] += " x";
}