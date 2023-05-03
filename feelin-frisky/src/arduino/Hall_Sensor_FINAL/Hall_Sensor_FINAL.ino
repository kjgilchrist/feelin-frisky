// The threshold bounds for the Hall Sensors.
int UPPER_BOUND = 575;
int LOWER_BOUND = 425;
// Delay time per loop() for the key presses.
int DELAY_TIME = 500;
// Instantiate each int for the sensors.
int r_pck, r_thg, r_ft, r_ass, l_ass, l_pck, l_thg, tum, l_pec, l_pit, l_farm, r_farm, r_pit, r_pec, dick;

void setup() {
  // Set pin modes. INPUT_DISABLE for unused analog pins.
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);
  pinMode(A5, INPUT);
  pinMode(A6, INPUT);
  pinMode(A7, INPUT_DISABLE);
  pinMode(A8, INPUT_DISABLE);
  pinMode(A9, INPUT_DISABLE);
  pinMode(A10, INPUT);
  pinMode(A11, INPUT);
  pinMode(A12, INPUT);
  pinMode(A13, INPUT);
  pinMode(A14, INPUT);
  pinMode(A15, INPUT);
  pinMode(A16, INPUT);
  pinMode(A17, INPUT);
  // Serial.begin(9600);
  delay(500);
}

void loop() {
  // Right Pocket - A0 - Key: 6
  r_pck = analogRead(A0);
  if (r_pck > UPPER_BOUND || r_pck < LOWER_BOUND) {
    Keyboard.print("6");
  }
  // Right Thigh - A1 - Key: y
  r_thg = analogRead(A1);
  if (r_thg > UPPER_BOUND || r_thg < LOWER_BOUND) {
    Keyboard.print("y");
  }
  // Right Foot - A2 - Key: 9
  r_ft = analogRead(A2);
  if (r_ft > UPPER_BOUND || r_ft < LOWER_BOUND) {
    Keyboard.print("y");
  }
  // Right Ass - A3 - Key: r
  r_ass = analogRead(A3);
  if (r_ass > UPPER_BOUND || r_ass < LOWER_BOUND) {
    Keyboard.print("r");
  }
  // Left Ass - A4 - Key: e
  l_ass = analogRead(A4);
  if (l_ass > UPPER_BOUND || l_ass < LOWER_BOUND) {
    Keyboard.print("e");
  }
  // Left Pocket - A5 - Key: 7
  l_pck = analogRead(A5);
  if (l_pck > UPPER_BOUND || l_pck < LOWER_BOUND) {
    Keyboard.print("7");
  }
  // Left Thigh - A6 - Key: t
  l_thg = analogRead(A6);
  if (l_thg > UPPER_BOUND || l_thg < LOWER_BOUND) {
    Keyboard.print("t");
  }
  // Left Foot - N/A - Key: 0
  
  // Tummy - A10 - Key: 5
  tum = analogRead(A10);
  if (tum > UPPER_BOUND || tum < LOWER_BOUND) {
    Keyboard.print("5");
  }
  // Left Pec - A11 - Key: 3
  l_pec = analogRead(A11);
  if (l_pec > UPPER_BOUND || l_pec < LOWER_BOUND) {
    Keyboard.print("3");
  }
  // Left Armpit - A12 - Key: q
  l_pit = analogRead(A12);
  if (l_pit > UPPER_BOUND || l_pit < LOWER_BOUND) {
    Keyboard.print("q");
  }
  // Left Forearm - A13 - Key: 4
  l_farm = analogRead(A13);
  if (l_farm > UPPER_BOUND || l_farm < LOWER_BOUND) {
    Keyboard.print("4");
  }
  // Right Forearm - A14 - Key: 1
  r_farm = analogRead(A14);
  if (r_farm > UPPER_BOUND || r_farm < LOWER_BOUND) {
    Keyboard.print("1");
  }
  // Right Armpit - A15 - Key: w
  r_pit = analogRead(A15);
  if (r_pit > UPPER_BOUND || r_pit < LOWER_BOUND) {
    Keyboard.print("w");
  }
  // Right Pec - A16 - Key: 2
  r_pec = analogRead(A16);
  if (r_pec > UPPER_BOUND || r_pec < LOWER_BOUND) {
    Keyboard.print("2");
  }
  // Crotch - A17 - Key: 8
  dick = analogRead(A17);
  if (dick > UPPER_BOUND || dick < LOWER_BOUND) {
    Keyboard.print("8");
  }
  delay(DELAY_TIME);
}