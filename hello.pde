// Definimos los pines a usar
#define pin7 7
#define pin6 6
#define pin5 5


char buffer[64];
char dato;
int byteRecibido = 0;
void setup()
 {
    // Inicializamos los pines como pines de salida
    pinMode(USERLED, OUTPUT);
    pinMode(pin7,OUTPUT);
    digitalWrite(pin7,LOW);
    pinMode(pin6,OUTPUT);
    digitalWrite(pin6,LOW);
    pinMode(pin5,OUTPUT);
    digitalWrite(pin5,LOW);
}

void loop() {
    // Verificamos que la conexión este habilitada
    if(BULK.available())
        byteRecibido = BULK.read(buffer);
    // Comparamos los datos recibidos
    buffer[byteRecibido] = 0;
    if (byteRecibido > 0)
    {
        dato = buffer[0];
        if(dato == '1')
        {
            digitalWrite(pin7,HIGH); // El LED en el pin7 se prende
        }
        else if(dato == '2')
        {
            digitalWrite(pin7,LOW); // El LED en el pin7 se apaga
        }
        else if(dato == '3')
        {
            digitalWrite(pin6,HIGH);
        }
        else if(dato == '4')
        {
            digitalWrite(pin6,LOW);
        }
        else if(dato == '5')
        {
            digitalWrite(pin5,HIGH);
        }
        else if(dato == '6')
        {
            digitalWrite(pin5,LOW);
        }
        else if(dato == '8')
        {
            digitalWrite(pin7,LOW);
            digitalWrite(pin6,LOW);
            digitalWrite(pin5,LOW);
        }
    }
}
