user = ''
matrix_file = open('user_song_count_matrix.txt', 'w')
songs_list = []
song = ''
with open('kaggle_visible_evaluation_triplets.txt', 'r') as f:
    data = f.readlines()
    data = [section.split('\t') for section in data]

    i = 0
    for line in data:
        if user != line[0]:
            user = line[0]
            i += 1
        if line[1] not in songs_list:
            songs_list.append(line[1])

        line[1] = str(songs_list.index(line[1]))
        line[0] = str(i)
        matrix_file.write(", ".join(line))

matrix_file.close()
