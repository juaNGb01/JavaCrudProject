-- Inserindo funcionarios
INSERT INTO tb_funcionarios (fun_nome, fun_cpf, fun_senha, fun_funcao) VALUES 
('administrador', '12358794562', 'administrador', 'admin'),
('gerente', '85469852587', 'gerente', 'gerente'),
('funcionario', '45875698521', 'funcionario', 'funcionario'),
('Ana Souza', '12345678901', 'senha123', 'gerente'),
('Carlos Lima', '23456789012', 'seguranca@456', 'funcionario'),
('Mariana Oliveira', '34567890123', 'pass789', 'funcionario'),
('João Santos', '45678901234', '1234abcd', 'funcionario'),
('Fernanda Alves', '56789012345', 'Fernanda@99', 'admin'),
('Rafael Mendes', '67890123456', 'R@fael321', 'gerente'),
('Juliana Pereira', '78901234567', 'Juliana#001', 'funcionario'),
('Lucas Rocha', '89012345678', 'Lukinhas2023', 'funcionario'),
('Amanda Nunes', '90123456789', 'AmandaXYZ', 'admin'),
('Bruno Martins', '01234567890', 'Bruno$$77', 'funcionario'),
('Patrícia Dias', '11122233344', 'P@tricia22', 'gerente'),
('Felipe Gomes', '22233344455', 'FGomes987', 'admin');

-- Inserindo fornecedores
INSERT INTO tb_fornecedores (for_descricao) VALUES 
('Fornecedor de Laticínios'), 
('Distribuidora de Bebidas'),
('Fornecedor de Carnes');


-- Inserindo produtos vinculados aos fornecedores
INSERT INTO tb_produtos (pro_descricao, pro_valor, pro_quantidade, tb_fornecedor_for_codigo) VALUES 
('Leite Integral', 4.50, 200, 1),
('Refrigerante Cola 2L', 7.99, 150, 2),
('Carne Bovina Picanha', 49.90, 50, 3),
('Pão Francês', 0.80, 500, 4),
('Maçã Gala', 6.99, 100, 5),
('Detergente Neutro', 2.50, 300, 6),
('Arroz Tipo 1', 22.99, 200, 7),
('Chocolate ao Leite', 5.99, 250, 8),
('Sardinha em Lata', 4.20, 180, 9),
('Vinho Tinto Seco', 39.90, 40, 10),
('Macarrão Espaguete', 5.50, 150, 11),
('Queijo Mussarela', 34.90, 120, 12),
('Aveia em Flocos', 9.99, 90, 13),
('Orégano Desidratado', 3.50, 75, 14),
('Pizza Congelada', 19.99, 60, 15);


