  
Feature: comprobar ganador

    Como repartidor quiero saber el valor de las manos para determinar quién gana.

Scenario Outline: Conocer el valor de las manos para determinar el ganador
Given <mano_1> y <mano_2> para determinar sus valores
When los jugadores se terminan su turno
Then el <valor_1> y el <valor_2> son correctos

Examples:
    | mano_1                                 |valor_1  | mano_2                                        | valor_2|
    |(5, picas);(J, treboles)                |15        |(9, corazones);(A, treboles)                        |20     |
    |(3, diamantes);(Q, picas)               |13        |(A, picas);(A, treboles)                            |12     |
    |(A, diamantes);(J, treboles)            |21        |(5, picas);(J, treboles);(3, treboles)              |18     |
    |(A, picas);(A, treboles);(A, diamantes) |13         |(A, picas);(A, treboles);(A, diamantes);(Q, picas)  |13     |