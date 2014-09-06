import usb
# Variables de conexion al USB
VENDOR = 0x04D8
PRODUCT = 0xFEAA
TIMEOUT = 10000
INTERFACE = 0
ENDPOINT_OUT = 0x01
CONFIGURATION = 0x03
ENDPOINT_IN = 0x81
busses = usb.busses()
# Buscar el PIC18F4550 conectado al puerto USB
for bus in busses:
    devices = bus.devices
    for dev in devices:
        if dev.idVendor==VENDOR and dev.idProduct==PRODUCT:
            PIC18F4550 = dev

# Habilitar el PIC18F4550 para su uso
dh = PIC18F4550.open()
dh.setConfiguration(CONFIGURATION)
dh.claimInterface(INTERFACE)

# Funcion para enviar los datos al USB
def encender_led(buf):
    dh.bulkWrite(ENDPOINT_OUT, buf, TIMEOUT)

print("===== Encender LED =====")
print(" 1: Encender LED verde ")
print(" 2: Apagar LED verde ")
print(" 3: Encender LED amarillo ")
print(" 4: Apagar LED amarillo ")
print(" 5: Encender LED azul ")
print(" 6: Apagar LED azul ")
print(" 7: Encender todos los LEDs ")
print(" 8: Apagar todos los LEDs ")
print("10: Salir")

Nro=int(input("Ingresa el nro : "))

while(Nro != 10):
    encender_led(str(Nro).encode())
    Nro=int(input("Ingresa el nro : "))

