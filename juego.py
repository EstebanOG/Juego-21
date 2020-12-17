
from mazo import Mazo
from mano import Mano

class Juego:

    def __init__(self):
        self.mazo=Mazo()
        self.mazo.barajar()

        cartas_jugador = []
        cartas_repartidor=[]

        cartas_jugador.append(self.mazo.dar_carta(0))
        cartas_jugador.append(self.mazo.dar_carta(1))

        cartas_repartidor.append(self.mazo.dar_carta(2))
        cartas_repartidor.append(self.mazo.dar_carta(3))

        self.contador_cartas = 4

        self.mano_jugador = Mano(cartas_jugador)
        self.mano_repartidor = Mano(cartas_repartidor)

        self.turno = 1
        self.jugarUsuario()

    def pedir(self):
        self.mano_jugador.ingresar_carta(self.mazo.dar_carta(self.contador_cartas))
        self.contador_cartas = self.contador_cartas+1

    def plantar():
        self.turno = 2

    def jugarUsuario():
        while self.turno == 1:
            print("opciones:")
            print("1. Pedir carta")
            print("2. Plantarse")
            opción = input()

            if opcion == 1:
                self.pedir()
                if(self.mano_jugador.evaluar()>20):
                    self.turno =2
            elif (opcion == 2):
                self.plantarse
            else:
                print("Seleccione una opción válida:")

    def jugarRepartidor(self):
        pass