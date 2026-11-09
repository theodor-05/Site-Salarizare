CREATE SEQUENCE seq_users
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE TABLE app_users(
    id INT PRIMARY KEY,
    nume VARCHAR(256) NOT NULL,
    parola_hash VARCHAR2(256) NOT NULL
);

CREATE TABLE procente(
    id INT PRIMARY KEY CHECK (id = 1),
    cas_procent NUMBER(3,2) DEFAULT 0.25 NOT NULL CHECK (cas_procent BETWEEN 0 AND 1), 
    cass_procent NUMBER(3,2) DEFAULT 0.1 NOT NULL CHECK (cass_procent BETWEEN 0 AND 1),
    impozit_procent NUMBER(3,2) DEFAULT 0.1 NOT NULL CHECK (impozit_procent BETWEEN 0 AND 1),
    parola_hash VARCHAR2(256) NOT NULL
);

INSERT INTO procente(id, parola_hash)
VALUES (1, '94WsNbDdqNx/LUOC8kSQ+U2Z86dvtS7VPW4G96fod3E='); 

CREATE OR REPLACE FUNCTION get_cas_procent
    RETURN NUMBER
IS
    procent NUMBER;
BEGIN
    SELECT cas_procent INTO procent FROM procente WHERE id = 1;
    RETURN procent;
END;

CREATE OR REPLACE FUNCTION get_cass_procent
    RETURN NUMBER
IS
    procent NUMBER;
BEGIN
    SELECT cass_procent INTO procent FROM procente WHERE id = 1;
    RETURN procent;
END;

CREATE OR REPLACE FUNCTION get_impozit_procent
    RETURN NUMBER
IS
    procent NUMBER;
BEGIN
    SELECT impozit_procent INTO procent FROM procente WHERE id = 1;
    RETURN procent;
END;

CREATE SEQUENCE seq_person
MINVALUE 1
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE TABLE angajati (
    nr_crt INT PRIMARY KEY,
    nume VARCHAR(255) NOT NULL,
    prenume VARCHAR(255) NOT NULL,
    functie VARCHAR(255) NOT NULL,
    salariu_baza INT CHECK (salariu_baza > 0) NOT NULL,
    spor INT DEFAULT 0 CHECK (spor >= 0),
    premii_brute INT DEFAULT 0 CHECK (premii_brute >= 0),
    total_brut INT,
    brut_impozitabil INT,
    impozit INT,
    cas INT,
    cass INT,
    retineri INT DEFAULT 0 CHECK (retineri >= 0),
    virat_card INT
);

CREATE OR REPLACE PROCEDURE recalc_angajati (
    p_start_id IN NUMBER,
    p_end_id IN NUMBER
)
IS
    v_cas_procent NUMBER;
    v_cass_procent NUMBER;
    v_impozit_procent NUMBER;
BEGIN
    IF p_start_id > p_end_id THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid employee ID range.');
    END IF;

    SELECT
        cas_procent,
        cass_procent,
        impozit_procent
    INTO
        v_cas_procent,
        v_cass_procent,
        v_impozit_procent
    FROM procente
    WHERE id = 1;

    UPDATE angajati
    SET
        total_brut = ROUND(
            salariu_baza * (1 + spor / 100) + premii_brute, 2
        ),

        cas = ROUND(
            (salariu_baza * (1 + spor / 100) + premii_brute)
            * v_cas_procent, 2
        ),

        cass = ROUND(
            (salariu_baza * (1 + spor / 100) + premii_brute)
            * v_cass_procent, 2
        ),

        brut_impozitabil = ROUND(
            (salariu_baza * (1 + spor / 100) + premii_brute)
            * (1 - v_cas_procent - v_cass_procent), 2
        ),

        impozit = ROUND(
            (salariu_baza * (1 + spor / 100) + premii_brute)
            * (1 - v_cas_procent - v_cass_procent)
            * v_impozit_procent, 2
        ),

        virat_card = ROUND(
            (salariu_baza * (1 + spor / 100) + premii_brute)
            * (1 - v_cas_procent - v_cass_procent)
            * (1 - v_impozit_procent)
            - retineri, 2
        )

    WHERE nr_crt BETWEEN p_start_id AND p_end_id;
END;

INSERT INTO app_uers(
    nume,
    parola_hash
) VALUES (
    'Raul',
    'Siaps1an1'
);

SELECT nume, parola_hash
FROM app_users
WHERE nume='Mircea';