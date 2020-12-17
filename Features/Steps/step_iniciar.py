from behave import *
from mazo import Mazo
from mano import Mano

@given('un mazo para iniciar el juego de 21')
def implementacion(context):
    context.mazo = Mazo()
    context.mano = Mano([])

@when('el repartidor da una 1 y luego otra 2')
def implementacion(context):
    context.mano.agregar_carta(context.mazo.dar_carta(0).valor,context.mazo.dar_carta(0).pinta)
    context.mano.agregar_carta(context.mazo.dar_carta(1).valor,context.mazo.dar_carta(1).pinta)

@then('la cantidad de cartas de la mano es 2')
def implementacion(context):
    assert len(context.mano.cartas) == 2