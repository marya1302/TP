
   SOIENT
       Tab UN TABLEAU ( 10 ) DE ARB DE ( CHAINE , CHAINE , ENTIER , CAR ) ;
       R1 UN ARB DE ( CHAINE , CHAINE , ENTIER , CAR ) ;
       S : ( CHAINE , CHAINE , ENTIER , CAR ) ;
       R2 UN ARB DE ( ENTIER , ENTIER , CAR ) ;
       I , Cp1 , Cp2 , Result , N1 , N2 ,Choix: ENTIERS ;
       Ca : CAR ;
       Insert_arbre : ACTION ;
       Random_res : FONCTION ( CAR ) ;
       Remplir_struct : ACTION ;
       Afficher_struct : ACTION ;
       Inordre : ACTION ;
       Afficher_struct2 : ACTION ;
       New_tree : ACTION ;
       Inordreinsert : ACTION ;
       Inserer2 : ACTION ;
       Inordre2 : ACTION ;
       Trouv_pourc : ACTION ;
      
   DEBUT




         ECRIRE ( '                                  ECOLE NATIONALE SUPERIEURE D''INFORMATIQUE' ) ;
         ECRIRE ( '' ) ;
         ECRIRE ( '                                ALGORITHME ET STRUCTURES DE DONNEES DYNAMIQUES' ) ;
         ECRIRE ( '' ) ;
         ECRIRE ( '                                       TRAVAIL PRATOQUE 2 ' ) ;
         ECRIRE ( '                                       PERIODE DU COVID 19 ' ) ;
         ECRIRE ( '                                  ARBRES  BINAIRES DE RECHERCHE ' ) ;
         ECRIRE ( '                                         SECTION: B          GROUPE: 06' ) ;
         ECRIRE ( '                                     ENCADRE PAR: Dr KERMI ADEL' ) ;
         ECRIRE ( '                                            ANNEE UNIVERSITAIRE: 2019/2020' ) ;
         ECRIRE ( '                              REALISE PAR: MITICHE SARAH MARYA ET FOUZARI RYM ' ) ;

         ECRIRE ( '   ***************************************************************************************') ;
         ECRIRE ( '    *                             MENU PRINCIPAL                        *' ) ;
         ECRIRE ( '   ***************************************************************************************' ) ;
         ECRIRE ( '' ) ;
         ECRIRE ( '' ) ;
         ECRIRE ( '       ------->CHOISISSEZ L''UNE DES OPERATIONS SUIVANTES: ' ) ;
         ECRIRE ( '' ) ;

         ECRIRE ( '    01.Créer  la  structure du tableau des arbres ' ) ;
         ECRIRE ( '    02.afficher  la  structure du tableau des arbres ' ) ;
         ECRIRE ( '    03.CREER  la  NOUVELLE structure globale  ' ) ;
         ECRIRE ( '    04.afficher  la NOUVELLE  structure  ' ) ;
         ECRIRE ( '    05.CALCULER LE POURCENTAGE ' ) ;
         ECRIRE ( '    06.Quitter le programme.' ) ;
         ECRIRE ( '' ) ;

        Choix := 0 ;
       TANTQUE ( Choix <> 6 )
             ECRIRE ( '            -VEUILLEZ ENTREE VOTRE CHOIX: ' ) ;
             LIRE ( Choix ) ;
             ECRIRE ( Choix ) ;
           SI ( Choix = 1 )

              APPEL Remplir_struct ( Tab , R1 , S ) ;

           FSI;

           SI ( Choix = 2 )

              POUR I := 1 , 10
                  APPEL Afficher_struct ( I , Tab , R1 ) ;
              FINPOUR ;

           FSI;

           SI ( Choix = 3 )

                  APPEL New_tree ( Tab , I , R2 ) ;
           FSI;

           SI ( Choix = 4 )

                  APPEL Afficher_struct2 ( R2 ) ;

           FSI;

            SI ( Choix = 5 )

               Cp1 := 0 ;
               Cp2 := 0 ;
               Result := 0 ;
               ECRIRE ( '  == ' ) ;
               ECRIRE ('ENTREZ L"AGE MININMUM POUR L"INTERVALLE');
               LIRE(N1);
               ECRIRE ('ENTRZ L"AGE MAXIMUM POUR L"INTERVALLE');
               LIRE(N2);
               ECRIRE('ENTREZ LE RESULTAT RECHERCHE (D OU R)');
               LIRE(ca) ;
               ECRIRE ( ' LE POURCENTAGE CALCULÉ EST DE ' ) ;
               APPEL Trouv_pourc ( R2 , ca , N1, N2 , Cp1 , Cp2 ) ;
               Result := ( Cp2 * 100 ) / Cp1 ;
               ECRIRE ( Result ) ;

           FSI;

           SI ( ( Choix > 6 ) OU ( Choix < 1 ) )

               ECRIRE ( ' -DESOLE! Votre choix est incorrecte, veuillez essayer une autre fois.' ) ;

           FSI ;

        FINTANTQUE;

       FIN

  /***************************************************************/
   ACTION Insert_arbre ( C , S )
   SOIENT
       C , D DES ARB DE ( CHAINE , CHAINE , ENTIER , CAR ) ;
       S : ( CHAINE , CHAINE , ENTIER , CAR ) ;
      
   DEBUT
       SI C = NIL
           CREERNOEUD ( C ) ;
           AFF_INFO ( C , S ) ;
          
       SINON
           SI STRUCT ( S , 3 ) >= STRUCT ( INFO ( C ) , 3 )
               SI FD ( C ) = NIL
                   CREERNOEUD ( D ) ;
                   AFF_INFO ( D , S ) ;
                   AFF_FD ( C , D ) ;
                  
               SINON
                   APPEL Insert_arbre ( FD ( C ) , S ) ;
                  
               FSI ;
              
           FSI ;
           SI STRUCT ( S , 3 ) < STRUCT ( INFO ( C ) , 3 )
               ;
               SI FG ( C ) = NIL
                   CREERNOEUD ( D ) ;
                   AFF_INFO ( D , S ) ;
                   AFF_FG ( C , D ) ;
                  
               SINON
                   APPEL Insert_arbre ( FG ( C ) , S ) ;
                  
               FSI ;
              
           FSI ;
          
       FSI ;
      
   FIN
   FONCTION Random_res ( Stat ) : CAR
   SOIT
       Stat UN ENTIER ;
       C UN CAR ;
       N UN ENTIER ;
      
   DEBUT
       N := ALEANOMBRE ( Stat ) ;
       SI N > 150
           Random_res := 'D'
       SINON
           Random_res := 'R'
       FSI ;
      
   FIN
   ACTION Remplir_struct ( T , R , S )
   SOIENT
       S : ( CHAINE , CHAINE , ENTIER , CAR ) ;
       T UN TABLEAU ( 10 ) DE ARB DE ( CHAINE , CHAINE , ENTIER , CAR ) ;
       R UN ARB DE ( CHAINE , CHAINE , ENTIER , CAR ) ;
       N , I , M , J DES ENTIERS ;
       Bool UN BOOLEEN ;
      
   DEBUT
       N := 10 ;
       I := 1 ;
       TANTQUE ( I <= N )
           M := ALEANOMBRE(20) ;
           R := NIL ;
           POUR J := 1 , M
               INIT_STRUCT ( S , [ ALEACHAINE ( ALEANOMBRE ( 8 ) + 2 ) , ALEACHAINE ( ALEANOMBRE ( 8 ) + 2 ) ,
               ALEANOMBRE ( 100 ) , Random_res ( 301 ) ] ) ;
               APPEL Insert_arbre ( R , S ) ;
              
           FINPOUR ;
           AFF_ELEMENT ( T [ I ] , R ) ;
           I := I + 1 ;
          
       FINTANTQUE ;
      
   FIN
   ACTION Afficher_struct ( I , T , R )
   SOIENT
       I UN ENTIER ;
       T UN TABLEAU ( 10 ) DE ARB DE ( CHAINE , CHAINE , ENTIER , CAR ) ;
       R : ARB DE ( CHAINE , CHAINE , ENTIER , CAR ) ;
      
   DEBUT
       ECRIRE ( '=====================================================================' ) ;
       ECRIRE ( '             *** voici votre arbre remplis ***      ' ) ;
       ECRIRE ( '====================================================================' ) ;
       APPEL Inordre ( ELEMENT ( T [ I ] ) ) ;
      
   FIN
   ACTION Inordre ( R )
   SOIENT
       R UN ARB DE ( CHAINE , CHAINE , ENTIER , CAR ) ;
      
   DEBUT
       SI ( R <> NIL )
           APPEL Inordre ( FG ( R ) ) ;
           ECRIRE ( 'nom : ') ;
           ECRIRE ( STRUCT ( INFO ( R ) , 1 ) ) ;
           ECRIRE ( 'prenom : ' ) ;
           ECRIRE ( STRUCT ( INFO ( R ) , 2 ) ) ;
           ECRIRE ( 'age :   ' ) ;
           ECRIRE ( STRUCT ( INFO ( R ) , 3 ) ) ;
           ECRIRE ( 'resultat  :   ' ) ;
           ECRIRE ( STRUCT ( INFO ( R ) , 4 ) ) ;
           ECRIRE ( '  == ' ) ;
           APPEL Inordre ( FD ( R ) ) ;
          
       FSI ;
      
   FIN
   ACTION New_tree ( T , I , Tree )
   SOIENT
       I UN ENTIER ;
       T UN TABLEAU ( 10 ) DE ARB DE ( CHAINE , CHAINE , ENTIER , CAR ) ;
       Tree : ARB DE ( ENTIER , ENTIER , CAR ) ;
       S3 : ( ENTIER , ENTIER , CAR ) ;
      
   DEBUT
       AFF_STRUCT ( S3 , 1 , 0 ) ;
       AFF_STRUCT ( S3 , 2 , 0 ) ;
       AFF_STRUCT ( S3 , 3 , '0' ) ;
       CREERNOEUD ( Tree ) ;
       AFF_INFO ( Tree , S3 ) ;
       POUR I := 1 , 10
           APPEL Inordreinsert ( ELEMENT ( T [ I ] ) , Tree ) ;
          
       FPOUR ;
      
   FIN
   ACTION Inordreinsert ( A , B )
   SOIENT
       B , C UN ARB DE ( ENTIER , ENTIER , CAR ) ;
       A UN ARB DE ( CHAINE , CHAINE , ENTIER , CAR ) ;
      
   DEBUT
       SI A <> NIL
           APPEL Inordreinsert ( FG ( A ) , B ) ;
           SI STRUCT ( INFO ( A ) , 4 ) = 'R'
               ;
               C := FD ( B ) ;
               APPEL Inserer2 ( C , INFO ( A ) ) ;
               AFF_FD ( B , C ) ;
              
           SINON
               C := FG ( B ) ;
               APPEL Inserer2 ( C , INFO ( A ) ) ;
               AFF_FG ( B , C ) ;
              
           FSI ;
           APPEL Inordreinsert ( FD ( A ) , B ) ;
          
       FINSI ;
      
   FIN
   ACTION Inserer2 ( A , K )
   SOIENT
       A , B DES ARB DE ( ENTIER , ENTIER , CAR ) ;
       K : STRUCTURE ( CHAINE , CHAINE , ENTIER , CAR ) ;
       S : STRUCTURE ( ENTIER , ENTIER , CAR ) ;
      
   DEBUT
       SI A = NIL
           CREERNOEUD ( A ) ;
           AFF_STRUCT ( S , 1 , STRUCT ( K , 3 ) ) ;
           AFF_STRUCT ( S , 2 , 1 ) ;
           AFF_STRUCT ( S , 3 , STRUCT ( K , 4 ) ) ;
           AFF_INFO ( A , S ) ;
          
       SINON
           SI STRUCT ( K , 3 ) = STRUCT ( INFO ( A ) , 1 )
               AFF_STRUCT ( INFO ( A ) , 2 , STRUCT ( INFO ( A ) , 2 ) + 1 ) ;
              
           SINON
               SI STRUCT ( K , 3 ) > STRUCT ( INFO ( A ) , 1 )
                   SI FD ( A ) = NIL
                       CREERNOEUD ( B ) ;
                       AFF_STRUCT ( S , 1 , STRUCT ( K , 3 ) ) ;
                       AFF_STRUCT ( S , 2 , 1 ) ;
                       AFF_STRUCT ( S , 3 , STRUCT ( K , 4 ) ) ;
                       AFF_INFO ( B , S ) ;
                       AFF_FD ( A , B ) ;
                      /*lol*/
                      
                   SINON
                       APPEL Inserer2 ( FD ( A ) , K ) ;
                      
                   FSI ;
                  
               SINON
                   SI STRUCT ( K , 3 ) < STRUCT ( INFO ( A ) , 1 )
                       SI FG ( A ) = NIL
                           CREERNOEUD ( B ) ;
                           AFF_STRUCT ( S , 1 , STRUCT ( K , 3 ) ) ;
                           AFF_STRUCT ( S , 2 , 1 ) ;
                           AFF_STRUCT ( S , 3 , STRUCT ( K , 4 ) ) ;
                           AFF_INFO ( B , S ) ;
                           AFF_FG ( A , B ) ;
                          /* lol*/
                          
                       SINON
                           APPEL Inserer2 ( FG ( A ) , K ) ;
                          
                       FSI ;
                      
                   FSI ;
                  
               FINSI ;
              
           FINSI ;
          
       FINSI ;
      
   FIN
   ACTION Afficher_struct2 ( R )
   SOIENT
       R : ARB DE ( ENTIER , ENTIER , CAR ) ;
      
   DEBUT
       ECRIRE ( '=====================================================================' ) ;
       ECRIRE ( '             *** voici votre 2 EME ARBRE***      ' ) ;
       ECRIRE ( '====================================================================' ) ;
       APPEL Inordre2 ( R ) ;
      
   FIN
   ACTION Inordre2 ( R )
   SOIENT
       R UN ARB DE ( ENTIER , ENTIER , CAR ) ;
      
   DEBUT
       SI ( R <> NIL )
           APPEL Inordre2 ( FG ( R ) ) ;
           ECRIRE ( 'AGE : ' ) ;
           ECRIRE ( STRUCT ( INFO ( R ) , 1 ) ) ;
           ECRIRE ( 'OCCURENCE : ' ) ;
           ECRIRE ( STRUCT ( INFO ( R ) , 2 ) ) ;
           ECRIRE ( 'RESULTAT :   ' ) ;
           ECRIRE ( STRUCT ( INFO ( R ) , 3 ) ) ;
           ECRIRE ( '  == ' ) ;
           APPEL Inordre2 ( FD ( R ) ) ;
          
       FSI ;
      
   FIN
   ACTION Trouv_pourc ( R , Ca , N1 , N2 , Cpt1 , Cpt2 )
   SOIENT
       R UN ARB DE ( ENTIER , ENTIER , CAR ) ;
       Cpt1 , N1 , N2 , Cpt2 DES ENTIERS ;
       Ca : CAR ;
      
   DEBUT
       SI ( R <> NIL )
           APPEL Trouv_pourc ( FG ( R ) , Ca , N1 , N2 , Cpt1 , Cpt2 ) ;
           Cpt1 := Cpt1 + STRUCT ( INFO ( R ) , 2 ) ;
           SI ( ( STRUCT ( INFO ( R ) , 1 ) > N1 ) ET ( STRUCT ( INFO ( R ) , 1 ) < N2 ) )
               SI STRUCT ( INFO ( R ) , 3 ) = Ca
                   Cpt2 := Cpt2 + STRUCT ( INFO ( R ) , 2 ) ;
                  
               FSI ;
              
           FSI ;
           APPEL Trouv_pourc ( FD ( R ) , Ca , N1 , N2 , Cpt1 , Cpt2 ) ;
          
       FSI ;
      /*  POURC:=(CPT2*111100)/CPT1; */
      
   FIN
