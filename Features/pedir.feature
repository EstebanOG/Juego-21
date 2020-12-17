Feature: Pedir

    Como jugador quiero solicitar una carta adicional para seguir jugando.

Scenario Outline: Pedir
Given mi <mano> para pedir una carta
When el <valor> de mi mano es <= 21
Then puedo <pedir> una carta

Examples:
    | mano                                                | valor|pedir  |
    | (2, picas);(J, corazones)                           | 12   |True   |
    | (8, corazones);(A, picas)                           | 19   |True   |
    | (7, diamantes);(Q, picas);(J, picas)                | 27   |False  |
    | (A, diamantes);(A, treboles)                        | 12   |True   |
    | (A, diamantes);(J, treboles)                        | 21   |True   |
    | (K, picas);(J, treboles);(3, treboles)              | 23   |False  |
    | (A, picas);(A, treboles);(A, diamantes);(Q, picas)  | 13   |True   |
    | (A, picas);(A, treboles);(J, diamantes);(Q, picas)  | 22   |False  |