///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//  MONITEUR D'ENCHAINEMENT POUR LE CALCUL DE L'EQUILIBRE D'UN RESEAU D'EAU  //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////

   clear;

// ------------------------------------------
// Fonctions fournies dans le cadre du projet
// ------------------------------------------

   // Donnees du problemes

   exec('Probleme_R.sce');
   exec('Structures_N.sce');
   
   // Affichage des resultats

   exec('Visualg.sci');
   
   // Verification  des resultats

   exec('HydrauliqueP.sci');
   exec('HydrauliqueD.sci');
   exec('Verification.sci');

// ------------------------------------------
// Fonctions a ecrire dans le cadre du projet
// ------------------------------------------

   // ---> Charger les fonctions  associees a l'oracle du probleme,
   //      aux algorithmes d'optimisation et de recherche lineaire.
   //
   //      Exemple 1 - la fonction "optim" de Scilab :
   //
   //                  exec('OraclePG.sci');
   //                  exec('Optim_Scilab.sci');
   //                  titrgr = "Fonction optim de Scilab, probleme primal";
   //
   //      Exemple 2 - le gradient a pas fixe :
   //
   //                  exec('OraclePG.sci');
   //                  exec('Gradient_F.sci');
   //                  titrgr = "Gradient a pas fixe, probleme primal";
   //
   //      Exemple 3 - le gradient a pas variable :
   //
   //                  exec('OraclePG.sci');
   //                  exec('Gradient_V.sci');
   //                  exec('Wolfe.sci');
   //                  titrgr = "Gradient a pas variable, probleme primal";

   // -----> A modifier...
   // -----> A modifier...
   // -----> A modifier...

// ------------------------------
// Initialisation de l'algorithme
// ------------------------------

   // Initialisation pour le probleme primal (de dimension : n-md)
   //
   //xini = 0.1 * rand(n-md,1);

   // Initialisation pour le probleme dual (de dimension : md)
   //
   //xini = 100 + (10*rand(md,1));

   // -----> A modifier...
   // -----> A modifier...
   // -----> A modifier...

// ----------------------------
// Minimisation proprement dite
// ----------------------------

   // ---> Executer la fonction d'optimisation presente dans l'environnement
   //
   //      Exemple 1 - la fonction "optim" de Scilab :
   //
   //                  [fopt,xopt,gopt] = Optim_Scilab(OraclePG,xini);
   //
   //      Exemple 2 - le gradient a pas fixe :
   //
   //                  [fopt,xopt,gopt] = Gradient_F(OraclePG,xini);
   //
   //      Exemple 3 - le gradient a pas variable :
   //
   //                  [fopt,xopt,gopt] = Gradient_V(OraclePG,xini);

   // -----> A modifier...
   // -----> A modifier...
   // -----> A modifier...

// --------------------------
// Verification des resultats
// --------------------------

   // Verification sur le probleme primal
   //[q,z,f,p] = HydrauliqueP(xopt);

   // Verification sur le probleme dual
   //[q,z,f,p] = HydrauliqueD(xopt);

   // -----> A modifier...
   // -----> A modifier...
   // -----> A modifier...

   Verification(q,z,f,p);

//
