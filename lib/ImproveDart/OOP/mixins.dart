// Mixins: 
// A Mixin in dart is a special type of class to share code (methods and properties) between multiple classes without using inheritance .

// Why we use Mixins ?
// Code reuse , Avoid multiple inheritance , No duplication , cleaner design .    

// how mixins works internally ? 
//  mixins copy the code of their class into class that uses them .

// Mixin Constraints: 
// Some times, you want your mixin to be used only with specific types of classes. you can enforce this with the "on" keyword . 

// class Animal {
//   void eat() => print("Eating...");
//   void walk() => print("animal class"); 
// }

// mixin Walker on Animal {
//   void walk() {
//     print("Walking...");
//     eat(); // allowed because Animal methods are available
//   }
// }

// class Dog extends Animal  {}
// void main() {
//   Dog d = Dog();
//   d.walk();
// }

// ------Mixins and method overriding---------
// if a mixin and class have methods with the same name , then the last mixin in the chain wins .
mixin B {
  void show() => print("From B");
}

mixin A {
  void show() => print("From A");
}

mixin C {
  void show() => print("C"); 
}

class MyClass with B , C , A{
 void show() => print("mycalss"); 
}

void main() {
  MyClass().show();
}




// mixin Logger {
//   void log(String message) {
//     print("Log: $message");
//   }
// }

// class FileManager with Logger {
//   void saveFile() {
//     log("File saved successfully!");
//   }
// }

// void main() {
//   var f = FileManager();
//   f.saveFile();
// }


abstract class Device{
    String name; 
    bool powerStatus = false ; 
    Device(this.name); 
 
    void turnOn() {
        powerStatus = true ;
        print("$name is now on");
    }
     void turnOff() {
        powerStatus = false ;
        print("$name is now off"); 
    }
}

mixin WifiConectivity {
  void connectWifi() => print("connected to wifi") ;
  void disconnectWifi() => print("disconnected to wifi");
}

mixin VoiceControll{
    void enableVoice() => print("voice controll enable") ;
    void disableVoice() => print("voice controll disable") ;
}
 
class SmartLight extends Device with WifiConectivity{
   SmartLight(super.name);  

   @override
  void turnOn() {
    connectWifi(); 
    print("$name light is on"); 
   }

   @override
  void turnOff() {
   disconnectWifi(); 
   print("$name light is off"); 
  }
}

class SmartSpeaker  extends Device with WifiConectivity, VoiceControll {
  SmartSpeaker(super.name) ; 

  @override
  void turnOn() {
     connectWifi(); 
     enableVoice(); 
     print("$name speaker is on"); 
  }

  @override
  void turnOff() {
     disconnectWifi(); 
     disableVoice(); 
     print("$name speaker is off"); 
  }
}

// void main () {
//     SmartSpeaker  speaker = SmartSpeaker("Jbl"); 
//     SmartLight light = SmartLight("Bedroom "); 
    
//     light.turnOn(); 
//     light.turnOff(); 
//   print("-------------"); 
//     speaker.turnOn(); 
//     speaker.turnOff(); 
     
// }

