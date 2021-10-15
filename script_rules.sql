/*USUARIO--------------------------------------------------------------------------------*/
CREATE OR REPLACE RULE up_usuario AS ON UPDATE TO USUARIO
DO( 
    INSERT INTO log_usuario(usuario,cpf,email,senha,data_hora,comando) 
    VALUES (current_user,new.cpf,NEW.email,NEW.senha,current_timestamp,'UPDATE');
);

--Quando o usuário for deletado seus dados em ENDERECO, TELEFONE e POSTAGEM também serão
--Os dados deletados são inseridos nas tabelas de log referente a cada relação alterada
CREATE OR REPLACE RULE del_usuario AS ON DELETE TO USUARIO
DO(
    DELETE FROM TELEFONE WHERE telefone.cpf_usuario = old.cpf;
    DELETE FROM ENDERECO WHERE endereco.cpf_usuario = old.cpf;
    DELETE FROM POSTAGEM WHERE postagem.cpf_usuario = old.cpf;
    INSERT INTO log_usuario(usuario,cpf,email,senha,data_hora,comando)
    VALUES (current_user,old.cpf,old.email,old.senha,current_timestamp,'DELETE');
    );


/*POSTAGEM--------------------------------------------------------------------------------*/
/*quando o usuario tiver suas linhas referentes em postagens removidas então as dependencias em AUTOR_POSTAGEM
e em CATEGORIA_POSTAGEM também serão*/
CREATE OR REPLACE RULE del_postagem AS ON DELETE TO POSTAGEM 
DO(
    INSERT INTO log_postagem(usuario,data_hora,comando,id_postagem,capa,titulo,descricao,data_publicacao,tamanho_arquivo,arquivo)
    VALUES(current_user,current_timestamp,'DELETE',old.id_postagem,old.capa,old.titulo,old.descricao,old.data_publicacao,old.tamanho_arquivo,old.arquivo);
    SELECT lo_unlink(old.capa),lo_unlink(old.arquivo); 
    DELETE FROM AUTOR_POSTAGEM WHERE AUTOR_POSTAGEM.id_postagem = old.id_postagem;
    DELETE FROM CATEGORIA_POSTAGEM WHERE id_postagem = old.id_postagem;
);
CREATE OR REPLACE RULE up_postagem AS ON UPDATE TO POSTAGEM
DO(
    INSERT INTO log_postagem(usuario,data_hora,comando,id_postagem,capa,titulo,descricao,data_publicacao,tamanho_arquivo,arquivo)
    VALUES(current_user,current_timestamp,'UPDATE',NEW.id_postagem,NEW.capa,NEW.titulo,NEW.descricao,NEW.data_publicacao,NEW.tamanho_arquivo,NEW.arquivo);
);

/*TELEFONE--------------------------------------------------------------------------------------*/
CREATE OR REPLACE RULE del_telefone_usuario AS ON DELETE TO TELEFONE 
DO(
    INSERT INTO log_telefone_usuario(usuario,data_hora,comando,cpf,residencial,movel)
    VALUES (current_user,current_timestamp,'DELETE',old.cpf_usuario,old.residencial,old.movel);
);
CREATE OR REPLACE RULE up_telefone_usuario AS ON UPDATE TO TELEFONE
DO INSERT INTO log_telefone_usuario(usuario,data_hora,comando,cpf,residencial,movel)
VALUES (current_user,current_timestamp,'UPDATE',new.cpf_usuario,new.residencial,new.movel);

/*ENDERECO--------------------------------------------------------------------------------------*/
CREATE OR REPLACE RULE del_endereco_usuario AS ON DELETE TO ENDERECO 
DO(
 INSERT INTO log_endereco_usuario(cpf_usuario,usuario,data_hora,comando,estado,cep,bairro,rua,numero,complemento)
    VALUES (old.cpf_usuario,current_user,current_timestamp,'DELETE',old.estado,old.cep,old.bairro,old.rua,old.numero,old.complemento);
);
CREATE OR REPLACE RULE up_endereco_usuario AS ON UPDATE TO ENDERECO
DO INSERT INTO log_endereco_usuario(cpf_usuario,usuario,data_hora,comando,estado,cep,bairro,rua,numero,complemento)
VALUES (old.cpf_usuario,current_user,current_timestamp,'UPDATE',new.estado,new.cep,new.bairro,new.rua,new.numero,new.complemento);

