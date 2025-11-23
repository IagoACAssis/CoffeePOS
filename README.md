# ☕ CoffeePOS
Um projeto de estudo desenvolvido em **Delphi (FMX Multi-Device)** para aplicar na prática os princípios de **Clean Architecture**, **SOLID** e **Padrões de Projeto (Design Patterns)**, incluindo Strategy, Repository, Facade, Factory e Builder.

O objetivo é criar um **mini-PDV (Point of Sale)** para uma padaria/cafeteria, com funcionalidades essenciais como:

- Cadastro de produtos  
- Listagem de produtos  
- Criação de vendas  
- Adição de itens ao carrinho  
- Processamento de pagamento (Dinheiro, Pix, Cartão – simulado)  
- Arquitetura escalável, organizada e orientada a domínio  

O projeto é simples o suficiente para estudo, mas completo o bastante para entender conceitos modernos de arquitetura limpa aplicada ao Delphi.

---

## 📚 Tecnologias e Conceitos Utilizados

### 🔹 **Delphi (Community Edition)**
- FireMonkey (FMX)  
- Multi-Device (Windows / Android)

### 🔹 **Clean Architecture**
- Domain  
- Application (UseCases)  
- Infrastructure  
- Interface (UI)  

### 🔹 **Princípios SOLID**
- SRP, OCP, LSP, ISP, DIP plenamente aplicados

### 🔹 **Design Patterns**
- **Strategy** → Pagamentos (Dinheiro, Pix, Cartão)  
- **Repository** → Repositórios em memória para Produtos e Vendas  
- **Facade** → `TAppServices` simplifica o acesso da UI  
- **Factory** → Criação das estratégias de pagamento  
- **UseCases** → Casos de uso desacoplados

---

## 🏗 Estrutura da Arquitetura
src/
├── domain/
│ ├── uProduto.pas
│ ├── uItemVenda.pas
│ ├── uVenda.pas
│ ├── uPagamento.pas
│ ├── uRepositorioProduto.pas
│ └── uRepositorioVenda.pas
│
├── infrastructure/
│ ├── repositorios/
│ │ ├── uRepositorioProdutoMemoria.pas
│ │ └── uRepositorioVendaMemoria.pas
│ ├── pagamentos/
│ │ ├── uPagamentoDinheiro.pas
│ │ ├── uPagamentoPix.pas
│ │ └── uPagamentoCartao.pas
│
├── application/
│ ├── usecases/
│ │ ├── uCadastrarProdutoUseCase.pas
│ │ ├── uListarProdutosUseCase.pas
│ │ ├── uCriarVendaUseCase.pas
│ │ ├── uAdicionarItemUseCase.pas
│ │ └── uProcessarPagamentoUseCase.pas
│ └── facade/
│ └── uAppServices.pas
│
└── ui/
├── dmApp.pas
├── FormProdutos.pas
├── FormProdutoCadastro.pas
└── FormVenda.pas

---

## ⚙️ Funcionalidades

### ✔ Cadastro de Produtos
- Nome
- Preço
- Armazenamento em memória (pode evoluir para SQLite)

### ✔ Listagem de Produtos
- ListView FMX
- Atualização automática ao retornar à tela

### ✔ Vendas
- Criação automática de nova venda
- Adição de itens ao carrinho
- Cálculo de subtotal e total

### ✔ Pagamentos (Strategy Pattern)
- Dinheiro  
- Pix  
- Cartão  
*(Todos simulados, mas preparados para integração real: Stone, Fiserv, InfinitePay, etc.)*

---

## 🎨 Interface (UI)
- Totalmente construída em FireMonkey (FMX)
- Compatível com Windows e Android
- Telas:
  - Tela Principal
  - Produtos
  - Cadastro de Produto
  - Venda (Carrinho)
  - Pagamento

---

## 🤝 Contribuições
Este projeto é aberto a contribuições, sugestões e melhorias.  
Se quiser aprender mais sobre Clean Architecture no Delphi, abra uma Issue!

---

## 📄 Licença
Este projeto está sob a licença MIT.  
Sinta-se livre para estudar, modificar e reutilizar.

---

## ✨ Autor
Desenvolvido como projeto de estudo por **Iago de Assis**.

