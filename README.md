# Desafio Exactaworks / Alelo iOS

Este repositório contém o código do desafio técnico proposto pela Exactaworks e Alelo, para iOS.

A ideia foi construir um MVP respeitando ao máximo as guidelines de design da Apple, tornando a aplicação muito mais integrada ao sistema operacional. Foram utilizados Swift e SwiftUI para a construção da aplicação.

App desenvolvido na versão beta do **XCode 15**, que deve ser lançado junto com o MacOS Sonoma.  
Caso não consiga executar o projeto localmente em versões anteriores da IDE, por favor me contate.

![Captura de tela do app no modo escuro](/screenshots/AleloChallengeDarkMode.webp)
![Captura de tela do app no modo claro](/screenshots/AleloChallengeLightMode.webp)


Compatível com redimensionamento em iPads com suporte ao organizador visual. 

https://github.com/pmarcus93/ios-alelo-challenge/assets/6492177/2bdf97c3-f2b8-4998-886c-3483b923ecdb

Funcionalidades:

- Listagem de produtos na API simulada.
- Possibilidade de adição, edição e remoção de itens no carrinho de compras.
- Produtos em promoção ganham uma badge de destaque.
- Navegação inferior via abas.
- Status de carrinho vazio informativo.
- Exibição de placeholder em caso de imagem inexistente no produto.
- Na tela de seleção de produtos, apenas os tamanhos disponíveis são exibidos para seleção.


Notas:

- Como o único item sem repetição em cada elemento retornado pela API é a propriedade code_color, o utilizei como identificador.
- Apesar de já trabalhar com mobile, este é meu primeiro projeto Swift / Swift UI nativo. Portanto, há muito o que melhorar no código, principalmente em relação à binding, modelagem de dados e acessibilidade.
