with open('user_song_count_matrix.txt', 'r') as f:
    table = f.readlines()
    new_table = []
    for line in table:
        if line != '\n':
            new_table.append(line)

    new_f = open('new_matrix.txt', 'w')
    new_f.writelines(new_table)
