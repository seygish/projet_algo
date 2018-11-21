unit Uferme;
interface

uses GestionEcran;

var
  positionferme,positionrecolter,
  positionquitter,positionconstruire:coordonnees;// variables de position du texte et du curseur
  choix,legumes,nblegumes,bois:integer;// variable de choix
  construction:boolean;// variable pour la construction de la ferme

procedure ferme(var legumes,bois:integer);
procedure recolter(var legumes:integer);
procedure construire(var bois:integer);

implementation

procedure ferme(var legumes,bois:integer);
begin
 repeat

   // vérifie si la ferme est construite
   If construction=true Then
     begin

          // effacer écran
          effacerEcran;

          // dessine un cadre vert double autour de l'écran
          dessinerCadreXY(0,0,119,29,double,2,0);

          //dessine un cadre ou afficher les information
          dessinerCadreXY(0,0,119,10,double,2,0);

          // initialise la position du texte ferme
          positionferme.x := 2;
          positionferme.y := 1;

          // ecriture du texte ferme
          ecrireEnPosition(positionferme,'Bienvenue a la ferme');

          //initialisation de l'emplacement des textes
          positionrecolter.x := 50;
          positionrecolter.y := 15;
          positionquitter.x := 50;
          positionquitter.y := 18;

          // écriture des différent menu
          ecrireEnPosition(positionrecolter,'1- Recolter des legumes');
          ecrireEnPosition(positionquitter,'2- Quitter la ferme');

          // cadre du curseur
          dessinerCadreXY(114,26,118,28,simple,2,0);

          // déplace le curseur sur ça position
          deplacerCurseurXY(116,27);

          // demande la variable de choix
          readln(choix);

          // demande le choix à l'adversaire
          case choix of
          1:recolter(legumes);
          2:;
          end;

     end

     // si non lancer le programme de construction
     Else
       begin

          // effacer écran
          effacerEcran;

          // dessine un cadre vert double autour de l'écran
          dessinerCadreXY(0,0,119,29,double,2,0);

          //dessine un cadre ou afficher les information
          dessinerCadreXY(0,0,119,10,double,2,0);

          // initialise la position du texte ferme
          positionferme.x := 2;
          positionferme.y := 1;

          // ecriture du texte ferme
          ecrireEnPosition(positionferme,'Bienvenue a la ferme');

          //initialisation de l'emplacement des textes
          positionconstruire.x := 50;
          positionconstruire.y := 15;
          positionquitter.x := 50;
          positionquitter.y := 18;

          // écriture des différent menu
          ecrireEnPosition(positionconstruire,'1- Construire la ferme');
          ecrireEnPosition(positionquitter,'2- Quitter la ferme');

          // cadre du curseur
          dessinerCadreXY(114,26,118,28,simple,2,0);

          // déplace le curseur sur ça position
          deplacerCurseurXY(116,27);

          // demande la variable de choix
          readln(choix);

          // demande le choix à l'adversaire
          case choix of
          1:construire(bois);
          2:;
          end;
       end

 until choix=2;

end;
procedure recolter(var legumes:integer);
begin

 // choisis un nombre entre 1 et 10
 randomize;
 nblegumes := (random(9)+1);

 // ajoute ce nombre au nombre de bois
 legumes := legumes+nblegumes;

 // positionnement du curseur
 deplacerCurseurXY(6,27);

 // change la couleur d'écriture
 couleurTexte(1);

 // indique le nombre de legume recolter
 writeln('Vous avez recolter ',nblegumes,' legumes');

 // temps d'attente
 attendre(1000);
end;
procedure construire(var bois:integer);
begin

 // vérifier si assez de rssource sont diponibles
 If bois<300 Then

   begin

     // positionnement du curseur
     deplacerCurseurXY(6,27);

    // change la couleur d'écriture
    couleurTexte(4);

    // indique le nombre de legume recolter
    writeln('Vous n"avez pas assez de ressource disponible');

     // temps d'attente
     attendre(1000);

   end

 Else

   begin

      // met a jour la variable de construction
      construction := true;

      // enlève le bois
      bois := bois-300;


     // positionnement du curseur
     deplacerCurseurXY(6,27);

     // change la couleur d'écriture
     couleurTexte(4);

     // indique le nombre de legume recolter
     writeln('Ferme construite avec succes');

     // temps d'attente
     attendre(1000);

   end


end;

end.
