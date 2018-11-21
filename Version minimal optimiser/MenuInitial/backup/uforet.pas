unit Uforet;
interface

uses GestionEcran;

var
  positionForet,positioncouper,
  positionquitter:coordonnees;// variables de position du texte et du curseur
  choix,bois,nbbois:integer;// variable de choix

procedure foret(var bois:integer);
procedure couper(var bois:integer);

implementation

procedure foret(var bois:integer);
begin

 repeat

    // effacer écran
    effacerEcran;

    // dessine un cadre vert double autour de l'écran
    dessinerCadreXY(0,0,119,29,double,2,0);

    //dessine un cadre ou afficher les information
    dessinerCadreXY(0,0,119,10,double,2,0);

    // initialise la position du texte lac
    positionforet.x := 2;
    positionforet.y := 1;

    // ecriture du texte lac
    ecrireEnPosition(positionforet,'Bienvenue a la foret');

    //initialisation de l'emplacement des textes
    positioncouper.x := 50;
    positioncouper.y := 15;
    positionquitter.x := 50;
    positionquitter.y := 18;

    // écriture des différent menu
    ecrireEnPosition(positioncouper,'1- Couper du bois');
    ecrireEnPosition(positionquitter,'2- Quitter le lac');

    // cadre du curseur
    dessinerCadreXY(114,26,118,28,simple,2,0);

    // déplace le curseur sur ça position
    deplacerCurseurXY(116,27);

    // demande la variable de choix
    readln(choix);

    // demande le choix à l'adversaire
    case choix of
    1:couper(bois);
    2:;
    end;

  until choix=2;

end;
procedure couper(var bois:integer);
begin

 // choisis un nombre entre 1 et 10
 randomize;
 nbbois := (random(9)+1);

 // ajoute ce nombre au nombre de bois
 bois := bois+nbbois;

 // positionnement du curseur
 deplacerCurseurXY(6,27);

 // change la couleur d'écriture
 couleurTexte(1);

 // indique le nombre de poissons pecher
 writeln('Vous avez couper ',nbbois,' buche de bois');

 // temps d'attente
 attendre(1000);
end;

end.

