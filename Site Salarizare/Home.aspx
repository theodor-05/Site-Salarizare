<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        Acest site web este un management site pentru angajați unde pot fi efectuate următoarele lucruri:<br />
        - <strong>HOME</strong> - afişarea pe ecran a unor informaţii ajutătoare globale privind modul de operare in program;<br />
        <br />
        - <strong>Actualizare date</strong> - actualizarea informaţiei din câmpurile editabile [(NUME, SALAR_BAZA, SPOR_%) PREMII_BRUTE, RETINERI)]. Opţiunea va lua in considerare:
        <br />
        - o actualizare a datelor doar a unui anumit angajat, cautat anterior in mulţimea angajatilor (se estimeaza ajungerea in timp la peste 1000 de angajaţi!!!- necesita optiune CAUTARE);
        <br />
        - posibilitatea actualizarii datelor mai multor angajaţi, in cadrul ferestrei fiind afişate toate înregistrările iar operatorul se va deplasa (manual, cu săgeţi sau mouse) pe fiecare înregistrare in parte (spre exemplu, se acorda succesiv o prima individuala - distincta ca valoare – fiecarui angajat).
        <br />
        <br />
        - <strong>Adăugare angajaţi</strong> - permite adăugare unor noi angajaţi (atenţie la validarea datelor introduse, valori implicite, operaţii automate post adăugare, etc); Tot in cadrul acestei optiuni, pentru angajatul nou adaugat se va calcula salariul, iar interfata de adaugare ramane deschisa pentru o noua operare.
        <br />
        <br />
        - <strong>Ştergere angajaţi</strong>
        <br />
        - căutare angajat după NUME si/sau PRENUME;
        <br />
        - afişarea înregistrării găsite sau a unui mesaj in cazul in care nu este găsit acel angajat;
        <br />
        - ştergere angajat (selecţia prealabila a celui dorit daca se găsesc mai mulţi);
        <br />
        - mesaj de confirmare stergere.
        <br />
        <br />
        - <strong>Calcul salarii</strong> - realizarea calculelor propriu-zise; (OPTIONAL DACA se apelează la calcul automat declanşat de orice modificare a datelor numerice!, si mai mult ca simpla afişare –read-only- a datelor tuturor angajaţilor, permiţând o navigare/căutare a datelor unui anumit angajat)
        <br />
        - afişare in finalul calculului (daca este cazul) a unui mesaj de confirmare terminare calcule (spre exemplu pentru angajatii deja adaugati, in urma modificarii unei variabile procentuale gen CAS_%, CASS_% etc);
        <br />
        <br />
        - <strong>Stat plata</strong> - afisare pe ecran a statului de plata (REPORT), urmata de tiparire la imprimanta (statul de plata se genereaza TABELAT pentru TOTI ANGAJATII –vezi exemplul de mai jos – continand si totaluri pe coloanele TOTAL_BRUT si VIRAT_CARD) ; (posibila salvare in fişier PDF pentru fiecare luna, numele fişierului incluzând luna de calcul si alte informaţii introduse manual de utilizator -&gt;bonus);
        <br />
        <br />
        - <strong>Fluturaşi</strong> - afişare pe ecran a fluturaşilor (REPORT), urmata de tiparire la imprimanta. Se va genera un raport global pentru toţi angajaţii, opţiunea incluzând o posibila filtrare/cautare si afişare (tipărire) doar a fluturaşului unui anumit angajat căutat.
        <br />
        <br />
        - <strong>MODIF_IMPOZIT</strong> - modificare a tabelei cu procente (operaţie prevăzuta, cu o parola de protecţie a accesului la aceasta tabela a bazei de date). Dupa o asemenea modificare, se face o recalculare a salarilor (fie folosind o optiune Calcul_salarii din meniu, fie eventual o recalculare automata folosind triggere).
        <br />
        <br />
    </div>
</asp:Content>
