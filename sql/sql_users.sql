CREATE USER administrador WITH PASSWORD 'administrador'; 
GRANT role_admin to administrador; 

CREATE USER gerente WITH PASSWORD 'gerente';
GRANT role_gerente TO gerente;

CREATE USER funcionario WITH PASSWORD 'funcionario'; 
GRANT role_funcionario TO funcionario


CREATE USER fornecedor1 WITH PASSWORD 'funcionario1'; 
GRANT role_funcionario TO fornecedor1


CREATE USER fornecedor2 WITH PASSWORD 'funcionario2'; 
GRANT role_funcionario TO fornecedor2


insert into tb_usuarios(1, 'administrador', 'administrador', 'admin'); 
insert into tb_usuarios(2, 'gerente', 'gerente', 'gerente'); 
insert into tb_usuarios(3, 'funcionario', 'funcionario', 'funcionario'); 
insert into tb_usuarios(4, 'fornecedor1', 'fornecedor1', 'fornecedor'); 
insert into tb_usuarios(5, 'fornecedor2', 'fornecedor2', 'fornecedor'); 


insert into tb_funcionarios(1, 'administrador','12345678902' 'administrador', 'admin'); 
insert into tb_funcionarios(2, 'gerente','78945612393' 'gerente', 'gerente'); 
insert into tb_funcionarios(3, 'funcionario','78945612385' ,'funcionario', 'funcionario'); 