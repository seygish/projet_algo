unit Ufonctionnalite;
interface

uses GestionEcran,keyboard;

var
    construction:boolean;

procedure lac(var poissons:integer);// procedure d'affichage de l'écran du lac
procedure pecher(var poissons:integer);// procédure de pêche
procedure foret(var bois:integer);// procedure d'affichage de l'écran de la forêt
procedure couper(var bois:integer);// procédure de coupe de bois
procedure iut(var objetsprecieux:integer);// procedure d'affichage de l'écran de l'IUT
procedure chercher(var objetsprecieux:integer);// procedure de recherche des objets précieux
procedure ferme(var legumes,bois:integer);// procedure d'affichage de l'écran de la ferme
procedure recolter(var legumes:integer);// procedure de récolte des légumes
procedure construire(var bois:integer);// procedure de construction de la ferme
procedure dormir(var poissons,legumes,bois,villageois,objetsprecieux:integer);// procedure pour dormir
procedure combat(var villageois:integer);// procedure de combat
procedure fallout(); // procedure dessin 1ère page menu
implementation

procedure lac(var poissons:integer);
var
  positionLac,positionpecher,
  positionquitter:coordonnees;// variables de position du texte
  T:TKeyEvent;// variavle clavier
  positionCurseur:Integer;// variable position du curseur

begin

