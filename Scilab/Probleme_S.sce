///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//        DONNEES ASSOCIEES A LA RESOLUTION DES EQUATIONS D'UN RESEAU        //
//                                                                           //
//        Probleme_S : reseau singulier (debits nuls dans les tuyaux)        //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
// On donne les dimensions du reseau (nombres d'arcs, de noeuds, de reservoirs
// le constituant). On donne aussi deux vecteurs, contenant respectivement les
// numeros des noeuds initiaux et finaux des arcs du reseau. On suppose que le
// reseau comporte au moins un reservoir, que les reservoirs sont associes aux
// premiers  noeuds du graphe, et que la numerotation des noeuds du graphe est
// contigue (de 1 a m). On donne pour finir le vecteur de resistances des arcs
// du reseau, le vecteur des pressions des reservoirs ainsi que le vecteur des
// demandes aux noeuds autres que ceux correspondant aux reservoirs.
//
// Le reseau decrit ici est irrealiste dans la mesure ou les debits pertes de
// charge a l'equilibre sont nulles.
//
// On peut des a present noter que la numerotation implicite des arcs que l'on
// obtient ne doit pas etre  quelconque : on suppose en effet que les premiers
// arcs dans cette numerotation forment un arbre, ce qui fournit facilement le
// plus grand bloc carre inversible de la matrice d'incidence noeuds-arcs.
//
// On donne (de maniere facultative) les coordonnees des noeuds du reseau afin
// de pouvoir representer graphiquement le reseau. En Scilab, cette etape sera
// effectuee a l'aide de Metanet.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
// Variables du probleme
// ---------------------
//
// nom  : nom du reseau
//
// n    : nombre total d'arcs
// m    : nombre total de noeuds
// mr   : nombre de noeuds de type reservoir
// md   : nombre de noeuds de type demande (= m-mr)
//
// orig : vecteur des numeros des noeuds initiaux des arcs : M(1,n)
// dest : vecteur des numeros des noeuds finaux   des arcs : M(1,n)
// absn : vecteur des abscisses des noeuds                 : M(1,m)
// ordn : vecteur des ordonnees des noeuds                 : M(1,m)
//
// r    : vecteur des resistances des arcs                 : M(n,1)
// pr   : vecteur des pressions des noeuds reservoirs      : M(mr,1)
// fd   : vecteur des flux des noeuds de demande           : M(md,1)
//
///////////////////////////////////////////////////////////////////////////////


// -------------
// Nom du reseau
// -------------

   nom = 'Irrealiste';

// --------------------
// Dimensions du reseau
// --------------------

   n  = 4;
   m  = 4;
   mr = 2;

   md = m - mr;

// ----------------------------------------------
// Numeros des noeuds initiaux et finaux des arcs
// ----------------------------------------------

   orig = [ 1  2  3  1 ];
   dest = [ 3  4  4  2 ];

// ----------------------
// Coordonnees des noeuds
// ----------------------

   absn = [10 20 10 20 ];
   ordn = [20 20 10 10 ];

// --------------------
// Resistances des arcs
// --------------------

   r = [ 100 100  10  10 ]';

// ---------------------------------------
// Pressions au pied des reservoirs (en m)
// ---------------------------------------

   pr = [ 100 100 ]';

// ------------------------------------
// Flux aux noeuds de demande (en m3/s)
// ------------------------------------

   fd = [ 0.0 0.0 ]';
