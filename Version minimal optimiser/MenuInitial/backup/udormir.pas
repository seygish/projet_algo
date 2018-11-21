unit Udormir;
interface

uses GestionEcran;

var
  positionnuit,positionbois,positionpoissons,positionvillageois,positionprecieux,
  positionlegumes,positionliste,positionentree,
  positionconsome,positionpoissonsc,positionlegumesc,
  positionfaim:coordonnees;// variables de position du texte et du curseur
  poissons,legumes:integer;// variable de choix

procedure dormir(var poissons,legumes,bois,villageois,objetsprecieux:integer);

implementation

procedure dormir(var poissons,legumes,bois,villageois,objetsprecieux:integer);
begin


    // effacer écran
    effacerEcran;

    // dessine un cadre vert double autour de l'écran
    dessinerCadreXY(0,0,119,29,double,2,0);

    //dessine un cadre ou afficher les information
    dessinerCadreXY(0,0,119,10,double,2,0);

    // initialise la position du texte nuit
    positionnuit.x := 2;
    positionnuit.y := 1;

    // ecriture du texte nuit
    ecrireEnPosition(positionnuit,'Vous avez passe la nuit');

    // initialisation des positions des textes
    positionbois.x :=5;
    positionbois.y:=17;
    positionpoissons.x :=5;
    positionpoissons.y :=18;
    positionvillageois.x :=5;
    positionvillageois.y :=19;
    positionprecieux.x :=5;
    positionprecieux.y :=20;
    positionlegumes.x :=5;
    positionlegumes.y :=21;
    positionliste.x:=5;
    positionliste.y:=15;
    positionentree.x:=5;
    positionentree.y:=23;
    positionconsome.x:=2;
    positionconsome.y:=2;
    positionpoissonsc.x :=3;
    positionpoissonsc.y :=4;
    positionlegumesc.x :=3;
    positionlegumesc.y :=5;
    positionfaim.x := 80;
    positionfaim.y := 27;

    // ecriture texte
    ecrireEnPosition(positionconsome,'Vos villageois ont consomme: ');

    // enlève des ressouce consomer par les villageois
    If poissons>=(3*villageois) Then
      begin
        ecrireEnPosition(positionpoissonsc,'- Poissons: ');
        writeln(3*villageois);
        ecrireEnPosition(positionlegumesc,'- Legumes: ');
        writeln('0');
        poissons := poissons-(3*villageois);
      end
    Else
     begin
      If (poissons<(3*villageois)) and (legumes>=(3*villageois-poissons)) Then
        begin
          ecrireEnPosition(positionpoissonsc,'poissons: ');
          writeln(poissons);
          ecrireEnPosition(positionlegumesc,'legumes: ');
          writeln(3*villageois-poissons);
          legumes := legumes-(3*villageois-poissons);
          poissons :=0;
        end
      Else
       begin
        ecrireEnPosition(positionpoissonsc,'poissons: ');
        writeln(poissons);
        ecrireEnPosition(positionlegumesc,'legumes: ');
        writeln(legumes);
        legumes :=0;
        poissons :=0;
        couleurTexte(4);
        ecrireEnPosition(positionfaim,'Vos villageois ont encore faim...');
        couleurTexte(2);

       end;
     end;

    // ecriture des textes
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
    ecrireEnPosition(positionliste,'---- Liste des ressources ----');

    ecrireEnPosition(positionentree,'Appuyer sur entree pour commencer une nouvelle journee');

    readln();

end;
end.

