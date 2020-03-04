Program TD05;
   Type
      TxTI=File of Integer;
      Pointeur=^List;
      List=Record
              A:Integer;
              I,J:Integer;
              Suivant:Pointeur;
           End;
   {------------------------------------------}
    Function Condition (N:Integer):Boolean;
       Var
         K:Integer;
         B:Boolean;
       Begin
         B:=False;
         For K:=1 to N Do
          If K*K=N then B:=True;
         Condition:=B;
       End;
   {------------------------------------------}
    Procedure Afficher (Ls:Pointeur);
       Begin
         If ( Ls = Nil ) then Writeln('Nil')
         Else if ( Ls <> Nil ) then
         Begin
           While ( Ls<>Nil ) do
           Begin
             Write(Ls^.A,' | ');
             Ls:=Ls^.Suivant;
           End;
         End;
         Writeln;
       End;
   {------------------------------------------}
   Function Taille (Ls:Pointeur):Integer ;
       Var
         I:Integer;
         L:Pointeur;
       Begin
         I:=1;
         L:=LS;
         If ( L = Nil ) then Taille:=0
         Else if ( L <> Nil ) then
                              Begin
                                While ( L^.Suivant <> Nil ) Do
                                Begin
                                  I:=I+1;
                                  L:=L^.Suivant;
                                End;
                                Taille:=I;
                              End;
       End;
   {-------------- EXO 01 -----------------}
   Procedure RemplirFichier(Nom:String;N:Integer);
      Var
        F:TxTI;
        S:String;
        I,T:Integer;
      Begin
        S:=Nom+'.TxT';
        Assign (F,S);
        Rewrite(F);
        For i:=1 to N do
        Begin
          T:=Random(100);
          Write(F,T);
        End;
        Close(F);
      End;
   {-------------- EXO 02 -----------------}
   Function ChargerFichier(Nom:String;Var L1:Pointeur):Integer;
      Var
        S:String;
        Ls1:Pointeur;
        F:File of Integer;
        A,N,I:Integer;
      Begin
        Ls1:=L1;
        N:=1;
        S:=Nom+'.TxT';
        Assign(F,S);
        Reset(F);
        While (Not EOF(F)) Do
        Begin
          Read(F,A);
          L1^.A:=A;
          L1:=L1^.Suivant;
        End;
        Close(F);
        L1:=Ls1;
        ChargerFichier:=Taille(L1);
      End;
   {-------------- EXO 00 -----------------}
   Procedure SauverFichier(Nom:String;Var P:Pointeur);
      Var
        L1:Pointeur;
        T:File Of Integer;
        S:String;
        I,N,A:Integer;
      Begin
        L1:=P;
        S:=Nom+'.TxT';
        Assign(T,S);
        N:=Taille(L1);
        Reset(T);
        For i:=1 to N do
        Begin
          A:=L1^.A;
          Write(T,A);
          L1:=L1^.Suivant;
        End;
        Close(T);
      End;
   {-------------- EXO 00 -----------------}
   Function MatriceCarree(P:Pointeur):Boolean;
      Var
        I,N,X:Integer;
        T:Boolean;
      Begin
        T:=False;
        N:=Taille(P);
        For I:=1 to 1000 Do
        Begin
          X:=I*I;
          If N=X then T:=True;
          X:=0;
        End;
        MatriceCarree:=T;
      End;
   {-------------- EXO 00 -----------------}
   Procedure ElementMatriceCarree(Var P:Pointeur; Var I,J:Integer);
      Var
        L1:Pointeur;
        N,M:Integer;
      Begin
        L1:=P;
        If (MatriceCarree(P)=False) then Writeln('Votre Liste Ne Est Pas Une Matrice Carree')
        Else if (MatriceCarree(P)=True) and ((I*J)<>Taille(P)) then Writeln('Votre Division I et J Ne Est Pas Correct')
        Else if (MatriceCarree(P)=True) and ((I*J)=Taille(P)) then
        Begin
          For N:=1 To I Do
            For M:=1 to J Do
            Begin
              L1^.I:=N;
              L1^.J:=M;
              L1:=L1^.Suivant;
            End;
        End;
      End;
   {-------------- EXO 00 -----------------}
   Function Element (Var P:Pointeur;I,J:Integer):Pointeur;
      Var
        L1,L:Pointeur;
        K:Integer;
      Begin
        L1:=P;
        L:=Nil;
        if ((I*J)>Taille(P)) then Writeln('Cette Element Ne Existe Pas La Liste De Matrice')
        Else If ((I*J)<=Taille(P)) then
        Begin
          For K:=1 to Taille(P) Do
          Begin
            If (L1^.I=I) and (L1^.J=J) then L:=L1;
            L1:=L1^.Suivant;
          End;
        End;
        Element:=L;
      End;
   {-------------- EXO 00 -----------------}
   Procedure  Ecrire (Var P:Pointeur;I,J,Val:Integer);
      Var
        K:Integer;
        L1:Pointeur;
      Begin
        L1:=P;
        if ((I*J)>Taille(P)) then Writeln('Cette Element Ne Existe Pas La Liste De Matrice')
        Else If ((I*J)<=Taille(P)) then
        Begin
          For K:=1 to Taille(P) Do
          Begin
            If (L1^.I=I) and (L1^.J=J) then L1^.A:=Val;
            L1:=L1^.Suivant;
          End;
        End;
      End;
   {-------------- EXO 00 -----------------}
   Function Contenu(Var P:Pointeur;I,J:Integer):Integer;
      Var
        L1:Pointeur;
        K:Integer;
      Begin
        L1:=P;
        if ((I*J)>Taille(P)) then Writeln('Cette Element Ne Existe Pas La Liste De Matrice')
        Else If ((I*J)<=Taille(P)) then
        Begin
          For K:=1 to Taille(P) Do
          Begin
            If (L1^.I=I) and (L1^.J=J) then Contenu:=L1^.A;
            L1:=L1^.Suivant;
          End;
        End;
      End;
   {---------------- Programme --------------------------}
   Var
      L1,Ls1:Pointeur;
      N,I,J:Integer;
      S:String;
   Begin
      Randomize;
      Writeln('La Creation D un Fichier Coresspond Au Nombre D une Matrice Carree');
      Writeln('Tapez ici le N pour Emplir Votre Fichier Avec');
      Readln(N);
      {Condition N = I*I}
      While Condition(N)=False Do
      Begin
        Writeln('Tapez Un Nemuro qui Coresspond a une matrice caree');
        Readln(N);
      End;
      {-----------------}
      Writeln('Tapez Ici Le Nom De Votre Fichier Pour Le Cree');
      Readln(S);
      RemplirFichier(S,N);
      {Creation De Liste Vide}
      New(L1);
      Ls1:=L1;
      If N = 0 then Ls1:=Nil
      Else If N = 1 then Begin
                     L1^.A:=0;
                     L1^.Suivant:=Nil;
                   End
      Else if N <> 1 then
      Begin
       For i:=1 to N-1 do
       Begin
         L1^.A:=0;
         New(L1^.Suivant);
         L1:=L1^.Suivant;
       End;
      L1^.A:=0;
      L1^.Suivant:=Nil;
      L1:=Ls1;
      End;
      {Chargement De Txt a La Liste}
      ChargerFichier(S,Ls1);
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
      {-----------------}
      ElementMatriceCarree(Ls1,I,J);
      Writeln('Le Nombre De Element De Votre Liste Est : ',ChargerFichier(S,Ls1));
      Writeln('Le Affichage De La Liste');
      Afficher(Ls1);
      {Reset De La Liste}
      For i:=0 to Taille(Ls1) Do
      Begin
        Ls1^.A:=0;
        Ls1:=Ls1^.Suivant;
      End;
      Ls1:=L1;
      Writeln('Le Affichage De La Liste');
      Afficher(Ls1);
      {Save Matrice In File}
      SauverFichier(S,Ls1);
   Readln;
   End.