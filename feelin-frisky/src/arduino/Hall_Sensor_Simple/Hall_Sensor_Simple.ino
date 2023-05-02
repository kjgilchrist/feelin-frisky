// All the Pins in Array Form, {Sensor Name, Pin, Letter, Previous Read}

void setup() {
  // Don't technically need anything for USB, but for Serial check.
  Serial.begin(9600);
}

void loop() {
  // Copy, pasta, change pin for more sensors.
  int sensor0 = analogRead(A0);
  int sensor1 = analogRead(A1);
  int sensor2 = analogRead(A2);
  int sensor3 = analogRead(A3);
  int sensor4 = analogRead(A4);
  int sensor5 = analogRead(A5);
  int sensor6 = analogRead(A6);
  int sensor7 = analogRead(A7);
  int sensor8 = analogRead(A8);
  int sensor9 = analogRead(A9);
  int sensor10 = analogRead(A10);
  int sensor11 = analogRead(A11);
  int sensor12 = analogRead(A12);
  int sensor13 = analogRead(A13);
  int sensor14 = analogRead(A14);
  int sensor15 = analogRead(A15);
  int sensor16 = analogRead(A16);
  // Copy, pasta, change number for more sensors.
  Serial.print(sensor0);
  Serial.print(", ");
  Serial.print(sensor1);
  Serial.print(", ");
  Serial.print(sensor2);
  Serial.print(", ");
  Serial.print(sensor3);
  Serial.print(", ");
  Serial.print(sensor4);
  Serial.print(", ");
  Serial.print(sensor5);
  Serial.print(", ");
  Serial.print(sensor6);
  Serial.print(", ");
  Serial.print(sensor7);
  Serial.print(", ");
  Serial.print(sensor8);
  Serial.print(", ");
  Serial.print(sensor9);
  Serial.print(", ");
  Serial.print(sensor10);
  Serial.print(", ");
  Serial.print(sensor11);
  Serial.print(", ");
  Serial.print(sensor12);
  Serial.print(", ");
  Serial.print(sensor13);
  Serial.print(", ");
  Serial.print(sensor14);
  Serial.print(", ");
  Serial.print(sensor15);
  Serial.print(", ");
  Serial.print(sensor16);
  // Final Line, so each print is different per frame.
  Serial.println();
}