## manifold_viz_test.py
## CalHacks Fall 2016
## Author: Yuan Wang

import sys
from mayavi.mlab import *
import csv
import random

noise = 0.01
def main(args):
    print("Testing")
    t = 0

    maturities = [0.25, 0.5, 1.0, 2.0, 5.0, 10.0, 30.0]
    x = []
    y = []
    z = []

    with open('testdata.csv', newline='') as csvfile:
        rdr = csv.reader(csvfile, delimiter=',', quotechar='|')
        for row in rdr:
            #print(', '.join(row))
            for i in range(len(row)):
                x.append(maturities[i])
                y.append(float(row[i]) + random.random() * 0.01)
                z.append(t)

            t = t + 1

    ## print out points to plot
    for i in range(len(x)):
        print("(" + str(x[i])+ ', ' + str(y[i]) + ', ' + str(z[i]) + ")")


if __name__=="__main__":
    main(sys.argv)