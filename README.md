# Projekt Web-Entwicklung
Dieses Projekt entstand im Rahmen meines Studiums der Angewandten Informatik an der Fachhochschule der Wirtschaft in bergisch Gladbach (FHDW-BG).

## Inhaltsverzeichnis
1. Zusammenfassung
2. Einleitung
    - Ist-Zustand
    - die Idee
    - Ziele / Nutzen
3. Praxis
    - Umsetzung
    - Retroperspektive: Umsetzung
    - Zusätzliche Erweiterungen
4. Rekapitulation und Ausblick

## 1. Zusammenfassung
> [!NOTE] Dieses Projekt stellt die Erweiterung [dieses bestehenden Projekts](https://github.com/csoltenborn/web_entwicklung_BFAX422A/tree/master) dar.
Meine hier entwickelte Erweiterung entstand im Rahmen meines Studiums der _Angewandten Informatik_ an der FHDW und umfasst:
1. Serverseitig:
    - die Überarbeitung der __Server-API__ um den austausch ganzer Konversationen zu ermöglichen.
2. Clientseitig: 
    - eine umfangreiche Neugestaltung und den Ausbau der __Client-Benutzeroberfläche__ um notwendige Komponenten und Elemente, um die Konversation angemessen visualisieren zu können.
    - die Erweiterung der Geschäftslogik des Clients, um die __Konversationen__ (bestehend aus vielen Nachrichten - anstatt einzelner Nachrichten) __verarbeiten__ zu können.
    - die Erweiterung der Client-Benutzeroberfläche um eine aktuelle __Kostenanzeige__, eine __Statuszeile__, einen __Speicher-Button__ sowie die Möglichkeit, die __Konversation zurückzusetzen__.
    - die Erweiterung des Clients um eine grundlegende __Fehlerbehandlung__ und ein simples __Speicher-Konzept__, um die ausgetauschten Nachrichten mit ChatGPT zu speichern und wieder zu laden.


## 2. Einleitung
Im Rahmen des Moduls __Projekt Web-Entwicklung__ des Studiengangs __Angewandte Informatik__ an der FHDW, entstand dieses Softwareprojekt. Das Ziel dieses Projekts ist es, eine (zur Einarbeitung und Orientierung) vorgebenene Applikation zu erweitern. Es handelt sich dabei um [dieses Projekt](https://github.com/csoltenborn/web_entwicklung_BFAX422A/tree/master) von 
@github/csoltenborn. Die Aufgabe bestand zudem aus der hier angefertigten Dokumentation dieser Erweiterung.  

### 2.1 Ist-Zustand
Die Vorgabe enthält zwei Kernkomponenten. 
Eine Client-Anwendung gebaut mithilfe des Flutter-Frameworks und eine Server Anwendung, geschrieben in Dart. 
Diese zwei Komponenten ermöglichen es, durch die Bereitstellung grundlegender Architektur, mit dem Large Language Model ChatGPT von OpenAI in der Version 3.5 Nachrichten bidirektional auszutauschen. D.h. dem Nutzer der Client-Anwendung ist es möglich eine Nachricht an die API von OpenAI zu senden und eine entsprechende Antwort zu empfangen. Um die Architektur einfacher zu gestalten, wurde dieses [package](https://pub.dev/packages/chat_gpt_sdk) eingebunden.

### 2.2 die Idee

### 2.3 Ziele / Nutzen

## 3. Die Erweiterung

### 3.1 Umsetzung

### 3.2 Retroperspektive: Umsetzung

### 3.3 Zusätzliche Erweiterungen

## 4. Rekapitulation und Ausblick