InitKeyBoard;

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
    ecrireEnPosition(positionpecher,'Pecher du poisson');
    ecrireEnPosition(positionquitter,'Quitter le lac');

    // initialisation du curseur
    positionCurseur := 0;

    repeat

      // initialisation menu
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

    //cas position 0
    If positionCurseur=0 Then
    begin
         couleurFond(White);
         ecrireEnPosition(positionpecher,'Pecher du poisson');
         couleurFond(Black);
    end
    Else
    begin
      ecrireEnPosition(positionpecher,'Pecher du poisson');
    end;

    //cas position 1
    If positionCurseur=1 Then
    begin
         couleurFond(White);
         ecrireEnPosition(positionquitter,'Quitter le lac');
         couleurFond(Black);
    end
    Else
    begin
         ecrireEnPosition(positionquitter,'Quitter le lac');
    end;
    // fair une action après avoir taper entree
    deplacerCurseurXY(0,0);
    T:=GetKeyEvent;
    T:=TranslateKeyEvent(T);
    until (GetKeyEventChar(T)=#13) ;

    // différent lancement des procedure
    //liste des choix
    case positionCurseur of
    0:pecher(poissons);
    1:;
    end;

  until (positionCurseur=1) and (GetKeyEventChar(T)=#13);

end;

procedure pecher(var poissons:integer);

var
  nbpoissons:integer;
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
 attendre(1000);
end;

 procedure foret(var bois:integer);
 var
   positionForet,positioncouper,
   positionquitter:coordonnees;// variables de position du texte et du curseur
   choix:integer;
begin

 repeat

    // effacer écran
    effacerEcran;

    // dessine un cadre vert double autour de l'écran
    dessinerCadreXY(0,0,119,29,double,2,0);

    //dessine un cadre ou afficher les information
    dessinerCadreXY(0,0,119,10,double,2,0);

    // initialise la position du texte foret
    positionforet.x := 2;
    positionforet.y := 1;

    // ecriture du texte foret
    ecrireEnPosition(positionforet,'Bienvenue a la foret');

    //initialisation de l'emplacement des textes
    positioncouper.x := 50;
    positioncouper.y := 15;
    positionquitter.x := 50;
    positionquitter.y := 18;

    // écriture des différent menu
    ecrireEnPosition(positioncouper,'1- Couper du bois');
    ecrireEnPosition(positionquitter,'2- Quitter la foret');

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
var
  nbbois:integer;
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

procedure iut(var objetsprecieux:integer);
var
  positionIUT,positionchercher,
  positionquitter:coordonnees;// variables de position du texte et du curseur
  choix:integer;

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
var
  nbobjetsprecieux:integer;

begin

 // choisis un nombre entre 1 et 10
 randomize;
 nbobjetsprecieux := (random(2));

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

procedure ferme(var legumes,bois:integer);
var

  positionferme,positionrecolter,
  positionquitter,positionconstruire:coordonnees;// variables de position du texte et du curseur
  choix:integer;

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
          ecrireEnPosition(positionconstruire,'1- Construire la ferme (300 bois)');
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
var
  nblegumes:integer;
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
 If bois<1 Then

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
      bois := bois-1;


     // positionnement du curseur
     deplacerCurseurXY(6,27);

     // change la couleur d'écriture
     couleurTexte(10);

     // indique le nombre de legume recolter
     writeln('Ferme construite avec succes');

     // temps d'attente
     attendre(1000);

   end
 end;
procedure dormir(var poissons,legumes,bois,villageois,objetsprecieux:integer);
var
  positionnuit,positionbois,positionpoissons,
  positionvillageois,positionprecieux,
  positionlegumes,positionliste,positionentree,
  positionconsome,positionpoissonsc,positionlegumesc,
  positionfaim:coordonnees;// variables de position du texte et du curseur
  rcombat:integer;//variable de random pour lancer le combat

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
          ecrireEnPosition(positionpoissonsc,'- Poissons: ');
          writeln(poissons);
          ecrireEnPosition(positionlegumesc,'- Legumes: ');
          writeln(3*villageois-poissons);
          legumes := legumes-(3*villageois-poissons);
          poissons :=0;
        end
      Else
       begin
        ecrireEnPosition(positionpoissonsc,'- Poissons: ');
        writeln(poissons);
        ecrireEnPosition(positionlegumesc,'- Legumes: ');
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

    randomize;
    rcombat := random (10);
    If rcombat = 0 Then
      begin
       combat(villageois);
      end
    Else
      begin
      end;

end;
procedure combat(var villageois:integer);
var
  positioncombat,positionjoueur,positionetranger,
  positionpoing,positionpied,positionmort:coordonnees;// variables de position du texte
  pvjoueur,pvetranger,positionCurseur:integer;
  T:TKeyEvent;// variable clavier

begin
     InitKeyBoard;

     positionCurseur := 0;
     pvjoueur := 100;
     pvetranger := 100;
    // effacer écran
    effacerEcran;

    // dessine un cadre vert double autour de l'écran
    dessinerCadreXY(0,0,119,29,double,2,0);

    // dessine un cadre ou afficher les information
    dessinerCadreXY(0,0,119,10,double,2,0);

    // initialise la position du texte
    positioncombat.x := 2;
    positioncombat.y := 1;
    positionjoueur.x :=5;
    positionjoueur.y :=13;
    positionetranger.x :=5;
    positionetranger.y :=14;
    positionpoing.x := 5;
    positionpoing.y := 16;
    positionpied.x := 5;
    positionpied.y := 17;
    positionmort.x :=5;
    positionmort.y :=20;

    repeat

    // ecriture du texte combat
    ecrireEnPosition(positioncombat,'Un etranger entre dans votre abris pendant la nuit');
    ecrireEnPosition(positionjoueur,'Votre habitant: ');
    writeln(pvjoueur,' pv  ');
    ecrireEnPosition(positionetranger,'Etranger: ');
    writeln(pvetranger,' pv  ');
    ecrireEnPosition(positionpoing,'Coup de poing');
    ecrireEnPosition(positionpied,'Coup de pied');


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
              ecrireEnPosition(positionpoing,'Coup de poing');
              couleurFond(Black);
            end
          Else
            begin
              ecrireEnPosition(positionpoing,'Coup de poing');
            end;

          If positionCurseur=1 Then
            begin
              couleurFond(White);
              ecrireEnPosition(positionpied,'Coup de pied');
              couleurFond(Black);
            end
          Else
            begin
              ecrireEnPosition(positionpied,'Coup de pied');
            end;

            // fair une action après avoir taper entree
            deplacerCurseurXY(0,0);
            T:=GetKeyEvent;
            T:=TranslateKeyEvent(T);
       until (GetKeyEventChar(T)=#13);

       case positionCurseur of
         0:
         begin
           randomize;
           pvjoueur := pvjoueur-(random(10));
           pvetranger := pvetranger-(random(15));
           If pvjoueur<=0 Then
             begin
               pvjoueur := 0;
             end
           Else
           If pvetranger<=0  Then
             begin
               pvetranger :=0;
             end;
         end;
         1:
         begin
           randomize;
           pvjoueur := pvjoueur-(random(10));
           pvetranger := pvetranger-(random(30));
           If pvjoueur<=0 Then
             begin
               pvjoueur := 0;
             end
           Else
           If pvetranger<=0  Then
             begin
               pvetranger :=0;
             end;
         end;
       end;
    until (pvjoueur=0) or (pvetranger=0) ;

    If pvjoueur=0 Then
      begin
        villageois := villageois-1;
        ecrireEnPosition(positionjoueur,'Votre habitant: ');
        writeln(pvjoueur,' pv  ');
        couleurTexte(4);
        ecrireEnPosition(positionmort,'Votre villageois est mort!');
        attendre(1500);
      end
    Else
     begin
        ecrireEnPosition(positionetranger,'Etranger: ');
        writeln(pvetranger,' pv  ');
        couleurTexte(10);
        ecrireEnPosition(positionmort,'Vorte ennemi est mort!!');
        attendre(1500);
     end
end;
procedure fallout();
var i,j:Integer;
const NB=#206;
      EX=#207;
      H=500;
begin
    // couleur texte
    couleurTexte(2);

    // EXPLOSION
    // point centre
    i := 59;
    j := 15;
    deplacerCurseurXY(i,j);
    write(EX);
    attendre(200);
    effacerEcran;

    // carée centre
    For j:=14 to 16 do
    begin
      For i:=58 to 60 do
      begin
        deplacerCurseurXY(i,j);
        write(EX);
      end;
    end;
    attendre(200);
    effacerEcran;

    // PREMIER DEPLACEMENT
    // coin haut gauche - au 2
    i:=56;
    j:=10;
    deplacerCurseurXY(i,j);
    write(EX);
    // milieu haut - en j
    i:=59;
    j:=12;
    deplacerCurseurXY(i,j);
    write(EX);
    // coin haut droite + en i - en j
    i:=63;
    j:=11;
    deplacerCurseurXY(i,j);
    write(EX);
    // milieu gauche - en i
    i:=54;
    j:=15;
    deplacerCurseurXY(i,j);
    write(EX);
    // milieu droite + en i
    i:=65;
    j:=15;
    deplacerCurseurXY(i,j);
    write(EX);
    // coin bas gauche - en i + en j
    i:=52;
    j:=19;
    deplacerCurseurXY(i,j);
    write(EX);
    // milieu bas + en j
    i:=59;
    j:=19;
    deplacerCurseurXY(i,j);
    write(EX);
    // coin bas droite + au deux
    i:=64;
    j:=19;
    deplacerCurseurXY(i,j);
    write(EX);
    // attente
    attendre(200);
    effacerEcran;

    // DEUXIEME DEPLACEMENT
    // coin haut gauche - au 2
    i:=50;
    j:=8;
    deplacerCurseurXY(i,j);
    write(EX);
    // milieu haut - en j
    i:=57;
    j:=9;
    deplacerCurseurXY(i,j);
    write(EX);
    // coin haut droite + en i - en j
    i:=64;
    j:=5;
    deplacerCurseurXY(i,j);
    write(EX);
    // milieu gauche - en i
    i:=41;
    j:=14;
    deplacerCurseurXY(i,j);
    write(EX);
    // milieu droite + en i
    i:=85;
    j:=15;
    deplacerCurseurXY(i,j);
    write(EX);
    // coin bas gauche - en i + en j
    i:=45;
    j:=20;
    deplacerCurseurXY(i,j);
    write(EX);
    // milieu bas + en j
    i:=54;
    j:=25;
    deplacerCurseurXY(i,j);
    write(EX);
    // coin bas droite + au deux
    i:=95;
    j:=20;
    deplacerCurseurXY(i,j);
    write(EX);
    // attente
    attendre(200);
    effacerEcran;

    // TOISIEME DEPLACEMENT
    // coin haut gauche - au 2
    i:=0;
    j:=0;
    deplacerCurseurXY(i,j);
    write(EX);
    // milieu haut - en j
    i:=12;
    j:=9;
    deplacerCurseurXY(i,j);
    write(EX);
    // coin haut droite + en i - en j
    i:=110;
    j:=1;
    deplacerCurseurXY(i,j);
    write(EX);
    // milieu gauche - en i
    i:=8;
    j:=15;
    deplacerCurseurXY(i,j);
    write(EX);
    // milieu droite + en i
    i:=105;
    j:=15;
    deplacerCurseurXY(i,j);
    write(EX);
    // coin bas gauche - en i + en j
    i:=17;
    j:=28;
    deplacerCurseurXY(i,j);
    write(EX);
    // milieu bas + en j
    i:=52;
    j:=29;
    deplacerCurseurXY(i,j);
    write(EX);
    // coin bas droite + au deux
    i:=119;
    j:=29;
    deplacerCurseurXY(i,j);
    write(EX);
    // attente
    attendre(200);
    effacerEcran;

    attendre(100);
    // dessine un cadre vert double autour de l'écran
    dessinerCadreXY(0,0,119,29,double,2,0);

    attendre(H);

    // LETTRE F
    // barre verticale
    For j:=7 to 8 do
    begin
      For i:=17 to 27 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    // grande barre horizontale
    For j:=8 to 19 do
    begin
      For i:=17 to 20 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    // petite barre horizontale
    For j:=12 to 13 do
    begin
      For i:=19 to 23 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;

    attendre(H);

    // LETTRE A
    // bare verticale gauche
    For j:=7 to 19 do
    begin
      For i:=30 to 33 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    //barre hozizontale haut
    For j:=7 to 8 do
    begin
      For i:=32 to 38 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    // barre verticale droite
    For j:=7 to 19 do
    begin
      For i:=38 to 41 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    // barre horizontale milieu
    For j:=11 to 12 do
    begin
      For i:=33 to 37 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;

    attendre(H);

    // LETTRE L1
    // barre verticale
    For j:=7 to 19 do
    begin
      For i:=43 to 46 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    // barre horizontale
    For j:=18 to 19 do
    begin
      For i:=46 to 53 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;

    attendre(H);

    // LETTRE L2
    // barre verticale
    For j:=7 to 19 do
    begin
      For i:=56 to 59 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    // barre horizontale
    For j:=18 to 19 do
    begin
      For i:=59 to 66 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;

    attendre(H);

    // LETTRE O
    // barre verticale gauche
    For j:=7 to 19 do
    begin
      For i:=69 to 72 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    // barre horizontale bas
    For j:=18 to 19 do
    begin
      For i:=72 to 75 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    // barre horizontale haut
    For j:=7 to 8 do
    begin
      For i:=72 to 75 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    // barre verticale droite
    For j:=7 to 19 do
    begin
      For i:=76 to 79 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;

    attendre(H);

    // LETTRE U
    // barre verticale gauche
    For j:=7 to 19 do
    begin
      For i:=82 to 85 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    // barre horizontale
    For j:=18 to 19 do
    begin
      For i:=85 to 88 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    // barre verticale droite
    For j:=7 to 19 do
    begin
      For i:=89 to 92 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;

    attendre(H);

    // LETTRE T
    // barre horizontale
    For j:=7 to 8 do
    begin
      For i:=95 to 106 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    For j:=7 to 19 do
    begin
      For i:=99 to 102 do
      begin
        deplacerCurseurXY(i,j);
        writeln(NB);
      end;
    end;
    attendre(H);
end;

end.

