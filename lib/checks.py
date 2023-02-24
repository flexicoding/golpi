class Checks:
    
    def __init__(self, everyboard):
        self.everyboard = everyboard


    def distance(self):
        lastboard = self.everyboard[len(self.everyboard)-1]
        distances = {"up":0, "down":0, "right":0, "left":0}

        for i in range(len(lastboard)):
            if sum(lastboard[i]) > 0:
                distances["up"] = int(len(lastboard)/2) - i
                break
        
        for i in reversed(range(len(lastboard))):
            if sum(lastboard[i]) > 0:
                distances["down"] = i - int(len(lastboard)/2)
                break
        
        for x in range(len(lastboard)):
            for i in range(len(lastboard[x])):
                if lastboard[x][i] > 0:
                    distances["left"] = int(len(lastboard[x])/2) - i
                    break
            if distances["left"] > 0:
                break
        
        for x in range(len(lastboard)):
            for i in reversed(range(len(lastboard[x]))):
                if lastboard[x][i] > 0:
                    distances["right"] = i - int(len(lastboard[x])/2)
                    break
            if distances["right"] > 0:
                break

        return distances

    def pixelsperframe(self):
        totalpixels = 0
        for i in range(len(self.everyboard)): # one frame
            for j in range(len(self.everyboard[i])): # one row
                totalpixels += sum(self.everyboard[i][j])
                
        return totalpixels / len(self.everyboard)

    def survivedtime(self):
        time = 0
        for i in range(len(self.everyboard)): # one frame
            pixels = 0
            for j in range(len(self.everyboard[i])): # one row
                pixels += sum(self.everyboard[i][j])
            
            if pixels > 0: # survived to the last frame tried
                time += 1
            else: # didn't survived to the last frame tried
                break
        return time
