import pandas as pd
import os
import matplotlib.pyplot as plt
import numpy as np

files = os.listdir('../csv')


def get_df(file):
    df = pd.read_csv('../csv/' + file, sep=' ')
    df['file'] = file
    return df


plt.figure(0, (36, 16))
plt.tight_layout()
df = pd.concat([get_df(file) for file in files])
maxes = df.drop('epoch', axis=1).groupby(['file', 'trial']).max().reset_index()
means = maxes.drop('trial', axis=1).groupby('file').mean().sort_values('file').reset_index()
stds = maxes.drop('trial', axis=1).groupby('file').std().sort_values('file').reset_index()

plt.bar(np.arange(len(means)),
        means['accuracy'],
        yerr=stds['accuracy'])
plt.xticks(np.arange(len(means)), means['file'], rotation=90)
plt.savefig('mean_accs.pdf')
plt.show()
