import re


class Player(object):
    def __init__(self, first_name, last_name, gender, ripul_id):
        self.first_name = first_name
        self.last_name = last_name
        self.gender = gender
        self.ripul_id = ripul_id

    def is_same(self, player):
        return self.first_name == player.first_name and self.last_name == player.last_name and \
            self.gender == player.gender

    def __str__(self):
        return "{},{},{},{}".format(self.last_name, self.first_name, self.gender, self.ripul_id)


ripul_players = []
with open("ripul-2014.csv", 'r') as ripul_file:
    for row_num, row in enumerate(ripul_file):
        if row_num == 0:
            # skip header
            continue
        
        first_name, last_name, gender, ripul_id = re.search(
            '^".*?","(.*?)","(.*?)",.*,"(M|F)",.*,"(\d*?)",$', row).groups()
        ripul_players.append(Player(first_name, last_name, gender, ripul_id))

players = []
with open("players.csv", 'r') as players_file:
    for row_num, row in enumerate(players_file):
        if row_num == 0:
            # skip header
            continue
        last_name, first_name, gender, bad_ripul_id = row.split(',')
        player = Player(first_name, last_name, gender, bad_ripul_id.rstrip())
        found_match = False
        for ripul_player in ripul_players:
            if ripul_player.is_same(player):
                if found_match:
                    print "Warning: Already found a match for {}".format(player)
                found_match = True
                players.append(ripul_player)
        if not found_match:
            print "ERROR! No match found for {}".format(player)
            players.append(player)

with open("players_with_id.csv", 'w') as output_file:
    output_file.write("last,first,gender,PlayerID\n")
    for player in players:
        output_file.write(str(player) + '\n')
