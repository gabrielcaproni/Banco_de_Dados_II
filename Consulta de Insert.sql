SELECT * FROM editora;

BEGIN;
	INSERT INTO editora VALUES(NULL, "Panini"); 
	INSERT INTO editora VALUES(NULL,"Saraiva"); 
	INSERT INTO editora VALUES(NULL,"Jesus Cop");
COMMIT;

SELECT * FROM editora;