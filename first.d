import std.stdio;
import std.conv;
import std.math;
import std.random;
import std.datetime;
import std.algorithm;
import std.array;
import std.string;
import std.format;
import std.typecons:No;
import std.typecons;
import std.range: chain;
import std.file;
import core.thread;
import std.parallelism;
import std.concurrency;
import std.range; 

//commenting
/*commenting
*/

void main(){
  string name;
  write("sadqdo");
  readf("%s\n",&name);
  writeln("hello:",name);
  int a1_B = 10;
  auto bool1 = true;
  writeln("Bool: ",bool1);
  writeln("Bool max:",bool.max);
  writeln(bool.min);
  bool happy=true;
  writeln("Bool: %s",happy);

  // \n \t \b \f \r 
  writeln("Char max min :",char.max);
  writeln(char.min);
  char a='S';
  writefln("Char %c",a);

  long lNum= 123_243_233;
  writefln("LNUM: %15d", lNum);

  writeln("float max:",float.max);
  float num1=1.11111111111111111;
  float num2=1.11111111111111111;
  writeln("Float: %1.6f",num1+num2);
//accuracy real>>double>>float
  writeln("float max:",real.max);
  real num1=1.11111111111111111;
  real num2=1.11111111111111111;
  writeln("Float: %1.6f",num1+num2);

  writeln("Defualt int: ",int.init);

  // ubyte,ushort,uint,ulong,ifloat,idouble,....

  //casting

  int cInt=15;
  short cShort=cast(short) cInt;
  short cShort2=cast(short) 323213;
  writeln("Short cast: ",cShort2);

  auto sInt=to!string(10);
  writeln("Type : ",typeof(sInt).stringof);

  auto iStr=to!int("10");
  writeln("Type: ",typeof(iStr).stringof);

  writeln(5.0/4.0);//fraction output not integers

  var +=1;// var = var+1
  int incMe=0;
  writeln(incMe++);
  writeln(incMe++);

  incMe+=10;
  writeln(abs(-1));
  writeln(ceil(4.32));
  writeln(floor(3.3));
  writeln(round(4.32));
  writeln(exp(0.1));
  writeln(log(2));
  writeln(log10(2));
  writeln(pow(2,2));
  writeln(sqrt(2.2));
  writeln(cbrt(22.3));
  writeln(hypot(3,3));
  writeln(PI);
  writeln(sin(1.33));
  writeln(cos(123));
  writeln(tan(123));
  writeln(asin(123));
  writeln(acos(123));
  writeln(atan(123));
  writeln(sinh(123));
  writeln(cosh(123));
  writeln(tanh(123));

  auto nowTime = Clock.currtime(UTC());
  writeln(nowTime.year);
  writeln(nowTime.month);
  writeln(nowTime.day);
  writeln(nowTime.hour);
  writeln(nowTime.minute);
  writeln(nowTime.second);

  int seed=nowTime.second;
  auto rand = Random(seed);
  writeln("Rand: ",uniform(5,20,rand));
  int[10] a1;
  int[] a2=[1,2,3];
  a2[0]=0;
  writeln(a[0]);

  int[] a3;
  a3 ~=1;
  a3~=2;
  a3~=3;

  a3=a3.remove(1);
  writeln(a3);
  a3 = a2 ~ a3;
  a3 =a3.remove!(x=>(x%2)==0);
  writeln(a3);
  writeln(sort(a3));
  writeln(reverse(a3));
  writeln(a3.replace(3,2));
  a3 = a2 ~ a3;
  writeln(a3[0 .. 3]);
  auto a4 = a3.dup;
  a4[]*=2;
  writeln(a4);

  string s1="wedwehkh";
  s1[0]='d';//error!
  s1="Twfwf";//OK
  writeln(s1[0]);
  string s2=s1 ~ "Thumb";
  writeln("T : ",indexOf(s2,'T'));
  writeln(lastIndexOf(s2,'T'));
  writeln(indexOf(s2,"Thumb",No.caseSenitive));
  writeln(replace(s2,"Tom","Ed"));
  string s3="2 2 2 2";
  auto numArr=to!(int[])(split(s3));
  writeln(s3==s2);
  writeln(toUpper(s2));
  writeln(toLower(s2));
  writeln(isNumeric("20"));
  double[string] favNums = ["AZero" : -459,
                           "Euler": 2.2323];
  favNums["PI"]=3.232;
  favNums["Golden"]=1.22;
  writeln(favNums);
  writeln(favNums.length);
  writeln(favNums.keys);
  writeln(favNums.values);
  if("AZero" in favNums){
    favNums.remove("AZero");
  }
  writeln(favNums);
  char[] arrName;
  string fname=strip(readln(arrName));
  writeln(strip(fname));
  
  int age=12;
  if((age>=5)&&(age<=6)){
    writeln("kindergarten");
  }
  else if((age>=7)&& (age<=13)){
    writeln("go middle school");
  }
  else {
    writeln("adult/teen");
  }
  bool canVote = (age>=18)? true : false;
  string lang="franvce";
  switch(lang){
    case "asds":case "ada" :
      writeln("hola soy dora");
      break;
    case "in":
      goto case;
    default:
      writeln("add");
    case 7: ..  case:13 
  }
  for(int i=0;i<5;i++){
    writeln(i);    
  }
  int [] a6=[1,1,1,1];
  foreach(x;a6){
    writeln(x);
  }
  foreach(x;3..10){
    writeln(x);
  }
  double [string] aa=["A":1,"B":2];
  foreach(k,v;aa){
    writeln(k," ",v);
  }
  foreach(x;aa.byKeyValue){
    writeln("%s : %s",x.key,x.value);
  }
  int[] ff=[1,1,1,1,2,3,36,67];
  foreach(ref x;ff){x*=2;}
  int w=0;
  while(w<20){
    if(w%2==0){
      writeln(w);
      w++;
      continue;
    }
  }
  
