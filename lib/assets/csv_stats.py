import re

print "processing players"
num_males = 0
num_females = 0
with open('players.csv', 'r') as file:
    for line in file:
        if "last,first,gender" in line:
            print "skipping first line"
        elif ",M," in line:
            num_males += 1
        elif ",F," in line:
            num_females += 1
        else:
            print "error processing line: {}".format(line)
# We don't draft any captains, except for two of the males
print "males: {}. drafting {}".format(num_males, num_males - 16 + 2)
print "females: {}. drafting {}".format(num_females, num_females - 16)

print "-----"

print "processing picks"
num_males = 0
num_females = 0
with open('picks.csv', 'r') as file:
    for line in file:
        if "gender,ign" in line:
            print "skipping first line"
        elif re.match("M,", line):
            num_males += 1
        elif re.match("F,", line):
            num_females += 1
        else:
            print "error processing line: {}".format(line)
print "males: {}".format(num_males)
print "females: {}".format(num_females)
