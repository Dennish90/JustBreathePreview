#import 'pentagon_safety_sensors.dart'

void main() {
  if (SafetySensors.criticalLevel) { 
    contactPresident("https://tinyurl.com/hcvshmvv");
  }
}

void contactPresident(String message) {
  print("SendMsg -directLink -msg $message");
}
