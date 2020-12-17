Feature: Plantarme
    Como jugador quiero plantarme para finalizar el turno.

Scenario Outline: Plantarme
Given una <mano> para plantarse
When el <valor> de la mano es >= que 18
Then <plantar> es correcto

Examples:
    | mano                                                | valor|plantar|
    | (5, picas);(J, treboles)                            | 15   |False  |
    | (9, corazones);(A, treboles)                        | 20   |True   |
    | (3, diamantes);(Q, picas)                           | 13   |False  |
    | (A, picas);(A, treboles)                            | 12   |False  |
    | (A, diamantes);(J, treboles)                        | 21   |True   |
    | (5, picas);(J, treboles);(3, treboles)              | 18   |True   |
    | (A, picas);(A, treboles);(A, diamantes)             | 13   |False  |
    | (A, picas);(A, treboles);(A, diamantes);(Q, picas)  | 13   |False  |