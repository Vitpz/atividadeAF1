# Avaliação Formativa I - SkyHorizon Airlines

Projeto desenvolvido para a disciplina **Programação para Dispositivos Móveis**, com base na situação-problema apresentada na Avaliação Formativa I.

**Aluno:** Vitor Paz  
**Disciplina:** Programação para Dispositivos Móveis  
**Entrega:** 10/09/2026

## Sobre o projeto

A atividade pede a construção, em Dart com Null-Safety, de um pequeno modelo orientado a objetos para o sistema de emissão de passagens da SkyHorizon Airlines.

O código foi consolidado em um único arquivo `main.dart`, conforme solicitado na atividade. A execução demonstra as classes de apoio, os construtores, encapsulamento, métodos de negócio, herança, mixins e polimorfismo.

## O que foi feito

- Classes `Passageiro`, `PlataformaVenda` e `Atendente`.
- Classe `Passagem` com construtor não nomeado.
- Construtores nomeados `somenteCodigo`, `completa`, `codigoEPassageiro` e `all`.
- Encapsulamento do código localizador com getter e setter tradicionais.
- Getter e setter nativos do Dart com validação contra valor nulo ou vazio.
- Métodos de emissão, cancelamento, atualização e consulta.
- Subclasse `PassagemPrimeiraClasse` usando herança.
- Mixins `Logger` e `Auditoria`.
- Sobrescrita de `AtualizarPassagem()` na Primeira Classe.
- Demonstração de polimorfismo no `main()`.

## Como executar

É necessário ter o Dart SDK instalado.

No terminal, dentro da pasta do projeto:

```bash
dart run main.dart
```

Também é possível executar diretamente:

```bash
dart main.dart
```

## Estrutura

```text
AF1_SkyHorizon_Vitor_Paz/
├── main.dart
├── README.md
└── .gitignore
```

## Observação

O projeto foi mantido simples e direto, sem dependências externas, para facilitar a publicação e a correção da atividade.
