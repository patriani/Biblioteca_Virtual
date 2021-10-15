/*USUARIO*/
INSERT INTO USUARIO VALUES ('50366757899','ricardo','carvalho','bortolucci1@gmail.com','13241234');
INSERT INTO USUARIO VALUES ('60766757555','carlos','patriani','carlospatriani2@gmail.com','asdfasdf123');
INSERT INTO USUARIO VALUES ('10266757777','mariza','rodrigues','mariza3@gmail.com','lkhjlkjh111');

/*TELEFONE*/
INSERT INTO TELEFONE VALUES ('50366757899','1141091248','11983333825');
INSERT INTO TELEFONE VALUES ('60766757555','1141091248','11965162785');
INSERT INTO TELEFONE VALUES ('10266757777','1141091248','11916297368');

/*ENDERECO*/
INSERT INTO ENDERECO VALUES ('50366757899','SP','09810260','bairro dos casa','gabriel de souza',369,'');
INSERT INTO ENDERECO VALUES ('60766757555','SP','09810260','bairro dos casa','gabriel de souza',369,'');
INSERT INTO ENDERECO VALUES ('10266757777','SP','09810260','bairro dos casa','gabriel de souza',369,'');

/*EDITORA*/
INSERT INTO EDITORA VALUES ('1','downhill');
INSERT INTO EDITORA VALUES ('2','caminho do mar');
INSERT INTO EDITORA VALUES ('3','cidadela');

/*POSTAGEM*/
INSERT INTO POSTAGEM VALUES ('1',50366757899,1,lo_import('C:\matematica.pdf'),'matematica discreta','livro em ingles sobre matematica discreta','2021-08-06',12,lo_import('C:\capa_matematica.png'));
INSERT INTO POSTAGEM VALUES ('2',60766757555,2,lo_import('C:\Not The American Average.mp3'),'Not the American Average','musica do album X','2021-08-06',12,lo_import('C:\capa_asking.png'));
INSERT INTO POSTAGEM VALUES ('3',10266757777,3, lo_import('C:\me.mp4'),'Intro Californication','video dia dos namorados','2021-08-06',12, lo_import('C:\capa_me.png'));
INSERT INTO POSTAGEM VALUES ('4',50366757899,1,lo_import('C:\portugues.pdf'),'portugues instrumental','mini curso sobre portugues instrumental','2021-08-08',12,lo_import('C:\capa_portugues.png'));

/*CATEGORIA*/
INSERT INTO CATEGORIA VALUES('1','pdf');
INSERT INTO CATEGORIA VALUES('2','video');
INSERT INTO CATEGORIA VALUES('3','audio');

/*AUTOR*/
INSERT INTO AUTOR VALUES('1','Renato','Russo');
INSERT INTO AUTOR VALUES('2','Moacir','Franco');
INSERT INTO AUTOR VALUES('3','Diogo','Defante');

/*AUTOR_POSTAGEM*/
INSERT INTO AUTOR_POSTAGEM VALUES('1','1');
INSERT INTO AUTOR_POSTAGEM VALUES('1','2');
INSERT INTO AUTOR_POSTAGEM VALUES('2','3');
INSERT INTO AUTOR_POSTAGEM VALUES('3','2');
INSERT INTO AUTOR_POSTAGEM VALUES('3','1');

/*CATEGORIA_POSTAGEM*/
INSERT INTO CATEGORIA_POSTAGEM VALUES('1','1');
INSERT INTO CATEGORIA_POSTAGEM VALUES('2','3');
INSERT INTO CATEGORIA_POSTAGEM VALUES('3','2');
INSERT INTO CATEGORIA_POSTAGEM VALUES('4','1');