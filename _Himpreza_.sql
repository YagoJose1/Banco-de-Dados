-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/05/2024 às 02:06
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `empresa_jogo`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cli` varchar(25) DEFAULT NULL,
  `cpf_cnpj` int(11) DEFAULT NULL,
  `ende_cli` varchar(30) DEFAULT NULL,
  `tele_cli` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome_cli`, `cpf_cnpj`, `ende_cli`, `tele_cli`) VALUES
(1, 'Maria Souza', 987654, 'Rua das Flores, 123', 26376726),
(2, 'Carlos Oliveira', 456789, 'Avenida Principal, 456', 0),
(3, 'Ana Silva', 789123, 'Travessa dos Sonhos, 789', 0),
(4, 'Pedro Santos', 321654, 'Rua das Palmeiras, 987', 0),
(5, 'Luciana Pereira', 654987, 'Avenida Central, 147', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `valor_jogos` int(11) DEFAULT NULL,
  `cod_jogos` int(11) DEFAULT NULL,
  `ende_cli` varchar(15) DEFAULT NULL,
  `nota_fiscal` int(11) DEFAULT NULL,
  `data_real` date DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_pagamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `compra`
--

INSERT INTO `compra` (`id_compra`, `valor_jogos`, `cod_jogos`, `ende_cli`, `nota_fiscal`, `data_real`, `id_cliente`, `id_pagamento`) VALUES
(1, 60, 1, 'Rua Exemplo, 12', 0, '2024-05-02', 1, 1),
(2, 50, 2, 'Avenida Princip', 0, '2024-05-03', 2, 2),
(3, 40, 3, 'Travessa dos So', 0, '2024-05-04', 3, 3),
(4, 70, 4, 'Rua das Palmeir', 0, '2024-05-05', 4, 4),
(5, 80, 5, 'Avenida Central', 0, '2024-05-06', 5, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `id_estoque` int(11) NOT NULL,
  `quant_jogos` int(11) DEFAULT NULL,
  `cnpj_empresa` int(11) NOT NULL,
  `cod_jogos` int(11) DEFAULT NULL,
  `id_fun` int(11) DEFAULT NULL,
  `id_forne` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`id_estoque`, `quant_jogos`, `cnpj_empresa`, `cod_jogos`, `id_fun`, `id_forne`) VALUES
(1, 245, 276389, 1, 4, 2),
(2, 154, 562341, 3, 1, 3),
(3, 236, 563321, 4, 5, 1),
(4, 186, 678432, 5, 3, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id_forne` int(11) NOT NULL,
  `quant_jogos` int(11) NOT NULL,
  `cnpj_empresa` int(11) NOT NULL,
  `id_estoque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id_forne`, `quant_jogos`, `cnpj_empresa`, `id_estoque`) VALUES
(1, 800, 2147483647, 1),
(2, 1200, 2147483647, 2),
(3, 600, 2147483647, 3),
(4, 1500, 2147483647, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_fun` int(11) NOT NULL,
  `nome_fun` varchar(25) DEFAULT NULL,
  `cpf_fun` int(11) DEFAULT NULL,
  `tele_fun` int(11) NOT NULL,
  `comissão` float DEFAULT NULL,
  `função_fun` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id_fun`, `nome_fun`, `cpf_fun`, `tele_fun`, `comissão`, `função_fun`) VALUES
(1, 'João Silva', 123456, 987654321, 5, 'Vendedor'),
(2, 'Maria Santos', 234567, 876543210, 6, 'Gerente'),
(3, 'Carlos Oliveira', 345678, 765432109, 4.5, 'Caixa'),
(4, 'Ana Souza', 456789, 654321098, 4, 'Vendedor'),
(5, 'Paula Pereira', 567890, 543210987, 5.5, 'Gerente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogos`
--

CREATE TABLE `jogos` (
  `cod_jogos` int(11) NOT NULL,
  `nome_jogos` varchar(40) NOT NULL,
  `genêro_jogos` varchar(20) NOT NULL,
  `valor_jogos` float NOT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `quant_jogos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `jogos`
--

INSERT INTO `jogos` (`cod_jogos`, `nome_jogos`, `genêro_jogos`, `valor_jogos`, `id_compra`, `quant_jogos`) VALUES
(1, 'GTA V', 'Ação', 59.99, 1, 8),
(2, 'The Witcher 3: Wild Hunt', 'RPG', 39.99, 2, 10),
(3, 'FIFA 22', 'Esportes', 49.99, 3, 14),
(4, 'Red Dead Redemption 2', 'Ação/Aventura', 49.99, 4, 7),
(5, 'Cyberpunk 2077', 'RPG/Ação', 49.99, 5, 17);

-- --------------------------------------------------------

--
-- Estrutura para tabela `loja_fisica`
--

CREATE TABLE `loja_fisica` (
  `id_forne` int(11) DEFAULT NULL,
  `cnpj_loja` int(11) NOT NULL,
  `id_fun` int(11) DEFAULT NULL,
  `id_estoque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `loja_fisica`
--

INSERT INTO `loja_fisica` (`id_forne`, `cnpj_loja`, `id_fun`, `id_estoque`) VALUES
(2, 187624, 2, 2),
(1, 265143, 1, 1),
(3, 378299, 3, 3),
(4, 456215, 4, 4),
(3, 991524, 5, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `nº_cartao` int(11) DEFAULT NULL,
  `pix` float DEFAULT NULL,
  `dinheiro` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`id_pagamento`, `nº_cartao`, `pix`, `dinheiro`) VALUES
(1, 1234, 123458, 199),
(2, 2345, 362781, 247),
(3, 3456, 245413, 179),
(4, 4567, 653827, 254),
(5, 5678, 278910, 150);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `fk_cod_jogos` (`cod_jogos`),
  ADD KEY `fk_id_cliente` (`id_cliente`),
  ADD KEY `fk_id_pagamento` (`id_pagamento`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id_estoque`),
  ADD KEY `fk_id_fun` (`id_fun`),
  ADD KEY `fk_id_forne` (`id_forne`),
  ADD KEY `cod_jogos` (`cod_jogos`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_forne`),
  ADD KEY `id_estoque` (`id_estoque`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_fun`);

--
-- Índices de tabela `jogos`
--
ALTER TABLE `jogos`
  ADD PRIMARY KEY (`cod_jogos`),
  ADD KEY `fk_id_compra` (`id_compra`);

--
-- Índices de tabela `loja_fisica`
--
ALTER TABLE `loja_fisica`
  ADD PRIMARY KEY (`cnpj_loja`),
  ADD KEY `id_forne` (`id_forne`),
  ADD KEY `id_fun` (`id_fun`),
  ADD KEY `id_estoque` (`id_estoque`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_cod_jogos` FOREIGN KEY (`cod_jogos`) REFERENCES `jogos` (`cod_jogos`),
  ADD CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `fk_id_pagamento` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento` (`id_pagamento`);

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`cod_jogos`) REFERENCES `jogos` (`cod_jogos`),
  ADD CONSTRAINT `fk_id_forne` FOREIGN KEY (`id_forne`) REFERENCES `fornecedor` (`id_forne`),
  ADD CONSTRAINT `fk_id_fun` FOREIGN KEY (`id_fun`) REFERENCES `funcionarios` (`id_fun`);

--
-- Restrições para tabelas `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fornecedor_ibfk_1` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`id_estoque`);

--
-- Restrições para tabelas `jogos`
--
ALTER TABLE `jogos`
  ADD CONSTRAINT `fk_id_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`);

--
-- Restrições para tabelas `loja_fisica`
--
ALTER TABLE `loja_fisica`
  ADD CONSTRAINT `loja_fisica_ibfk_1` FOREIGN KEY (`id_forne`) REFERENCES `fornecedor` (`id_forne`),
  ADD CONSTRAINT `loja_fisica_ibfk_2` FOREIGN KEY (`id_fun`) REFERENCES `funcionarios` (`id_fun`),
  ADD CONSTRAINT `loja_fisica_ibfk_3` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`id_estoque`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
