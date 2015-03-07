/*Yessica Pamela Flores Subias
  A01337297
  302
  Computer Sciences IB
  ITESM
  #IBCS2
*/
int STACK_SIZE;//Size of the stack
int[] a;//integer array used in the state of the type of boxe
int stack_top;//top of the stack
int v;//variable in which the return value of pop() is store  

//---------------------------------------------------------------------------------------
void setup(){
 a = new int[STACK_SIZE];
 stack_top = -1; // The stack is empty
 STACK_SIZE=6; //Size 6
 size(1000,700,P3D);
 float fov = PI/3.0;//camera
 float cameraZ = (height/2.0) / tan(fov/2.0);//camera
 perspective(fov, float(width)/float(height), cameraZ/100.0, cameraZ*10.0);//Camera
}

//----------------------------------------------------------------------------------------
void draw(){
  background(0);
  String s = "Stack Representation";
  String f = "Press:";
  String k = "1 for pink, 2 for purple, 3 for blue, 4 for green and f for pop";
  fill(255);
  //text(s, 10, 10, 90, -50);
  textSize(10);
  text(s, -20, -20,-20);  // Specify a z-axis value
  textSize(5);
  text(f, -20, 20,-20);
  text(k, -20, 30,-20);
  camera(100*mouseX/500.0-50, -45*mouseY/500.0, 45,  0,0,0,  0,1,0);
  fill(255); 
 //Fill the complementary the box according the pop function 
  if(v==1) fill(207,133,130);
      else if(v==2) fill(114,118,145);
      else if(v==3) fill(131,165,170);
      else if(v==4) fill(201,208,177);
  pushMatrix();
  translate(10,0,0);
  box(6);
  popMatrix();
  //Draws boxes according users command
  for(int i=0;i<=stack_top;i++){
    if(a[i]==1) {fill(207,133,130);}
      else if(a[i]==2) {fill(114,118,145);}
      else if(a[i]==3){fill(131,165,170);}
      else if(a[i]==4) {fill(201,208,177);}
      box(6);
      translate(0,-6,0);
  }
}
//------------------------------------------------------------------------------------------
//push function
int push(int number){
  if(stack_top+1 < STACK_SIZE){ // Check for overflow
   stack_top = stack_top + 1;//states the new top
   a[stack_top] = number;
   return 0; // success
  }
  else{
    return -1; // error
  }

}

//------------------------------------------------------------------------------------------
//pop function
int pop(){ // Returns -1 if the stack is empty
  int number;
 if(stack_top >= 0){
  number = a[stack_top];
  stack_top = stack_top - 1;//states new top
  return number;//return integer number to fill the box 
 }
 else{
  return -1; // error
 } 
}
//------------------------------------------------------------------------------------------
void keyReleased()
{
   if (key == '1') push(1); //color pink
  else if (key == '2') push(2);//color purple
  else if (key == '3') push(3);//color blue
  else if (key == '4') push(4);// color green
  else if(key=='f') v=pop(); //pops
}
