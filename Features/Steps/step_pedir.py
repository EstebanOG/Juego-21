from behave import *
from mano import Mano

@given('mi {mano} para pedir una carta')
def step(context,mano):
    context.mano=Mano(mano.split(";"))

@when('el {valor:d} de mi mano es <= 21')
def step(context,valor):
    context.pedir=str(context.mano.comprobar_juego(valor))

@then('puedo {pedir} una carta')
def step(context,pedir):
    assert context.pedir == pedir
