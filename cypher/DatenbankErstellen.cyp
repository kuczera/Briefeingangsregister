// cypher import Nürnberger Briefregister

//MATCH (n) DETACH DELETE n;
// Briefe
// https://github.com/kuczera/Briefeingangsregister/raw/master/data/Briefe.csv
// Personen
// https://github.com/kuczera/Briefeingangsregister/raw/master/data/Personen.csv
// Verbindungen
// https://github.com/kuczera/Briefeingangsregister/raw/master/data/Verbindung.csv
// Import des Briefeingangsregisters
CREATE INDEX ON :Letter(id);
CREATE INDEX ON :Letter(receiver);
CREATE INDEX ON :Letter(sender);
CREATE INDEX ON :Letter(source);
CREATE INDEX ON :Letter(type);
CREATE INDEX ON :Letter(theme);
CREATE INDEX ON :Letter(source);
CREATE INDEX ON :Type(type);
CREATE INDEX ON :Entity(id);

// Alle Briefe importieren
LOAD CSV WITH HEADERS FROM "https://github.com/kuczera/Briefeingangsregister/raw/master/data/Briefe.csv" AS line
CREATE (l:Letter {nr:line.Nr, startyear:line.sy, startmonth:line.sm, startday:line.sd, endmonth:line.em, endday:line.ed, id:line.ID, folio:line.folio, receiver:line.Empfaenger, sender:line.Absender, type:line.type, theme:line.theme, source:line.Quelle, answer:line.Antwort, commentary:line.Kommentar, bmf:line.Bürgermeisterfrage});

// type anlegen und verknüpfen
MATCH (l:Letter) WHERE l.type IS NOT NULL
FOREACH ( j in split(l.type, "; ") |
MERGE (t:Type {type:j})
MERGE (t)<-[:TYPE]-(l)
);

// Datumsangaben zur startDate-Property zusammenfassen
match (y:Letter)
with y, apoc.number.format(toInteger(y.startyear),"0000")+"-"+apoc.number.format(toInteger(y.startmonth),"00")+"-"+apoc.number.format(toInteger(y.startday),"00") as date
SET y.startdate = date;

// ISO-Daten erstellen
MATCH (l:Letter)
SET l.isoStartDate = date(l.startdate);

// Entities importieren 4731
LOAD CSV WITH HEADERS FROM "https://github.com/kuczera/Briefeingangsregister/raw/master/data/Personen.csv" AS line
CREATE (e:Entity {id:line.ID,name:line.name, type:line.typ, role:line.role, place:line.place, state:line.state, polit:line.polit, profession:line.beruf, specific:line.spezifik, sex:line.sex, institution:line.institution, familiy:line.family});

// Verbindungen importieren
LOAD CSV WITH HEADERS FROM "https://github.com/kuczera/Briefeingangsregister/raw/master/data/Verbindungen.csv" AS line
MATCH (start:Entity {id:line.IdPerson})
MATCH (end:Letter {id:line.IdBER})
with start, end, line.Rolle AS rel
call apoc.merge.relationship(start, toUpper(rel), {}, {}, end) yield rel as dummy
return count(*);

// type-Property als zusätzliche Labels des entity-Knotens anlegen
MATCH (n:Entity)
WITH n, n.type as typ
CALL apoc.create.addLabels(n, [typ]) yield node
return count(n);
