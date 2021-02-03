function [fopt,xopt,gopt]=Newton_F(Oracle,xini)


///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//         RESOLUTION D'UN PROBLEME D'OPTIMISATION SANS CONTRAINTES          //
//                                                                           //
//         Methode de Newton avec pas unite                                  //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
//
// On rappelle que l'oracle demande la presence d'un certain nombre
// de tableaux et de variables dans l'environnement Scilab.
//
///////////////////////////////////////////////////////////////////////////////


// ------------------------
// Parametres de la methode
// ------------------------

   titre = "Parametres de la methode de Newton";
   labels = ["Nombre maximal d iterations";...
             "Longueur initiale du pas";...
             "Seuil de convergence sur  G"];
   typ = list("vec",1,"vec",1,"vec",1);
   default = ["25";"1.0";"0.000001"];
   [ok,iter,alphai,tol] = getvalue(titre,labels,typ,default);

// ----------------------------
// Initialisation des variables
// ----------------------------

   x = xini;
   logG = [];
   logP = [];
   Cout = [];

   timer();

// -------------------------
// Boucle sur les iterations
// -------------------------

   kstar = iter;
   for k = 1:iter

//    - valeur du critere, du gradient et du hessien

      ind = 7;
      [F,G,H] = Oracle(x,ind);

//    - test de convergence

      if norm(G) <= tol then
         kstar = k;
         break
      end

//    - test de l'inversibilite du hessien

      if rcond(H) <= 0.000001 then
        printf('Iteration %i , matrice hessienne singuliere !\n',k)
        H = eye(H);
      end

//    - evolution de la norme du gradient

      logG = [ logG ; log10(norm(G)) ];

//    - evolution du critere

      Cout = [ Cout ; F ];

//    - direction de descente

      D = - H \ G;

//    - test de la direction de descente

      coe = D' * G
      if coe >= 0 then
        printf('Iteration %i , direction de montee !\n',k)
      end

//    - valeur du pas

      alphan = alphai;

//    - evolution du pas de gradient

      logP = [ logP ; log10(alphan) ];

//    - mise a jour des variables

      x = x + (alphan*D);

   end

// ---------------------------
// Resultats de l'optimisation
// ---------------------------

   fopt = F;
   xopt = x;
   gopt = G;

   tcpu = timer();

   cvge = ['Iteration         : ' string(kstar);...
           'Temps CPU         : ' string(tcpu);...
           'Critere optimal   : ' string(fopt);...
           'Norme du gradient : ' string(norm(gopt))];
   disp('Fin de la methode de Newton')
   disp(cvge)

// - visualisation de la convergence

   Visualg(logG,logP,Cout);

endfunction
