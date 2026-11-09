Acest site web este un management site pentru angajați unde exista urmatoarele pagini:
- HOME - afişarea pe ecran a unor informaţii ajutătoare globale privind modul de operare in program;

- Actualizare date - actualizarea informaţiei din câmpurile editabile [(NUME, SALAR_BAZA, SPOR_%) PREMII_BRUTE, RETINERI)]. Opţiunea va lua in considerare:
- o actualizare a datelor doar a unui anumit angajat, cautat anterior in mulţimea angajatilor (se estimeaza ajungerea in timp la peste 1000 de angajaţi!!!- necesita optiune CAUTARE);
- posibilitatea actualizarii datelor mai multor angajaţi, in cadrul ferestrei fiind afişate toate înregistrările iar operatorul se va deplasa (manual, cu săgeţi sau mouse) pe fiecare înregistrare in parte (spre exemplu, se acorda succesiv o prima individuala - distincta ca valoare – fiecarui angajat).

- Adăugare angajaţi - permite adăugare unor noi angajaţi (atenţie la validarea datelor introduse, valori implicite, operaţii automate post adăugare, etc); Tot in cadrul acestei optiuni, pentru angajatul nou adaugat se va calcula salariul, iar interfata de adaugare ramane deschisa pentru o noua operare.

- Ştergere angajaţi
- căutare angajat după NUME si/sau PRENUME;
- afişarea înregistrării găsite sau a unui mesaj in cazul in care nu este găsit acel angajat;
- ştergere angajat (selecţia prealabila a celui dorit daca se găsesc mai mulţi);
- mesaj de confirmare stergere.

- Calcul salarii - realizarea calculelor propriu-zise; (OPTIONAL DACA se apelează la calcul automat declanşat de orice modificare a datelor numerice!, si mai mult ca simpla afişare –read-only- a datelor tuturor angajaţilor, permiţând o navigare/căutare a datelor unui anumit angajat)
- afişare in finalul calculului (daca este cazul) a unui mesaj de confirmare terminare calcule (spre exemplu pentru angajatii deja adaugati, in urma modificarii unei variabile procentuale gen CAS_%, CASS_% etc);

- Stat plata - afisare pe ecran a statului de plata (REPORT), urmata de tiparire la imprimanta (statul de plata se genereaza TABELAT pentru TOTI ANGAJATII –vezi exemplul de mai jos – continand si totaluri pe coloanele TOTAL_BRUT si VIRAT_CARD) ; (posibila salvare in fişier PDF pentru fiecare luna, numele fişierului incluzând luna de calcul si alte informaţii introduse manual de utilizator ->bonus);

- Fluturaşi - afişare pe ecran a fluturaşilor (REPORT), urmata de tiparire la imprimanta. Se va genera un raport global pentru toţi angajaţii, opţiunea incluzând o posibila filtrare/cautare si afişare (tipărire) doar a fluturaşului unui anumit angajat căutat.

- MODIF_IMPOZIT - modificare a tabelei cu procente (operaţie prevăzuta, cu o parola de protecţie a accesului la aceasta tabela a bazei de date). Dupa o asemenea modificare, se face o recalculare a salarilor (fie folosind o optiune Calcul_salarii din meniu, fie eventual o recalculare automata folosind triggere).