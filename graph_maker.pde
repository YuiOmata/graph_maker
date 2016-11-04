//when it doesnt work, please import libraly "controlP5"
import controlP5.*;
import java.awt.*;

ControlP5 b_draw, b_flush;
ControlP5 plus, sub, mul, div, del, variable;
ControlP5 one, two, three, four, five;
ControlP5[] tab = new ControlP5[3];
int window_h, tab_height = 40, tab_num = 3;  //tab_height変更時、size()も変更すること

int LIST = 0;
int EDIT = 1;
int GRAPH = 2;
String[] tab_name = {"list", "edit", "graph"};

int FUNC_NUM = 4;
Function[] func = new Function[FUNC_NUM];


int tab_now = 0;
int edit_now = 0;

float ratio_x, ratio_y;
float range_x = 0.2, range_y = 4;
int grid_y = 1; int grid_x = 1;

void setup(){
  smooth();
  size(800, 640); //tab_heightを変更したらここも変更すること
  window_h = height - tab_height;
  ratio_x = width / ( range_x * 2 );
  ratio_y = window_h / ( range_y * 2 );
  
  SetTub();
  SetFunction();
  Flush();
}

void SetFunction(){
  for(int i=0; i<FUNC_NUM; i++){
    func[i] = new Function();
  }
  func[0].c = #FF0000;
  func[1].c = #00FF00;
  func[2].c = #0000FF;
  func[3].c = #00EFEF;
}

void draw(){
  switch(tab_now){
    case 0:
      //関数一覧
      Flush();
      for(int i=0; i<FUNC_NUM; i++){
        fill(250);
        rect( 0, window_h/FUNC_NUM*i, width, window_h/FUNC_NUM*(i+1));
        fill(func[i].c);
        textSize(30);
        text("f" + Integer.toString(i+1) + "(x) = " + func[i].formula, 100, window_h/FUNC_NUM/2*(i*2+1));
        fill(200);
        rect(650, window_h/FUNC_NUM*i+50, 100, 50);
        fill(0);
        text("edit", 670, window_h/FUNC_NUM*i+85);
      }
      break;
    case 1:
      //関数編集
      Flush();
      fill(0);
      rect(50, 50, 700, 70);
      
      break;
    case 2:
      //関数描画
      Flush();
      break;
  }
}

void Flush(){
  background(255);
  //SetTub();
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
  //stroke(color(255, 0, 0));
  //for(float i=-range_x; i<range_x; i+=0.00001)
  //  point(i*ratio_x + width/2, -vs(i)*ratio_y + window_h/2);
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
  //ここにボタン記述する
}

void Plus(){
  func[edit_now].formula += " +";
}

void One(){
  func[edit_now].formula += " 1";
}

void Del(){
  //func[edit_now] = func[edit_now].formula.substring(0,func[edit_now].formula.length()-2);
}

void Variable(){
  func[edit_now].formula += " x";
}

void mousePressed(){
  if(mouseX >= 650 && mouseX <= 750){
    for(int i=0; i<FUNC_NUM; i++){
      if(mouseY >= window_h/FUNC_NUM*i+50 && mouseY <=window_h/FUNC_NUM*i+100){
        edit_now = i;
        tab_now = EDIT;
      }
    }
  } 
}