/*AUTOR_POSTAGEM-------------------------------------------------------------------*/

CREATE OR REPLACE RULE del_autor_postagem AS ON DELETE TO AUTOR_POSTAGEM 
DO(
    INSERT INTO log_autor_postagem(usuario,data_hora,comando,id_postagem,id_autor)
    VALUES (current_user,current_timestamp,'DELETE',OLD.id_postagem,OLD.id_autor);
);

CREATE OR REPLACE RULE up_autor_postagem AS ON UPDATE TO AUTOR_POSTAGEM
DO INSERT INTO log_autor_postagem(usuario,data_hora,comando,id_postagem,id_autor)
    VALUES (current_user,current_timestamp,'UPDATE',new.id_postagem,new.id_autor); 

/*CATEGORIA_POSTAGEM---------------------------------------------------------------*/

CREATE OR REPLACE RULE del_categoria_postagem AS ON DELETE TO AUTOR_POSTAGEM 
DO(
    INSERT INTO log_categoria_postagem(usuario,data_hora,comando,id_postagem,id_categoria)
    VALUES (current_user,current_timestamp,'DELETE',old.id_postagem,old.id_categoria);
);
CREATE OR REPLACE RULE up_categoria_postagem AS ON UPDATE TO AUTOR_POSTAGEM
DO INSERT INTO log_categoria_postagem(usuario,data_hora,comando,id_postagem,id_categoria)
    VALUES (current_user,current_timestamp,'UPDATE',new.id_postagem,new.id_categoria);

/*EDITORA------------------------------------------------------------------------*/

CREATE OR REPLACE RULE del_editora AS ON DELETE TO EDITORA
DO  INSERT INTO log_editora (usuario,data_hora,comando,id_editora,nome_editora)
    VALUES (current_user,current_timestamp,'DELETE',old.id_editora,old.nome_editora);

CREATE OR REPLACE RULE up_editora AS ON UPDATE TO EDITORA
DO  INSERT INTO log_editora (usuario,data_hora,comando,id_editora,nome_editora)
    VALUES (current_user,current_timestamp,'UPDATE',new.id_editora,new.nome_editora);

/*AUTOR------------------------------------------------------------------------*/

CREATE OR REPLACE RULE del_autor AS ON DELETE TO AUTOR
DO  INSERT INTO log_autor (usuario,data_hora,comando,id_autor,primeiro_nome_autor,ultimo_nome_autor)
    VALUES (current_user,current_timestamp,'DELETE',old.id_autor,old.primeiro_nome_autor,old.ultimo_nome_autor);

CREATE OR REPLACE RULE up_autor AS ON UPDATE TO AUTOR
DO  INSERT INTO log_autor (usuario,data_hora,comando,id_autor,primeiro_nome_autor,ultimo_nome_autor)
    VALUES (current_user,current_timestamp,'UPDATE',new.id_autor,new.primeiro_nome_autor,new.ultimo_nome_autor);

/*CATEGORIA------------------------------------------------------------------------*/

CREATE OR REPLACE RULE del_categoria AS ON DELETE TO AUTOR
DO  INSERT INTO log_categoria (usuario,data_hora,comando,id_autor,primeiro_nome_autor,ultimo_nome_autor)
    VALUES (current_user,current_timestamp,'DELETE',old.id_autor,old.primeiro_nome_autor,old.ultimo_nome_autor);

CREATE OR REPLACE RULE up_categoria AS ON UPDATE TO AUTOR
DO  INSERT INTO log_categoria (usuario,data_hora,comando,id_categoria,nome_categoria)
    VALUES (current_user,current_timestamp,'UPDATE',new.id_categoria,new.nome_categoria);