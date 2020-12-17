from behave import *
from mano import Mano

@given('{mano_1} y {mano_2} para determinar sus valores')
def step(context,mano_1,mano_2):
    context.mano_1=Mano(mano_1.split(";"))
    context.mano_2=Mano(mano_2.split(";"))

@when('los jugadores se terminan su turno')
def step(context):
    context.valor_1 = context.mano_1.evaluar()
    context.valor_2 = context.mano_2.evaluar()

@then('el {valor_1:d} y el {valor_2:d} son correctos')
def step(context,valor_1,valor_2):
    assert context.valor_1 == valor_1 and context.valor_2 == valor_2