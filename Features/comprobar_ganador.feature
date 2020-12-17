
Feature: comprobar ganador

    Como repartidor quiero saber el valor de las manos para determinar quién gana.

Scenario Outline: Conocer el valor de las manos para determinar el ganador
Given <mano_1> y <mano_2> para determinar sus valores
When los jugadores se terminan su turno
Then el <valor_1> y el <valor_2> son acertados

Examples:
    | mano_1                                    |valor_1  | mano_2                                              | valor_2|
    |(4, corazones);(K, treboles)               |14       |(10, corazones);(A, corazones)                       |21      |
    |(7, diamantes);(J, treboles)               |17       |(6, corazones);(10, picas)                           |16      |
    |(3, corazones);(K, treboles)               |13       |(A, corazones);(A, treboles)                         |12      |
    |(8, treboles);(10, corazones)              |18       |(7, picas);(Q, diamantes)                            |17      |