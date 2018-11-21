unit UPageAcceuil;

{Rôle:}

interface

uses GestionEcran,Ufonctionnalite,keyboard;

procedure pageAcceuil();


{Principe:}

implementation

procedure pageAcceuil();
var
  positionbois,positionpoissons,positionvillageois,positionprecieux,
  positionlegumes,positionferme,
  positioniut,positionforet,positiondormir,
  positionlac,positionquitter:coordonnees;// variable de position des textes et du curseur
  bois,poissons,villageois,objetsprecieux,legumes,positionCurseur: Integer;// variable de ressource
  T:TKeyEvent;// variable clavier

begin

InitKeyBoard;

    //initilisation de la valeur des ressources
    bois := 0;
    poissons := 20;
    villageois := 4;
    objetsprecieux := 0;
    legumes := 10;

repeat

      // fin partie si tout les villageois sont mort
      If villageois=0 Then
      begin
        effacerEcran;
        couleurTexte(4);
        writeln('Tout vos villageois sont mort, recommencer une partie');
        writeln('Appuyer sur entree pour quitter');
        positionCurseur := 5;
        readln();
      end
      Else
      begin
        // effacer écran
        effacerEcran;

        // initialisation du curseur
        positionCurseur := 0;

        // dessine un cadre vert double autour de l'écran
        dessinerCadreXY(0,0,119,29,double,2,0);

        //dessine un cadre ou afficher les information
        dessinerCadreXY(0,0,119,10,double,2,0);

        // initialisation de l'emplacement des ressources
        positionbois.x :=100;
        positionbois.y:=3;
        positionpoissons.x :=100;
        positionpoissons.y :=4;
        positionvillageois.x :=100;
        positionvillageois.y :=5;
        positionprecieux.x :=100;
        positionprecieux.y :=6;
        positionlegumes.x :=100;
        positionlegumes.y :=7;

        // écrire la liste des ressources
        ecrireEnPosition(positionbois,'Bois : ');
        write(bois);
        ecrireEnPosition(positionpoissons,'Poissons : ');
        write(poissons);
        ecrireEnPosition(positionvillageois,'Villageois : ');
        write(villageois);
        ecrireEnPosition(positionprecieux,'Objets Precieux :');
        write(objetsprecieux);
        ecrireEnPosition(positionlegumes,'Legumes : ');
        write(legumes);

        // initialisation de l'emplacement des batiment
        positionlac.x :=50;
        positionlac.y :=15;
        positioniut.x :=50;
        positioniut.y :=21;
        positionforet.x :=50;
        positionforet.y :=17;
        positionferme.x :=50;
        positionferme.y :=19;
        positionquitter.x :=50;
        positionquitter.y :=25;
        positiondormir.x :=50;
        positiondormir.y :=23;

        repeat

          // initialisation menu
            If (KeyEventToString(T)='Down') Then
        begin
          If positionCurseur<6 Then
          begin
            positionCurseur:=positionCurseur+1;
          end;
        end;
        If (KeyEventToString(T)='Up') Then
        begin
          If positionCurseur>0 Then
          begin
            positionCurseur:=positionCurseur-1;
          end;
        end;

           //cas position 0

          If positionCurseur=0 Then
          begin
            couleurFond(White);
            ecrireEnPosition(positionlac,'Aller au lac');
            couleurFond(Black);
          end
        Else
          begin
            ecrireEnPosition(positionlac,'Aller au lac');
          end;

          //cas position 1

          If positionCurseur=1 Then
          begin
            couleurFond(White);
            ecrireEnPosition(positionforet,'Aller a la foret');
            couleurFond(Black);
          end
        Else
          begin
            ecrireEnPosition(positionforet,'Aller a la foret');
          end;

          //cas position 2

          If positionCurseur=2 Then
          begin
            couleurFond(White);
            ecrireEnPosition(positionferme,'Aller a la ferme');
            couleurFond(Black);
          end
        Else
          begin
            ecrireEnPosition(positionferme,'Aller a la ferme');
          end;

          //cas position 3

          If positionCurseur=3 Then
          begin
            couleurFond(White);
            ecrireEnPosition(positioniut,'Aller a l"IUT');
            couleurFond(Black);
          end
        Else
          begin
            ecrireEnPosition(positioniut,'Aller a l"IUT');
          end;

          //cas position 4

          If positionCurseur=4 Then
          begin
            couleurFond(White);
            ecrireEnPosition(positiondormir,'Aller dormir');
            couleurFond(Black);
          end
        Else
          begin
            ecrireEnPosition(positiondormir,'Aller dormir');
          end;

          //cas position 5

          If positionCurseur=5 Then
          begin
            couleurFond(White);
            ecrireEnPosition(positionquitter,'Quitter la partie');
            couleurFond(Black);
          end
        Else
          begin
            ecrireEnPosition(positionquitter,'Quitter la partie');
          end;

       // fair une action après avoir taper entree
          deplacerCurseurXY(0,0);
          T:=GetKeyEvent;
          T:=TranslateKeyEvent(T);
        until (GetKeyEventChar(T)=#13) ;

        // différent lancement des procedure
        //liste des choix
         case positionCurseur of
         0:lac(poissons);
         1:foret(bois);
         2:ferme(legumes,bois);
         3:iut(objetsprecieux);
         4:dormir(poissons,legumes,bois,villageois,objetsprecieux);
         5:;// revenir à l'écran initial
         end;
       end

      until (positionCurseur=5) and (GetKeyEventChar(T)=#13);

end;

end.

