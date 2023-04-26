// All the Pins in Array Form, {Sensor Name, Pin, Letter, Previous Read}

void setup() {
  // Don't technically need anything for USB, but for Serial check.
  Serial.begin(9600);
}

void loop() {
  // Copy, pasta, change pin for more sensors.
  int sensor1 = analogRead(A1);
  int sensor2 = analogRead(A2);
  int sensor3 = analogRead(A3);
  int sensor4 = analogRead(A4);
  // Copy, pasta, change number for more sensors.
  Serial.print(sensor1);
  Serial.print(", ");
  Serial.print(sensor2);
  Serial.print(", ");
  Serial.print(sensor3);
  Serial.print(", ");
  Serial.print(sensor4);
  // Final Line, so each print is different per frame.
  Serial.println();
}