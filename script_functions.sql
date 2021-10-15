CREATE FUNCTION agrupar_por_editora (VARCHAR(4)) RETURNS SETOF TEXT AS
$$
    DECLARE 
        linha postagem%ROWTYPE; 
        editora TEXT;
    BEGIN
        --
        SELECT INTO editora nome_editora FROM EDITORA WHERE id_editora = $1;
        --
        FOR linha IN SELECT * FROM POSTAGEM LOOP
            IF linha.id_editora = $1 THEN
                RETURN NEXT 'Editora: '|| editora || 'Postagem: '|| linha.id_postagem || ' - ' || linha.titulo;
            END IF;
        END LOOP;
    END;
$$
LANGUAGE plpgsql;

CREATE FUNCTION agrupar_por_categoria (VARCHAR(4)) RETURNS SETOF TEXT AS
$$
    DECLARE 
        linha CATEGORIA_POSTAGEM%ROWTYPE;
        post_name TEXT;
        categoria TEXT;
    BEGIN
        --
        SELECT INTO categoria nome_categoria FROM CATEGORIA WHERE id_categoria = $1;
        --
        FOR linha IN SELECT * FROM CATEGORIA_POSTAGEM LOOP
            IF linha.id_categoria = $1 THEN
                SELECT INTO post_name titulo FROM POSTAGEM WHERE postagem.id_postagem = linha.id_postagem;
                RETURN NEXT 'Categoria: '|| categoria || 'Postagem: '|| linha.id_postagem || post_name;
            END IF;
        END LOOP;
    END;
$$
LANGUAGE plpgsql;

CREATE FUNCTION agrupar_por_autor (VARCHAR(4)) RETURNS SETOF TEXT AS
$$
    DECLARE 
        linha AUTOR_POSTAGEM%ROWTYPE;
        pnome_autor TEXT;
        unome_autor TEXT;
        post_name TEXT;
    BEGIN
        --
        SELECT INTO pnome_autor primeiro_nome FROM AUTOR WHERE id_autor = $1;
        SELECT INTO unome_autor ultimo_nome FROM AUTOR WHERE id_autor = $1;
        --
        FOR linha IN SELECT * FROM AUTOR_POSTAGEM LOOP
            IF linha.id_autor = $1 THEN
                SELECT INTO post_name titulo FROM POSTAGEM WHERE postagem.id_postagem = linha.id_postagem;
                RETURN NEXT 'Autor: '|| pnome_autor || ' ' || unome_autor || 'Postagem: '|| linha.id_postagem || post_name;
            END IF;
        END LOOP;
    END;
$$
LANGUAGE plpgsql;


CREATE FUNCTION inserir_post (VARCHAR(11),VARCHAR(4),VARCHAR(4),TEXT,TEXT,TEXT,DATE,INT,TEXT) RETURNS SETOF TEXT AS
$$
    BEGIN
        IF ($1 IS NULL) OR ($2 IS NULL) OR ($3 IS NULL) OR ($4 IS NULL) OR ($5 IS NULL) OR ($6 IS NULL) OR ($7 IS NULL) OR ($8 IS NULL) THEN 
            RAISE  NOTICE  'Algum parametro não foi passado'; 
            RETURN NEXT 0; 
        ELSE
            INSERT INTO POSTAGEM VALUES ($1, $2, $3,lo_import($4), $5, $6, $7,$8,lo_import($9); 
            RAISE NOTICE 'Post efetuado com sucesso'; 
            RETURN NEXT 1; 
        END IF;
    END;
$$
LANGUAGE plpgsql;