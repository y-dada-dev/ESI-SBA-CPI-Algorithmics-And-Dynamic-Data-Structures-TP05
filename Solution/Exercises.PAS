Program TD05;
Uses YLIB02;
   {---------------- Programme --------------------------}
   Var
      L1,Ls1:Pointeur;
      N,I,K,J,Z,W:Integer;
      S:String;
   Begin
      Randomize;
      Writeln('Tapez Ici Votre Nombre N De Element Pour Les Genere Dans Un Fichier');
      Readln(N);
      Condition(N);
      While (Condition(N)=False) Do
      Begin
        Writeln('Tapez un nemuro pour une matrice caree');
        Readln(N);
      End;
      Writeln('Tapez Ici Le Nom De Votre Fichier');
      Readln(S);
      {Creation De Une Liste Vide}
      New(L1);
      Ls1:=L1;
      If N = 0 then Ls1:=Nil
      Else If N = 1 then Begin
                           L1^.A:=0;
                           L1^.I:=0;
                           L1^.J:=0;
                           L1^.Suivant:=Nil;
                         End
      Else if N <> 1 then
      Begin
        For i:=1 to N-1 do
        Begin
          L1^.A:=0;
          L1^.I:=0;
          L1^.J:=0;
          New(L1^.Suivant);
          L1:=L1^.Suivant;
        End;
      L1^.A:=0;
      L1^.I:=0;
      L1^.J:=0;
      L1^.Suivant:=Nil;
      L1:=Ls1;
      End;
      {La Choisi De Fonction}
      For K:=1 to 30 Do
      Begin
        Writeln('Tapez Ici Le Nemuro De La Fontion ue Vous Voulez La Choisir');
        Readln(Z);
        Case Z of
           0:Afficher(Ls1);
          { 1:ResetList(Ls1);}
           2:Taille(Ls1);
           3:RemplirFichier(S,N);
           4:ChargerFichier(S,Ls1);
           5:SauverFichier(S,Ls1);
           6:Writeln(MatriceCarree(Ls1));
           7:Begin
               Writeln('Tapez Ici Le Nomre De Lignes Que Vous Voulez');
               Readln(I);
               Writeln('Tapez Ici Le Nombre De Colomns Que Vous Voulez');
               Readln(J);
               {Condition I*J=N}
               While (I*J<>N) Do
               Begin
                 Writeln('Tapez Un Nombre I et J qui Peut Etre dans une matrice carree');
                 Readln(I);
                 Readln(J);
               End;
               ElementMatriceCarree(Ls1,I,J);
             End;
           8:Begin
               Writeln('Tapez Ici Le Nomre De Lignes Que Vous Voulez Recupirer');
               Readln(I);
               Writeln('Tapez Ici Le Nombre De Colomns Que Vous Voulez Recupirer');
               Readln(J);
               {Condition I*J=N}
               While (I*J>N) Do
               Begin
                 Writeln('Tapez Un Nombre I et J qui Peut Etre dans une matrice carree');
                 Readln(I);
                 Readln(J);
               End;
               Writeln('Voici La Adress De votre Element');
               Element(Ls1,I,J);
             End;
           9:Begin
               Writeln('Tapez Ici Le Nemuro Que vous Voulez Le Inserer Dans votre Liste Matrice');
               Readln(W);
               Writeln('Tapez Ici Le Nomre De Lignes Que Vous Voulez Le Inserer Dans');
               Readln(I);
               Writeln('Tapez Ici Le Nombre De Colomns Que Vous Voulez Le Inserer Dans');
               Readln(J);
               {Condition I*J=N}
               While (I*J>N) Do
               Begin
                 Writeln('Tapez Un Nombre I et J qui Peut Etre dans une matrice carree');
                 Readln(I);
                 Readln(J);
               End;
               Ecrire(Ls1,I,J,W);
             End;
           10:Begin
                Writeln('Tapez Ici Le Nomre De Lignes Que Vous Voulez Le Recupirer Sa Valeur');
                Readln(I);
                Writeln('Tapez Ici Le Nombre De Colomns Que Vous Voulez Le Recupirer Sa Valeur');
                Readln(J);
                {Condition I*J=N}
                While (I*J>N) Do
                Begin
                  Writeln('Tapez Un Nombre I et J qui Peut Etre dans une matrice carree');
                  Readln(I);
                  Readln(J);
                End;
                Writeln(Contenu(Ls1,I,J));
              End;
        End;
      End;
   Readln;
   End.
