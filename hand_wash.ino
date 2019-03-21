#define solenoid_pin  //or relay whatever. 
#define ir_pin       //give ur pin no.s
int hand=HIGH;      //no hand to wash



void setup() {
  // put your setup code here, to run once:
  pinMode(solenoid_pin,OUTPUT);
  pinMode(ir_pin,INPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
 hand = digitalRead(ir_pin); //check if there is *** to wash
 if(hand ==  LOW) //hand detected. tapp
 {
  Serial.println("Squirt Squirt!");
  digitalWrite(solenoid_pin,HIGH);
  delay(2000);
  digitalWrite(solenoid_pin,LOW); 
  hand=HIGH;
 }
 else
 {
  Serial.println("hmm...");
 }
 delay(5000); //5sec delay per squirt.
}
