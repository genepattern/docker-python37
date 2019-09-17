import sys
import time

print("This is the name of the script: ", sys.argv[0])
print("Number of arguments: ", len(sys.argv))
print("The arguments are: " , str(sys.argv))

print('showing contents of file: ', sys.argv[1])

Warning("WHERE AM I")

with open(sys.argv[1], "r") as f:
    for line in f:
        print(line)

now = time.strftime("%c")
text_file = open("Output.txt", "w")
text_file.write("now is %s"% now)
text_file.close()

