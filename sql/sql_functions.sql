---FUNÇÃO PARA VALIDAR O CPF

CREATE OR REPLACE FUNCTION validar_cpf()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se o CPF tem exatamente 11 caracteres ou se é composto apenas por zeros
    IF LENGTH(NEW.fun_cpf) <> 11 OR NEW.fun_cpf = '00000000000' THEN
        RAISE EXCEPTION 'CPF inválido!';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_cpf
BEFORE INSERT OR UPDATE ON tb_funcionarios
FOR EACH ROW
EXECUTE FUNCTION validar_cpf();


--PROCEDURE PERMITE ADICIONAR USUÁRIO E GARANTIR OS PRIVILÉGIOS

CREATE OR REPLACE PROCEDURE addUserAndGrantRole(userId integer,  userName text,  userPassword text,  userFunc text) 
AS 
$$	
DECLARE 
	grantRole text; 
BEGIN 

	grantRole := 'role_' || userFunc; 
	INSERT INTO tb_usuarios (userId, nome, senha, funcao ) values (userId, userName, userPassword, userFunc ); 
 	
	 -- Cria um usuário no PostgreSQL com o nome e senha fornecidos
    EXECUTE format('CREATE USER %I WITH PASSWORD %L', userName, userPassword);

    -- Concede permissões com base na função (role)
    EXECUTE format('GRANT %I TO %I', grantRole, userName);

	  IF userFunc IN ('gerente', 'admin') THEN
        EXECUTE format('ALTER USER %I CREATEROLE', userName);
    END IF;
	
END; 
$$
language plpgsql

--FUNÇÃO QUE EDITA O USUÁRIO
CREATE OR REPLACE PROCEDURE editarUsuario(
    userCodigo integer,
    userName text, 
    userCpf text, 
    userSenha text, 
    userFunc text, 
    revoke_func text
)
AS $$ 
DECLARE
    role_func text;
    role_revoke text;
BEGIN
    -- Definição das variáveis com concatenação
    role_func := 'role_' || userFunc;
    role_revoke := 'role_' || revoke_func;

    -- Atualizando informações nas tabelas
    UPDATE tb_funcionarios 
    SET fun_nome = userName, 
        fun_cpf = userCpf, 
        fun_senha = userSenha, 
        fun_funcao = userFunc 
    WHERE fun_codigo = userCodigo; 

    UPDATE tb_usuarios 
    SET nome = userName,  
        senha = userSenha, 
        funcao = userFunc 
    WHERE userId = userCodigo; 

    -- Modificando privilégios 
    IF role_func <> role_revoke THEN
        EXECUTE format('REVOKE %I FROM %I', role_revoke, userName); -- Identificadores corrigidos
        EXECUTE format('GRANT %I TO %I', role_func, userName); -- Identificadores corrigidos
    END IF;
END; 
$$ LANGUAGE plpgsql;

