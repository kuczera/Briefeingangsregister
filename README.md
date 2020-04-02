# Briefeingangsregister

In diesem Repository werden Daten und cypher-Befehle zum Beitrag

Andreas Kuczera, Das Nürnberger Briefeingangsregister als Quelle für die Informationsverarbeitung in der Stadt des 15. Jahrhunderts, in: Informationsverarbeitung in der Stadt des 12.-16. Jahrhundert. Beiträge des interdisziplinären (Post-)Doc-Workshop des Trierer Zentrums für Mediävistik im November 2018, hrsg. von Eric Burkart und Vincenz Schwab

veröffentlicht.

Hinweise für die Installation von neo4j finden sie hier: https://neo4j.com/docs/operations-manual/current/installation/

Auch im [Github-Buch zu Graphentechnologien](https://kuczera.github.io/Graphentechnologien) finden Sie [Hinweise für die Installation](https://kuczera.github.io/Graphentechnologien/05_Einfuehrung_und_Theorie.html#installation-und-start) im Kapitel [Einführung und theoretische Grundlagen](https://kuczera.github.io/Graphentechnologien/05_Einfuehrung_und_Theorie.html).

Daten und Einspielskripte sind auf Github veröffentlicht unter https://github.com/kuczera/Briefeingangsregister.

Im Ordner [data](https://github.com/kuczera/Briefeingangsregister/tree/master/data) befinden sich die csv-Dateien mit den Daten des Briefeingangsregisters, nämlich [Briefe]https://github.com/kuczera/Briefeingangsregister/blob/master/data/Briefe.csv), [Personen](https://github.com/kuczera/Briefeingangsregister/blob/master/data/Personen.csv) und [Verbindungen](https://github.com/kuczera/Briefeingangsregister/blob/master/data/Verbindungen.csv).

Auf diese csv-Dateien greifen die cypher-Skripte im Ordner [cypher](https://github.com/kuczera/Briefeingangsregister/tree/master/cypher) zu. Das Skript [DatenbankErstellen.cyp](https://github.com/kuczera/Briefeingangsregister/raw/master/cypher/DatenbankErstellen.cyp) erstellt die neo4j-Datenbank und in der Datei [Abfragen.cyp](https://github.com/kuczera/Briefeingangsregister/raw/master/cypher/Abfragen.cyp) sind verschiedene Beispiel für Abfragen enthalten.

Die Daten und Einspielskripte stehen unter CC-BY-4.0-Lizenz der Akademie der Wissenschaften und der Literatur Mainz.
