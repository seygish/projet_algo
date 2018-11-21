program MenuInitial;
{Rôle:}

uses GestionEcran, UPageAcceuil, Ufonctionnalite, keyboard;
var
  positionTexte1,positionTexte2:coordonnees;// Variables de travaille donnant les positions des deux choix du menu
  positionCurseur:Integer;// Variable qui détermine la position du cursuer
  T:TKeyEvent;// variable clavier

{principe:}

begin


  InitKeyBoard;

  repeat

    // dessine le logo FALLOUT
    fallout();

    // déplace le curseur sur ça position
    deplacerCurseurXY(0,0);
    positionCurseur:=0;

    attendre(500);


    repeat
    // déplacer le curseur lorsque l'utilisateur tape sur les dlèche directionnel
      If (KeyEventToString(T)='Down') Then
      begin
        If positionCurseur<1 Then
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

      // change la couleur du font en fonction du texte selectioner
      If positionCurseur=0 Then
        begin
          couleurFond(White);
          positionTexte1.x := 53;
          positionTexte1.y := 26;
          ecrireEnPosition(positionTexte1,'Commencer la partie');
          couleurFond(Black);
        end
      Else
        begin
          positionTexte1.x := 53;
          positionTexte1.y := 26;
          ecrireEnPosition(positionTexte1,'Commencer la partie');
        end;

      If positionCurseur=1 Then
      begin
        couleurFond(White);
        positionTexte2.x := 55;
        positionTexte2.y := 27;
        ecrireEnPosition(positionTexte2,'Quitter le jeu');
        couleurFond(Black);
      end
      Else
        begin
          positionTexte2.x := 55;
          positionTexte2.y := 27;
          ecrireEnPosition(positionTexte2,'Quitter le jeu');
        end;

      // fair une action après avoir taper entree
      deplacerCurseurXY(0,0);
      T:=GetKeyEvent;
      T:=TranslateKeyEvent(T);

    until (GetKeyEventChar(T)=#13) ;

    // si il tape 1 lancer la partie sinon fermer
       If positionCurseur=0 Then
         begin
           pageAcceuil();
         end;

  until (positionCurseur=1) and (GetKeyEventChar(T)=#13);
end.

