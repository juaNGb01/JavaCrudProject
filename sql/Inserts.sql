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
('Fornecedor de Carnes'),
('Padaria e Confeitaria'),
('Distribuidora de Hortifruti'),
('Atacado de Higiene e Limpeza'),
('Fornecedor de Grãos'),
('Indústria de Doces'),
('Fábrica de Enlatados'),
('Importadora de Vinhos'),
('Fábrica de Massas'),
('Distribuidor de Frios'),
('Fornecedor de Cereais'),
('Distribuidor de Temperos'),
('Fábrica de Congelados');

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

-- Inserindo vendas associadas a funcionários
INSERT INTO tb_vendas (ven_horario, ven_valor_total, tb_funcionarios_fun_codigo) VALUES 
('2024-02-11 10:30:00', 50.30, 1),
('2024-02-11 11:00:00', 120.99, 2),
('2024-02-11 12:15:00', 200.75, 3),
('2024-02-11 13:30:00', 30.50, 4),
('2024-02-11 14:45:00', 60.20, 5),
('2024-02-11 15:10:00', 89.99, 6),
('2024-02-11 16:25:00', 150.45, 7),
('2024-02-11 17:40:00', 215.30, 8),
('2024-02-11 18:55:00', 175.99, 9),
('2024-02-11 19:05:00', 45.60, 10),
('2024-02-11 19:20:00', 98.75, 11),
('2024-02-11 20:00:00', 130.20, 12),
('2024-02-11 20:30:00', 67.40, 1),
('2024-02-11 21:10:00', 185.75, 2),
('2024-02-11 21:45:00', 250.99, 3);

-- Inserindo itens vendidos associados a produtos e vendas
INSERT INTO tb_itens (ite_quantidade, ite_valor_parcial, tb_produtos_pro_codigo, tb_vendas_ven_codigo) VALUES 
(2, 9.00, 1, 1),
(1, 7.99, 2, 2),
(3, 149.70, 3, 3),
(5, 4.00, 4, 4),
(2, 13.98, 5, 5),
(4, 10.00, 6, 6),
(1, 22.99, 7, 7),
(6, 35.94, 8, 8),
(2, 8.40, 9, 9),
(1, 39.90, 10, 10),
(3, 16.50, 11, 11),
(2, 69.80, 12, 12),
(4, 39.96, 13, 13),
(3, 10.50, 14, 14),
(1, 19.99, 15, 15);
