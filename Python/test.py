import numpy as np
from Probleme_R import *
from Structures_N import *
from Oracle import *
from Gradient_F import *

qc = np.zeros((n-md, 1))
Gradient_F(Oracle, qc)
