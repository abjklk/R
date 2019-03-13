#include <Servo.h>
Servo myservo;

#define ENA_rear 5        // Enable/speed in rear left motor
#define ENB_rear 6        // Enable/speed in rear right motor
#define ENA_arm 10        // Enable/speed motor arm up 
#define ENB_grip 11       // Enable/speed motor arm grip

#define INA_rear1  2    		// L298N #1 in rear left motor
#define INA_rear2  3    		// L298N #1 in rear left motor
#define INB_rear1  4    		// L298N #1 in rear right motor
#define INB_rear2  7    		// L298N #1 in rear right motor

#define INA_arm1  8    		// L298N #2 in armup 
#define INA_arm2  9    		// L298N #2 in armup
#define INB_grip1  12   		// L298N #2 in grip
#define INB_grip2  13   		// L298N #2 in grip


int pos = 0; 
int command='OFF';

void setup() {  
  
    myservo.attach(9);
    
	  pinMode(ENA_rear, OUTPUT);
  	pinMode(ENB_rear, OUTPUT);
	  pinMode(ENA_arm, OUTPUT);
	  pinMode(ENB_grip, OUTPUT);
  
    pinMode(INA_rear1, OUTPUT);
    pinMode(INA_rear2, OUTPUT);
    pinMode(INB_rear1, OUTPUT);
    pinMode(INB_rear2, OUTPUT);
    
    pinMode(INA_arm1, OUTPUT);
    pinMode(INA_arm2, OUTPUT);
    pinMode(INB_grip1, OUTPUT);
    pinMode(INB_grip2, OUTPUT);

	Serial.begin(115200); 

  } 

void goAhead(){ 

      digitalWrite(INA_rear1, HIGH);
      digitalWrite(INA_rear2, LOW);
	    digitalWrite(ENA_rear, HIGH);

      digitalWrite(INB_rear1, HIGH);
      digitalWrite(INB_rear2, LOW);
      digitalWrite(ENB_rear, HIGH);
      delay(200);
      digitalWrite(ENA_rear, LOW);
      digitalWrite(ENB_rear, LOW);
      
  }

void goBack(){ 
      
      digitalWrite(INA_rear1, LOW);
      digitalWrite(INA_rear2, HIGH);
      digitalWrite(ENA_rear, HIGH);

      digitalWrite(INB_rear1, LOW);
      digitalWrite(INB_rear2, HIGH);
      digitalWrite(ENB_rear, HIGH);
      delay(200);
      digitalWrite(ENA_rear, LOW);
      digitalWrite(ENB_rear, LOW);
      

  }

void goRight(){ 
   digitalWrite(INA_rear1, HIGH);
   digitalWrite(INA_rear2, LOW);
   digitalWrite(ENA_rear, HIGH);

   digitalWrite(INB_rear1, HIGH);
   digitalWrite(INB_rear2, LOW);
   digitalWrite(ENB_rear, HIGH);
  for (pos = 0; pos <= 40; pos += 1) { // goes from 0 degrees to 40 degrees
    // in steps of 1 degree
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15ms for the servo to reach the position
  }  
  delay(100);
  digitalWrite(ENA_rear, LOW);
  digitalWrite(ENB_rear, LOW);
  
}

void goLeft(){
   digitalWrite(INA_rear1, HIGH);
   digitalWrite(INA_rear2, LOW);
   digitalWrite(ENA_rear, HIGH);

   digitalWrite(INB_rear1, HIGH);
   digitalWrite(INB_rear2, LOW);
   digitalWrite(ENB_rear, HIGH);
   for (pos = 40; pos >= 0; pos -= 1) { // goes from 40 degrees to 0 degrees
    // in steps of 1 degree
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15ms for the servo to reach the position
  }  
  delay(100);
  digitalWrite(ENA_rear, LOW);
  digitalWrite(ENB_rear, LOW);
 }

void stopRobot(){  

      digitalWrite(INA_rear1, LOW);
      digitalWrite(INA_rear2, HIGH);
      digitalWrite(ENA_rear, LOW);

      digitalWrite(INB_rear1, LOW);
      digitalWrite(INB_rear2, HIGH);
      digitalWrite(ENB_rear, LOW);
      myservo.write(0);
  
  }

void armUp(){
      digitalWrite(INA_arm1, LOW);
      digitalWrite(INA_arm2, HIGH);
      digitalWrite(ENA_arm, HIGH);
      delay(100);
      digitalWrite(ENA_arm, LOW);
}

void armDown(){
      digitalWrite(INA_arm1, HIGH);
      digitalWrite(INA_arm2, LOW);
      digitalWrite(ENA_arm, HIGH);
      delay(100);
      digitalWrite(ENA_arm, LOW);
    
}

void grip(){
      digitalWrite(INB_grip1, HIGH);
      digitalWrite(INB_grip2, LOW);
      digitalWrite(ENB_grip, HIGH);  
      delay(50);
      digitalWrite(ENB_grip, LOW);
      
}

void gripLoose(){
      digitalWrite(INB_grip1, LOW);
      digitalWrite(INB_grip2, HIGH);
      digitalWrite(ENB_grip, HIGH);  
      delay(50);
      digitalWrite(ENB_grip, LOW);
      
}


void loop(){
    
if (Serial.available() > 0) {
	command = Serial.read();

if(command='OFF')
{
    switch (command) {
      case 'F':goAhead();break;
      case 'B':goBack();break;
      case 'L':goLeft();break;
      case 'R':goRight();break;
    }
}
else if (command='ON')
{
  stopRobot();
  switch (command) {
    case 'F':armUp();break;
    case 'B':armDown();break;
    case 'L':grip();break;
    case 'R':gripLoose();break;
  }
}

}
}
