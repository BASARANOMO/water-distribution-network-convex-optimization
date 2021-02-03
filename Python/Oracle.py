import numpy as np
from Probleme_R import *
from Structures_N import *

qc = np.zeros((n-md, 1))


def Oracle(qc):
    # valeur du critère évalué au point qc
    term1 = q0 + B.dot(qc)
    term2 = np.multiply(np.multiply(r, term1), np.abs(term1))
    term3 = 1/3 * np.transpose(term2).dot(term1)
    term4 = Ar.dot(term1)
    term5 = np.transpose(term4).dot(pr)
    critere = term3 + term5

    # vecteur des dérivées du critère par rapport à qc
    gradient = np.transpose(B).dot(term2) + np.transpose(B).dot(np.transpose(Ar)).dot(pr)

    # matrice des dérivées secondes du critère par rapport à qc
    term6 = 2 * np.multiply(r, np.abs(term1))
    term7 = np.diag(term6.flatten())
    term8 = np.transpose(B).dot(term7)
    hessien = term8.dot(B)
    return critere, gradient, hessien


critere, gradient, hessien = Oracle(qc)

print(critere.shape)
print(gradient.shape)
print(hessien.shape)
