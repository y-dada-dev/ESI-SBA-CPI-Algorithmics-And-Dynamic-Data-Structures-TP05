Program Test;
   Var
     F:file of char;
     S:String;
     N,I,J:Integer;
     K,S1,S2,S3:Char;
   Begin
     Randomize;
     Writeln('Tapez ici le nom de votre fichier');
     Readln(S);
     S:=S+'.Txt';
     Writeln('Tapez ici le nombre de Char que vous voulez les insrer Dans le fichier');
     Readln(N);
     Assign(F,S);
     Rewrite(F);
        For I:=1 to N do
        Begin
          K:=chr(random(26)+65);
          Write(F,K);
        End;
     Close(F);
     {-------- Affichage --------------}
     Reset(F);
     Writeln('Liste Avant traitement');
     While (Not EOF(F)) Do
     Begin
       Read(F,S1);
       Write(S1,'|');
     End;
     Close(F);
     Writeln;
     {--------- Traitement ------------}
     Reset(F);
       For I:=1 to N do
         For J:=1 to N-I do
         Begin
           Seek(F,J);
           Read(F,S1);
           Seek(F,J+1);
           Read(F,S2);
           If (S2>S1) then
                          Begin
                            S3:=S2;
                            S2:=S1;
                            S1:=S3;
                            Seek(F,J);
                            Write(F,S2);
                            Seek(F,J+1);
                            Write(F,S1);
                          End;
         End;
     Close(F);
     {Affichage}
     Reset(F);
     Writeln('Liste Apres traitement');
     While (Not EOF(F)) Do
     Begin
       Read(F,S1);
       Write(S1,'|');
     End;
     Close(F);
     Writeln;
     Erase(F);
   Readln;
   End.