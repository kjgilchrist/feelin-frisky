// All the Pins in Array Form, {Sensor Name, Pin, Letter, Previous Read}
const int NUM_PINS = 17;

struct data {
  String name;
  int pin;
  String key;
  int read;
};

data pinArray[ 17 ] = { { "HE_right_forearm", A1, "1" , 0 },
                          { "HE_right_arpit", A2, "2" , 0 },
                          { "HE_right_pec", A3, "3" , 0 },
                          { "HE_left_pec", A4, "4" , 0 },
                          { "HE_left_armpit", A5, "5" , 0 },
                          { "HE_left_forearm", A6, "6" , 0 },
                          { "HE_tummy", A7, "7" , 0 },
                          { "HE_right_butt", A8, "8" , 0 },
                          { "HE_right_pocket", A9, "9" , 0 },
                          { "HE_right_thigh", A10, "10" , 0 },
                          { "HE_right_foot", A11, "11" , 0 },
                          { "HE_left_butt", A12, "12" , 0 },
                          { "HE_left_pocket", A13, "13" , 0 },
                          { "HE_left_thigh", A14, "14" , 0 },
                          { "HE_left_foot", A15, "15" , 0 },
                          { "HE_crotch", A16, "16" , 0 },
                          { "B_neck", A17, "ENTER" , 0 } }; // Digital?

void setup() {
  // Don't technically need anything for USB, but for Serial check.
  Serial.begin(115200);
}

void loop() {
  for (int i = 0; i++; i < NUM_PINS) {
    sensorCheck(i);
  }
}

void sensorCheck(int index) {
  Serial.println("Checking " + pinArray[index].name + "...");
  int sensorRead = analogRead( pinArray[index].pin );
  if ( sensorRead != pinArray[index].read && sensorRead < 450 && sensorRead > 550 ) {
    // Keyboard.print( pinArray[index].key );
    Serial.print( pinArray[index].key );
  }
  pinArray[index].read = sensorRead;
}