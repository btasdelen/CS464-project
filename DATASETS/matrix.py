indexed = dict()
user = ''
matrix_file = open('modified.txt', 'w')
with open('kaggle_visible_evaluation_triplets.txt', 'r') as f:
    data = f.readlines()
    data = [section.split('\t') for section in data]

    song_index = 0
    for line in data:
        if user != line[0]:
            matrix_file.write(",".join(str(x) for x in data) + '\n')
            matrix_file.flush()
            users_array = [0]*len(indexed)
            user = line[0]

        song_index = indexed[line[1]]
        users_array[song_index] = line[2]

matrix_file.close()
