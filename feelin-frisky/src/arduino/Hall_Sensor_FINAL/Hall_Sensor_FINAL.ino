// All the Pins in Array Form, {Sensor Name, Pin, Letter, Previous Read}

int allPin[] = {A0, A1, A2, A3, A4, A5, A6, A10, A11, A12, A13, A14, A15, A16, A17};
String names[] = {"RPOCK", "RTHIGH", "RFOOT", "RASS", "LASS", "LPOCK", "LTHIGH", "TUMTUM", "LPEC", "LPIT", "LFARM", "RFARM", "RPIT", "RPEC", "DICK"};

void setup() {
  // Don't technically need anything for USB, but for Serial check.
  for (int i = 0; i < sizeof(allPin); i++) {
    pinMode(allPin[i], INPUT);
  }
  Serial.begin(9600);
}

void loop() {
  // for (int i =  0; i < sizeof(allPin); i++) {
  //   int pinRead = analogRead(allPin[i]);
  //   Serial.println(pinRead);
  //   if (pinRead > 550 || pinRead < 450) {
  //     Serial.println(names[i]);
  //   }
  // }
  // // Copy, pasta, change pin for more sensors.
  int r_pck = analogRead(A0);
  //Serial.println(r_pck);
  if (r_pck > 550 || r_pck < 450) {
    Serial.println("RPOCKET");
    Keyboard.print("q");
  }
  // int r_thg = analogRead(A1);
  // int r_ft = analogRead(A2);
  // int r_ass = analogRead(A3);
  // int l_ass = analogRead(A4);
  // int l_pck = analogRead(A5);
  // int l_thg = analogRead(A6);
  // // int sensor7 = analogRead(A7);
  // // int sensor8 = analogRead(A8);
  // // int sensor9 = analogRead(A9);
  // int tum = analogRead(A10);
  // int l_pec = analogRead(A11);
  // int l_pit = analogRead(A12);
  // int l_farm = analogRead(A13);
  // int r_farm = analogRead(A14);
  // int r_pit = analogRead(A15);
  // int r_pec = analogRead(A16);
  // int dick = analogRead(A17);
  // // Copy, pasta, change number for more sensors.
  // Serial.print("RPOCK: ");
  // Serial.print(r_pck);
  // Serial.print(", ");
  // Serial.print("RTHI: ");
  // Serial.print(r_thg);
  // Serial.print(", ");
  // Serial.print("RFT: ");
  // Serial.print(r_ft);
  // Serial.print(", ");
  // Serial.print("RASS: ");
  // Serial.print(r_ass);
  // Serial.print(", ");
  // Serial.print("LASS: ");
  // Serial.print(l_ass);
  // Serial.print(", ");
  // Serial.print("LPOCK: ");
  // Serial.print(l_pck);
  // Serial.print(", ");
  // Serial.print("LTHI: ");
  // Serial.print(l_thg);
  // Serial.print(", ");
  // // Serial.print("A7: ");
  // // Serial.print(sensor7);
  // // Serial.print(", ");
  // // Serial.print("A8: ");
  // // Serial.print(sensor8);
  // // Serial.print(", ");
  // // Serial.print("A9: ");
  // // Serial.print(sensor9);
  // // Serial.print(", ");
  // Serial.print("TUM: ");
  // Serial.print(tum);
  // Serial.print(", ");
  // Serial.print("LPEC: ");
  // Serial.print(l_pec);
  // Serial.print(", ");
  // // LPIT Reversed
  // Serial.print("LPIT: ");
  // Serial.print(l_pit);
  // Serial.print(", ");
  // Serial.print("LFARM: ");
  // Serial.print(l_farm);
  // Serial.print(", ");
  // Serial.print("RFARM: ");
  // Serial.print(r_farm);
  // Serial.print(", ");
  // // RPIT is reversed
  // Serial.print("RPIT: ");
  // Serial.print(r_pit);
  // Serial.print(", ");
  // Serial.print("RPEC: ");
  // Serial.print(r_pec);
  // Serial.print(", ");
  // Serial.print("DICK: ");
  // Serial.print(dick);
  // // Final Line, so each print is different per frame.
  // Serial.println();
}