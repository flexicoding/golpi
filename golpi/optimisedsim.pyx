import copy

def convert2twod(inputlist, length):
    twod_list = []
    
    if int(len(inputlist)/length) != len(inputlist)/length:
        raise ValueError("List length must be divisible by length value")
    
    for i in range(int(len(inputlist)/length)):
        twod_list.append(inputlist[length*i:length*i+length])

    return twod_list


def centerposition(pattern, boardsize):
    patternposition = (int(boardsize[0]/2),int(boardsize[1]/2))

    patternposition = (patternposition[0]-int(len(pattern[0])/2),
                       patternposition[1]-int(len(pattern)/2))
    
    return patternposition


def createboard(int width, int height):
    board = [[0 for w in range(width)] for h in range(height)]
    return board


def addpattern(pattern, board, patternposition):
    cdef int i, j
    cdef int len_board_i = len(board)
    cdef int len_board_j = len(board[0])
    cdef int len_pattern_i = len(pattern)
    cdef int len_pattern_j = len(pattern[0])

    for i in range(len_board_i):
        for j in range(len_board_j):
            if i < patternposition[0] or i > patternposition[0]+len_pattern_i-1:
                pass
            elif j < patternposition[1] or j > patternposition[1]+len_pattern_j-1:
                pass
            else:
                board[i][j] = pattern[i-patternposition[0]][j-patternposition[1]]

    return board


def run(board: list, iterations: int):
    everyboard = []
    everyboard.append(board)

    for g in range(iterations):
        
        editboard = copy.deepcopy(board)

        for itrue in range(len(board)-2):
            y = itrue+1
            for ztrue in range(len(board[y])-2):
                x = ztrue+1

                places =  [board[y-1][x-1], board[y-1][x], board[y-1][x+1], # up
                           board[y][x-1],                  board[y][x+1],   # middle
                           board[y+1][x-1], board[y+1][x], board[y+1][x+1]] # buttom
                
                sourrounding = sum(places)
                
                if sourrounding >= 2:
                    if sourrounding == 3:
                        editboard[y][x] = 1
                    elif sourrounding == 2:
                        pass
                    elif sourrounding >= 4:
                        editboard[y][x] = 0
                    else:
                        pass
                else:
                    editboard[y][x] = 0

        board = editboard

        everyboard.append(board)
        
    return everyboard
    