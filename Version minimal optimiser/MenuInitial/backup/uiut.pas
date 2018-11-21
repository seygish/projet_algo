unit Uiut;
interface

uses GestionEcran;

var
  positionIUT,positionchercher,
  positionquitter:coordonnees;// variables de position du texte et du curseur
  choix,objetsprecieux,nbobjetsprecieux:integer;// variable de choix

procedure iut(var objetsprecieux:integer);
procedure chercher(var objetsprecieux:integer);

implementation

procedure iut(var objetsprecieux:integer);
begin

 repeat

    // effacer écran
    effacerEcran;

    // dessine un cadre vert double autour de l'écran
    dessinerCadreXY(0,0,119,29,double,2,0);

    //dessine un cadre ou afficher les information
    dessinerCadreXY(0,0,119,10,double,2,0);

    // initialise la position du texte iut
    positionIUT.x := 2;
    positionIUT.y := 1;

    // ecriture du texte iut
    ecrireEnPosition(positionIUT,'Bienvenue a IUT');

    //initialisation de l'emplacement des textes
    positionchercher.x := 50;
    positionchercher.y := 15;
    positionquitter.x := 50;
    positionquitter.y := 18;

    // écriture des différent menu
    ecrireEnPosition(positionchercher,'1- Chercher des objets precieux');
    ecrireEnPosition(positionquitter,'2- Quitter IUT');

    // cadre du curseur
    dessinerCadreXY(114,26,118,28,simple,2,0);

    // déplace le curseur sur ça position
    deplacerCurseurXY(116,27);

    // demande la variable de choix
    readln(choix);

    // demande le choix à l'adversaire
    case choix of
    1:chercher(objetsprecieux);
    2:;
    end;

  until choix=2;

end;
procedure chercher(var objetsprecieux:integer);
begin

 // choisis un nombre entre 1 et 10
 randomize;
 nbobjetsprecieux := (random(9)+1);

 // ajoute ce nombre au nombre de bois
 objetsprecieux := objetsprecieux+nbobjetsprecieux;

 // positionnement du curseur
 deplacerCurseurXY(6,27);

 // change la couleur d'écriture
 couleurTexte(1);

 // indique le nombre d'objet trouvé
 writeln('Vous avez trouver ',nbobjetsprecieux,' objets precieux');

 // temps d'attente
 attendre(1000);
end;

end.
