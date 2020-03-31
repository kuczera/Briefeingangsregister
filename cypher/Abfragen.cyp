// Absenderhäufigkeiten
MATCH (e:Entity)-[r:SENDER_IN]->(l:Letter) 
RETURN e.name AS Name, count(*) AS Anzahl ORDER BY Anzahl DESC LIMIT 15;

// Häufigste Personen als Absender
MATCH (p:Person)-[r:SENDER_IN]->(l:Letter) 
RETURN DISTINCT p.name AS Name, count(p) AS Anzahl 
ORDER BY Anzahl DESC LIMIT 15;

// Häufigste Städte als Absender
MATCH (e:Stadt)-[r:SENDER_IN]->(l:Letter) 
RETURN e.name AS Ort, l.source AS Zusammenfassung LIMIT 15;

// Typen von Briefen
MATCH (l:Letter)-[:TYPE]->(t:Type)
RETURN t.type AS Typ, count(*) AS Anzahl ORDER BY Anzahl DESC LIMIT 15;

// Häufigkeit aller erwähnten Entitäten
MATCH (l:Letter)<-[m:MENTIONED_IN]-(e:Entity) 
RETURN labels(e) AS Typ, e.name AS Name, count(m) AS Anzahl 
ORDER BY Anzahl DESC;

// Häufigkeit der gemeinsam mit Albrecht erwähnten Entitäten
MATCH (e1:Person)--(l:Letter)<-[m:MENTIONED_IN]-(e2:Entity {name:'Markgraf Albrecht von Brandenburg'}) 
RETURN e1.name AS Name, count(*) AS Anzahl ORDER BY Anzahl DESC LIMIT 10;

