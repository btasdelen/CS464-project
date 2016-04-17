import numpy as np

import os
import sys

file_path = sys.argv[1]

triplets = np.loadtxt(os.path.join(file_path, "kaggle_visible_evaluation_triplets.txt"),
                            delimiter="\t", dtype="str")

enum_users = np.ndenumerate(np.unique(triplets[:, 0]))

print(enum_users)

triplets[triplets[:, 0] == user_id[user_nr[0]], 0] = user_nr + 1

print(triplets)
