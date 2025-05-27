import std.stdio;
import std.string;
import std.random;

void main(){
  int lives=3;
  string[10] dictionary=["apple","orage","animal","plant","seed","goodfoos",
                         "friensa","dwedwdwdwd","efewfewfewfw","fewff"];
  int index=uniform(0,10);
  string word=dictionary[index];
  char[] displayword;
  for(int i=0;i<word.length;i++){
    displayword~="_";
  }
  bool gameover=mainMenu();
  char guess;
  while(!gameover){
    printWord(displayword);
    write("Your guess is?",lives,"lives:");
    readf("%s",guess);
    int temp=letterguessed;
    for(int i=0;i<word.length;i++){
      if(guess==word[i]){
        dispalyword[i]=word[i];
        letterguessed+=1;
      }
    }
    if(temp==lettersguessed){lives--;}
    if(displayword==word){
      writeln();
      writeln("You won");
      break;
    }
    else if(lives<0){
      writeln();
      writeln("You lost");
      writeln(word);
      break;
    }
    writeln("Bye bye!");
    
  }
  bool mainMenu(){
    writeln("heloo");
    writeln("(1)Play");
    writeln("(2)Exit");
    write(":_");
    string line=strip(readln());
    if(line==play||line=="Play"||line=="1"||line=="p"){return false;}
  }
}
