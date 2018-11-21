unit Ulac;

interface

uses GestionEcran;

var
  positionLac,positionpecher,
  positionquitter:coordonnees;// variables de position du texte et du curseur
  choix,poissons,nbpoissons:integer;// variable de choix

procedure lac(var poissons:integer);
procedure pecher(var poissons:integer);

implementation

procedure lac(var poissons:integer);
begin

 repeat

    // effacer écran
    effacerEcran;

    // dessine un cadre vert double autour de l'écran
    dessinerCadreXY(0,0,119,29,double,2,0);

    //dessine un cadre ou afficher les information
    dessinerCadreXY(0,0,119,10,double,2,0);

    // initialise la position du texte lac
    positionLac.x := 2;
    positionLac.y := 1;

    // ecriture du texte lac
    ecrireEnPosition(positionLac,'Bienvenue au lac');

    //initialisation de l'emplacement des textes
    positionpecher.x := 50;
    positionpecher.y := 15;
    positionquitter.x := 50;
    positionquitter.y := 18;

    // écriture des différent menu
    ecrireEnPosition(positionpecher,'1- Pecher du poisson');
    ecrireEnPosition(positionquitter,'2- Quitter le lac');

    // cadre du curseur
    dessinerCadreXY(114,26,118,28,simple,2,0);

    // déplace le curseur sur ça position
    deplacerCurseurXY(116,27);

    // demande la variable de choix
    readln(choix);

    // demande le choix à l'adversaire
    case choix of
    1:pecher(poissons);
    2:;
    end;

  until choix=2;

end;
procedure pecher(var poissons:integer);
begin

 // choisis un nombre entre 1 et 10
 randomize;
 nbpoissons := (random(9)+1);

 // ajoute ce nombre au nombre de poissons
 poissons := poissons+nbpoissons;

 // positionnement du curseur
 deplacerCurseurXY(6,27);

 // change la couleur d'écriture
 couleurTexte(1);

 // indique le nombre de poissons pecher
 writeln('Vous avez pecher ',nbpoissons,' poissons');

 // temps d'attente
 attendre(3000);
end;

end.

