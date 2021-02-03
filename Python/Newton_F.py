#!/usr/bin/python

import numpy as np

from numpy.linalg import norm
from numpy.linalg import solve
from time import process_time

#############################################################################
#                                                                           #
#         RESOLUTION D'UN PROBLEME D'OPTIMISATION SANS CONTRAINTES          #
#                                                                           #
#         Methode de Newton a pas fixe                                      #
#                                                                           #
#############################################################################

from Visualg import Visualg

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


def Newton_F(Oracle, x0):

    ##### Initialisation des variables

    iter_max = 100
    gradient_step = 1
    threshold = 0.000001

    gradient_norm_list = []
    gradient_step_list = []
    critere_list = []

    time_start = process_time()

    x = x0

    ##### Boucle sur les iterations

    for k in range(iter_max):

        # Valeur du critere et du gradient
        critere, gradient, hessien = Oracle(x)

        # Test de convergence
        gradient_norm = norm(gradient)
        if gradient_norm <= threshold:
            break

        # Direction de descente
        direction = - solve(hessien, gradient)

        # Mise a jour des variables
        x = x + (gradient_step*direction)

        # Evolution du gradient, du pas, et du critere
        gradient_norm_list.append(gradient_norm)
        gradient_step_list.append(gradient_step)
        critere_list.append(critere)

    ##### Resultats de l'optimisation

    critere_opt = critere
    gradient_opt = gradient
    x_opt = x
    time_cpu = process_time() - time_start

    print()
    print('Iteration :', k)
    print('Temps CPU :', time_cpu)
    print('Critere optimal :', critere_opt)
    print('Norme du gradient :', norm(gradient_opt))

    # Visualisation de la convergence
    Visualg(gradient_norm_list, gradient_step_list, critere_list)

    return critere_opt, gradient_opt, x_opt

Newton_F(Oracle, qc)
