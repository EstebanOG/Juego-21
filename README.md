# Juego-21

## Descripción
A continuación presentaremos un tutorial de como realizar pruebas de aceptación mediante el juego de 21 utilizando la herramienta de *behave*, 
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

## Gherkin

Gherkin es un DSL o Lenguaje Específico de Dominio (Domain-Specific Languaje), es decir, un lenguaje que está creado para resolver un problema.

Tiene una estructura generada por varios elementos, como vemos en la siguiente tabla.

Sintaxis  | Propósito
------------- | -------------
FEATURE | El propósito del FEATURE es proporcionar una descripción de alto nivel de una de las funciones de software y agrupar SCENARIOs relacionados.
SCENARIO o EXAMPLE | Un SCENARIO es un ejemplo concreto que contiene una regla de negocio. Consiste básicamente en una definición en el patrón ‘Given-When-Then’.
GIVEN | GIVEN es parte de patrón ‘Given-When-Then’. Se utilizan para describir el contexto inicial del sistema: la escena del escenario. El propósito de los Given es poner el sistema en un estado concreto antes de que el usuario (o sistema externo) comience a interactuar con el sistema (en los WHEN). Es importante evitar hablar sobre la interacción del usuario en este patrón.
WHEN | WHEN es la segundo requisito del patrón ‘Given-When-Then’. Se utilizan para describir un evento o una acción. Puede ser una persona que interactúa con el sistema o puede ser un evento desencadenado por otro sistema.
THEN | THEN, la última descripción del patrón ‘Given-When-Then’.  Se utilizan para describir el resultado esperado. La definición de un THEN debe usar una aserción para comparar el resultado real (lo que el sistema realmente hace) con el resultado esperado (lo que se supone que debe hacer el sistema).
AND | AND se utiliza para añadir alguna condición más en alguno de los patrones Given, When o Then
BUT | Al igual que el AND se utiliza en los patrones Given, When o Then, pero en este caso se utiliza como condición extra.
BACKGROUND | Ocasionalmente, te encontrarás repitiendo los mismos GIVEN en muchos SCENARIO de una FEATURE. Si es el caso, como se repite en cada escenario, esto es una indicación de que los patrones no son esenciales para describir los escenarios; Son detalles generales. Literalmente, puedes moverlos agrupándolos en un BACKGROUND.
SCENARIO OUTLINE | El SCENARIO OUTLINE se puede usar para ejecutar varios SCENARIO varias veces, con diferentes combinaciones de valores.
""" | Doc Strings o “”” es útil si necesitas añadir mucha información a los patrones.
@ | Prefijo para una etiqueta: @. Las etiquetas pueden ser colocadas antes de los patrones o SCENARIO. El objetivo principal es ayudarte a filtrar SCENARIOs.


Estos elementos nos ayudan a que todos esos comportamientos vayan poco a poco bajando de nivel, hasta llegar a un lenguaje que entiendan fácilmente los desarrolladores.
## Manual Behave

El desarrollo impulsado por el comportamiento (o BDD) es una técnica de desarrollo de software ágil que fomenta la colaboración entre desarrolladores, QA y participantes no técnicos o comerciales en un proyecto de software.

*behave* utiliza pruebas escritas en un estilo de lenguaje natural, respaldado por código Python.

Primero, install *behave*.
 ### Instalación

```
~$ pip install behave
```

Ahora cree un directorio llamado "Features/". En ese directorio, cree un archivo llamado "carta.feature" que contenga:


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

### Features
*behave* opera en directorios que contienen:

1. *feature files* escritos por su analista de negocios / patrocinador / quien sea con sus escenarios de comportamiento en él, y
2. un directorio de "steps" con *Python step implementations* para los escenarios.

El requisito mínimo para un directorio de características es:

    features/
    features/carta.feature
    features/steps/
    features/steps/steps_carta.py

### Feature Files
Un *feature file* tiene un formato de lenguaje natural que describe una característica o parte de una característica con ejemplos representativos de los resultados esperados. Son de texto sin formato (codificados en UTF-8) y se parecen a:

    Feature: barajar al inicio
        
        Como repartidor quiero barajar las cartas para iniciar el juego.

    Scenario: barajar
        Given un mazo para jugar 21
        When el repartidor baraja el mazo
        Then las cartas 5 y 10 no son iguales
        And la catidad de cartas es 52

Las partes “Given”, “When” y “Then” de esta prosa forman los pasos reales que tomará el comportamiento para probar su sistema. Estos se asignan a implementaciones de pasos de Python . Como guía general:

**Given** ponemos el sistema en un estado conocido antes de que el usuario (o sistema externo) comience a interactuar con el sistema (en los pasos Cuándo). Evite hablar de la interacción del usuario en situaciones dadas.

**When** tomamos acciones clave que el usuario (o sistema externo) lleva a cabo. Esta es la interacción con su sistema que debería (o tal vez no debería) hacer que algún estado cambie.

**Then** observamos los resultados.

También puede incluir **And** o **But** como un step; se les cambia el nombre por behave para tomar el nombre del paso anterior, por lo que:

    Scenario: barajar
        Given un mazo para jugar 21
        When el repartidor baraja el mazo
        Then las cartas 5 y 10 no son iguales
        And la catidad de cartas es 52
### Scenario Outlines
A veces, un scenario debe ejecutarse con una serie de variables que proporcionen un conjunto de estados conocidos, acciones a tomar y resultados esperados, todos utilizando las mismas acciones básicas. Puede utilizar un esquema de escenario para lograr esto:

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

behave ejecutará el scenario una vez por cada línea (sin encabezado) que aparezca en las tablas de datos de ejemplo.
### Python Step Implementations

Los pasos utilizados en los escenarios se implementan en archivos de Python en el directorio "steps". Puede llamarlos como quiera siempre que utilicen la extensión *.py de archivo python. No es necesario que le digas a behave cuáles usar; los usará todos.

Los **Steps** se identifican utilizando decoradores que coinciden con el predicado del archivo de características: given, when, then and step (las variantes con el título también están disponibles si esa es su preferencia). El decorador acepta una cadena que contiene el resto de la frase utilizada en el escenario paso al que pertenece.

Dado un escenario:

    Scenario Outline: valor de la mano
        Given una <mano> para sumar sus cartas
        When el jugador suma la mano
        Then el <valor> es correcto

El código de step que implementa los steps podría verse así:

    @given('una {mano} para sumar sus cartas')
    def step(context, mano):
        context.mano = Mano(mano.split(";"))

    @when('el jugador suma la mano')
    def step(context):
        context.valor = context.mano.evaluar()

    @then('el {valor:d} es correcto')
    def step(context, valor):
        assert context.valor == valor

### Equipo de trabajo

Integrante  | Código
------------- | -------------
Cristhian Mauricio Yara Pardo | 20181020081
Juan Esteban Olaya García | 20171020135
Diego Alonso Galeano Herrera | 20172020074