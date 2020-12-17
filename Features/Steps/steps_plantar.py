from behave import *
from mano import Mano

@given('mi {mano} para plantarme')
def step(context,mano):
    context.mano=Mano(mano.split(";"))

@when('el {valor:d} de mi mano es <= que 21')
def step(context,valor):
    context.plantar=str(context.mano.comprobar_juego(valor))

@then('me puedo {plantar}')
def step(context,plantar):
    assert context.plantar == plantar