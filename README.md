# Juego-21

## Descripción

## Historias de usuario juego 21

__Estructura:__

Como __ROL__ quiero __ACCIÓN__ para __FUNCIONALIDAD__

- Como repartidor quiero entregar 2 cartas para iniciar el juego.
- Como jugador quiero determinar el valor de la mano para seguir jugando.
- Como jugador quiero plantarme para finalizar el turno.
- Como jugador quiero solicitar una carta adicional para seguir jugando.
- Como jugador quiero determinar el valor de una carta para determinar el valor de la mano.
- Como repartidor quiero barajar las cartas para iniciar el juego. 
- Como repartidor quiero saber el valor de las manos para determinar quién gana. 

## Manual Behave

El desarrollo impulsado por el comportamiento (o BDD) es una técnica de desarrollo de software ágil que fomenta la colaboración entre desarrolladores, QA y participantes no técnicos o comerciales en un proyecto de software.

*behave* utiliza pruebas escritas en un estilo de lenguaje natural, respaldado por código Python.

Primero, install *behave*.
 #### Instalación

```
~$ pip install behave
```

Ahora cree un directorio llamado "Features/". En ese directorio, cree un archivo llamado "carta.feature" que contenga:

.. code-block:: gherkin

    # -- FILE: Features/carta.feature
    Feature: Carta del 21

    Como jugador quiero determinar el valor de una carta para determinar el valor de la mano.

    Scenario Outline: determinar valor carta
    Given una <carta> para saber su valor
    When el jugador quiere saber su valor
    Then el <valor> de la carta es correcto

    Examples:
        | carta | valor | 
        | 2, picas  | 2  |
        | A, corazones  | 1  |
        | 8, treboles  | 8  |
        | J, picas  | 10  |
        | Q, picas  | 10  |
        | K, picas  | 10  |

Cree un nuevo directorio llamado "Features/Steps/". En ese directorio, cree un archivo llamado "steps_carta.py" que contenga:

.. code-block:: python

    # -- FILE: Features/Steps/steps_carta.py
    from behave import *
    from carta import Carta

    @given('una {carta} para saber su valor')
    def setp(context, carta):
        valor, pinta = carta.split(",")
        context.carta = Carta(valor, pinta)

    @when('el jugador quiere saber su valor')
    def setp(context):
        context.valor = context.carta.evaluar()

    @then('el {valor:d} de la carta es correcto')
    def setp(context, valor):
        assert context.valor == valor

Ejecutar behave:

.. code-block:: console

    $ behave
    Feature: Carta del 21 # features/carta.feature:1
    Como jugador quiero determinar el valor de una carta para determinar el valor de la mano.
    Scenario Outline: determinar valor carta -- @1.1   # features/carta.feature:12
        Given una 2, picas para saber su valor           # features/steps/steps_carta.py:4
        When el jugador quiere saber su valor            # features/steps/steps_carta.py:9
        Then el 2 de la carta es correcto                # features/steps/steps_carta.py:13

    Scenario Outline: determinar valor carta -- @1.2   # features/carta.feature:13
        Given una A, corazones para saber su valor       # features/steps/steps_carta.py:4
        When el jugador quiere saber su valor            # features/steps/steps_carta.py:9
        Then el 1 de la carta es correcto                # features/steps/steps_carta.py:13

    Scenario Outline: determinar valor carta -- @1.3   # features/carta.feature:14
        Given una 8, treboles para saber su valor        # features/steps/steps_carta.py:4
        When el jugador quiere saber su valor            # features/steps/steps_carta.py:9
        Then el 8 de la carta es correcto                # features/steps/steps_carta.py:13

    Scenario Outline: determinar valor carta -- @1.4   # features/carta.feature:15
        Given una J, picas para saber su valor           # features/steps/steps_carta.py:4
        When el jugador quiere saber su valor            # features/steps/steps_carta.py:9
        Then el 10 de la carta es correcto               # features/steps/steps_carta.py:13

    Scenario Outline: determinar valor carta -- @1.5   # features/carta.feature:16
        Given una Q, picas para saber su valor           # features/steps/steps_carta.py:4
        When el jugador quiere saber su valor            # features/steps/steps_carta.py:9
        Then el 10 de la carta es correcto               # features/steps/steps_carta.py:13

    Scenario Outline: determinar valor carta -- @1.6   # features/carta.feature:17
        Given una K, picas para saber su valor           # features/steps/steps_carta.py:4
        When el jugador quiere saber su valor            # features/steps/steps_carta.py:9
        Then el 10 de la carta es correcto               # features/steps/steps_carta.py:13

    1 feature passed, 0 failed, 0 skipped
    6 scenarios passed, 0 failed, 0 skipped
    18 steps passed, 0 failed, 0 skipped, 0 undefined

#### Equipo de trabajo

Integrante  | Código
------------- | -------------
Cristhian Mauricio Yara Pardo | 20181020081
Juan Esteban Olaya García | 20171020135
Diego Alonso Galeano Herrera | 20172020074