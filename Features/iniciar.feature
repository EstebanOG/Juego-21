Feature: iniciar

    Como repartidor quiero entregar 2 cartas para iniciar el juego.

Scenario: entregar dos cartas para iniciar el juego
Given un mazo para iniciar el juego de 21
When el repartidor da una 1 y luego otra 2
Then la cantidad de cartas de la mano es 2