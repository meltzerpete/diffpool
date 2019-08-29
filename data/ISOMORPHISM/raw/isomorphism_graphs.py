import sys
sys.path.append('/home/pete/Dropbox/PycharmProjects/graph-classifier-jan-2019/analysis')
from experiment2 import generate
import networkx as nx
import pandas as pd
import numpy as np

num_nodes_per_graph = 50
num_graph_classes = 5
num_node_classes = 2
num_graphs_per_class = 100

A, X, Y = generate.get_tensors(num_nodes_per_graph,
                               num_graph_classes,
                               num_node_classes,
                               num_graphs_per_class)

G = [nx.from_numpy_array(a) for a in A]

X = [pd.DataFrame(x) for x in X]

for g, x in zip(G, X):
    nx.set_node_attributes(g, x)

out = nx.disjoint_union_all(G)
edges = [[s+1, t+1] for s, t, w in nx.to_edgelist(out)]
# nx.write_edgelist(out, 'ISOMORPHISM_A.txt', delimiter=', ', data=False)
np.savetxt('ISOMORPHISM_A.txt', edges, fmt='%d', delimiter=', ')

graph_ind = []
for n in range(500):
    for i in range(50):
        graph_ind.append(n+1)

np.savetxt('ISOMORPHISM_graph_indicator.txt', graph_ind, fmt='%d')
np.savetxt('ISOMORPHISM_graph_labels.txt', Y.flatten(), fmt='%d')

node_labels = pd.concat(X).idxmax(axis=1)
np.savetxt('ISOMORPHISM_node_labels.txt', node_labels.values, fmt='%d')