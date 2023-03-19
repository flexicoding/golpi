#include "board.h"

int main(int argc, char** argv)
{
    uint64_t generations = 1;

    printf("Geben Sie die Anzahl der Generationen ein, fuer die die Simulation laufen soll: ");
    scanf("%llu", &generations);

    char game_board[10 * 10] = {
        ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '*', '*',
        ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
        ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
        ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
        ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
        ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
        ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
        ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
        ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
        ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '*', '*',
    };
    GolpiBoard board = golpi_board_create(game_board, 10, 10, 0);
    golpi_board_print(&board);

    size_t g = 0;
    for(; g < generations; g++)
    {
        golpi_board_simulate(&board);
        golpi_board_print(&board);
        if(golpi_board_check_zero(&board)) return 0;
    }
    return 0;
}