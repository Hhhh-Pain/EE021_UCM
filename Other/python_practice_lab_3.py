# between()
  # Write a function between that returns a list that includes every even number between, but not including, a positive input integer X and 0
  # The numbers should be ordered from greatest to least. If the list would be empty, return the string "Empty list".


def between(x):
        comma = ","
        y = ''
        if x in [1, 0]:
                return "Empty list"
        elif x%2 == 0:
                while x >= 2:
                        if x != 2:
                                x -= 2
                                y = y + str(x)
                                if x == 2:
                                        break
                                y = y + comma

                        if x == 2:
                                y = y + str(x)
                                x -= 2
                return y

        elif x%2 == 1:
                x -= 1  # x is now even
                while x >= 2:
                        if x != 2:
                                y = y + str(x)
                                y = y + comma

                                x -= 2
                        if x == 2:
                                y = y + str(x)
                                x -= 2
                return y

### Test Cases ###
x = between(6)	# 4,2
x = between(25)	# 24,22,20,18,16,14,12,10,8,6,4,2
x = between(7)	# 6,4,2
x = between(3)	# 2
x = between(49)	# 48,46,44,42,40,38,36,34,32,30,28,26,24,22,20,18,16,14,12,10,8,6,4,2
x = between(13)	# 12,10,8,6,4,2
x = between(1)	# "Empty list"


print(x)
