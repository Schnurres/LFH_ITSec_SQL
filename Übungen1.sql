-- Zuerst muss die richtige Datenbank gesetzt und ein Schema kreiert werden in dem die Tabellen erstellen
USE database db_student28;
CREATE SCHEMA IF NOT EXISTS exercise1;
USE SCHEMA exercise1;
---------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE

--Übung 1.1: Erstellen Sie eine Tabelle students mit den folgenden Spalten:
    student_id (Ganzzahl, Primärschlüssel)
    first_name (Zeichenkette, darf nicht NULL sein)
    last_name (Zeichenkette, darf nicht NULL sein)

-- Übung 1.2: Erstellen Sie eine Tabelle products mit den folgenden Spalten:
    product_id (Ganzzahl, Primärschlüssel)
    product_name (Zeichenkette, darf nicht NULL sein)
    price (Dezimal, Standardwert 0.00)

-- Übung 1.3: Erstellen Sie eine Tabelle customers und eine Tabelle orders. Die orders-Tabelle sollte einen Fremdschlüssel auf die customers-Tabelle haben.
Tabelle customers:

    customer_id (Ganzzahl, Primärschlüssel)
    customer_name (Zeichenkette, darf nicht NULL sein)
    contact_email (Zeichenkette, darf nicht NULL sein)

Tabelle orders:

    order_id (Ganzzahl, Primärschlüssel)
    order_date (Datum, darf nicht NULL sein)
    customer_id (Ganzzahl, Fremdschlüssel, verweist auf customers(customer_id))

-- Übung 1.4: Erstellen Sie eine Tabelle employees mit den folgenden Spalten:
    employee_id (Ganzzahl, Primärschlüssel)
    first_name (Zeichenkette, darf nicht NULL sein)
    last_name (Zeichenkette, darf nicht NULL sein)
    email (Zeichenkette, muss eindeutig sein)
    salary (Dezimal, Standardwert 0.00, darf nicht NULL sein)

-- Übung 1.5 Aufgabe: Erstellen Sie eine Tabelle courses und eine Tabelle enrollments. Die enrollments-Tabelle sollte einen zusammengesetzten Primärschlüssel haben und Fremdschlüssel auf die students- und courses-Tabellen.
Tabelle courses:

    course_id (Ganzzahl, Primärschlüssel)
    course_name (Zeichenkette, darf nicht NULL sein)

Tabelle enrollments:

    student_id (Ganzzahl, Teil des Primärschlüssels, Fremdschlüssel, verweist auf students(student_id))
    course_id (Ganzzahl, Teil des Primärschlüssels, Fremdschlüssel, verweist auf courses(course_id))
    enrollment_date (Datum, darf nicht NULL sein)

---------------------------------------------------------------------------------------------------------------------------------------------
-- ALTER

-- Übung 2.1: Fügen Sie eine Spalte birthdate zur Tabelle students hinzu.

-- Übung 2.2: Benennen Sie die Spalte contact_email in der Tabelle customers in email_address um.

-- Übung 2.3: Löschen Sie die Spalte salary aus der Tabelle employees.

-- Übung 2.4: Fügen Sie ein NOT NULL Constraint zur Spalte order_date in der Tabelle orders hinzu.

-- Übung 2.5: Benennen Sie die Tabelle courses in training_courses um.

-- Übung 2.6: Ändern Sie die Datentypen der Spalte price in der Tabelle products zu einer Zahl mit 12 Stellen vor dem Komma. Die Nachkommastellen/scale bleibt gleich.

-- Übung 2.7: Löschen Sie den Standardwert der Spalte price in der Tabelle products

-- Übung 2.8: Ändern Sie das UNIQUE Constraint der Spalte email in der Tabelle employees in ein NOT NULL Constraint.

-- Übung 2.9: Verschieben Sie die Spalte first_name in der Tabelle students hinter die Spalte last_name.

---------------------------------------------------------------------------------------------------------------------------------------------
-- SELECT

-- Zuerst müssen die richtige Datenbank und Schema ausgewählt werden
USE DATABASE raw_prod;
use schema exercise1;

-- Übung 3.1: Wählen Sie alle Daten aus der Tabelle customers.

-- Übung 3.2: Wählen Sie die eindeutigen Länder aus der Tabelle customers.

-- Übung 3.3: Wählen Sie alle Produkte aus, deren Preis über 500 liegt.

-- Übung 3.4: Wählen Sie alle Kunden aus, deren Name mit 'A' beginnt.

-- Übung 3.5: Wählen Sie alle Kunden aus, die nach dem 1. Juli 2021 beigetreten sind und deren E-Mail 'example.com' enthält.

-- Übung 3.6: Wählen Sie alle Kunden aus, die von Kunden aus den USA oder von Kunden, die erst 2022 beigetreten sind.

-- Übung 3.7: Wählen Sie alle Bestellungen aus, die zwischen dem 1. Januar 2023 und dem 31. März 2023 gemacht wurden.

-- Übung 3.8: Wählen Sie alle Produkte aus, deren category_id 1 oder 3 ist.

-- Übung 3.9: Wählen Sie alle Kunden aus, deren E-Mail-Adresse mit 'example.com' endet.

-- Übung 3.10: Wählen Sie alle Produkte aus, deren Name das Wort 'phone' enthält.

-- Übung 3.11: Wählen Sie die product_name und den doppelten Preis (price * 2) aus der Tabelle products, und nennen Sie die berechnete Spalte double_price.

-- Übung 3.12: Wählen Sie die customer_name aus der Tabelle customers, und geben Sie zusätzlich die Anzahl der Jahre seit dem Beitrittsdatum an, und nennen Sie die berechnete Spalte years_as_customer.

-- Übung 3.13: Wählen Sie den customer_name der Kunden in Großbuchstaben.

-- Übung 3.14: Wählen Sie die ersten 3 Zeichen des product_name aus der Tabelle products.

-- Übung 3.15: Erstellen sie eine Liste der Kunden mit ihrer Email und ihrem e_mail_provider (der Teil nach dem @).

-- Übung 3.16: Wählen Sie das Monat und Jahr der order_date aus der Tabelle orders.

-- Übung 3.17: Wählen Sie alle Kunden und sortieren Sie sie nach customer_name in aufsteigender Reihenfolge.

-- Übung 3.18: Wählen Sie alle Produkte und sortieren Sie sie nach price in absteigender Reihenfolge.

-- Übung 3.19: Wählen Sie die Anzahl der Kunden aus der Tabelle customers.

-- Übung 3.20: Wählen Sie den durchschnittlichen Preis der Produkte aus der Tabelle products.

-- Übung 3.21: Wählen Sie die Anzahl der Bestellungen pro customer_id aus der Tabelle orders und gruppieren Sie nach customer_id.

-- Übung 3.22: Wählen Sie die customer_id und die Anzahl der Bestellungen für Kunden, die mehr als 1 Bestellung haben.
