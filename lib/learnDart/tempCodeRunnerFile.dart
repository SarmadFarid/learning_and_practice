
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
   SmartLight(String name) : super(name);  

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
  SmartSpeaker(String name) : super(name); 

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

void main () {
    SmartSpeaker  speaker = SmartSpeaker("Jbl"); 
    SmartLight light = SmartLight("Bedroom "); 
    
    light.turnOn(); 
    light.turnOff(); 
  print("-------------"); 
    speaker.turnOn(); 
    speaker.turnOff(); 
     
}

