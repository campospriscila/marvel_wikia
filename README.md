# Marvel Wikia

Este é um aplicativo Flutter que mostra os personagens da Marvel, com informações detalhadas, incluindo descrições, imagens e links para quadrinhos. O aplicativo permite que os usuários alternem entre temas claro e escuro, e mudem o idioma da interface.

## Funcionalidades

- Listagem de personagens populares da Marvel em um carrossel.
- Listagem de todos os personagens da Marvel com rolagem infinita.
- Troca entre temas claro e escuro.
- Alteração de idioma da interface.
- Exibição de detalhes do personagem em um diálogo ao clicar em um personagem.

## Requisitos

- **Versão mínima do Flutter SDK**: 3.7.x
- **Compatível com**:
  - Android SDK 21+
  - iOS 10+
- Tela responsiva para se adaptar a vários tamanhos de dispositivos.
- Arquitetura definida: MVVM com BLoC.
- Testes unitários.
- Tratamento de erros.
- Padrões de projeto e boas práticas de orientação a objetos.

## Arquitetura do Projeto

O projeto segue a arquitetura MVVM (Model-View-ViewModel) com o uso do BLoC (Business Logic Component) para gerenciar estados.

## Estrutura de Pastas

```markdown
marvel_wikia
├── assets
│ ├── fonts
│ ├── images
│ └── locale
├── lib
│ ├── blocs
│ │ ├── application
│ │ ├── characters
| | ├── language
| | ├── message
│ │ └── theme
│ ├── configs
│ ├── models
│ ├── repositories
│ ├── screens
│ ├── utils
│ └── widgets
├── test
└── pubspec.yaml
```

### Principais Componentes

#### BLoC (Business Logic Component)

- **application_cubit.dart**: Gerencia o estado inicial do aplicativo e carrega dados iniciais.
- **characters_cubit.dart**: Gerencia o estado dos personagens, incluindo carregamento de mais personagens com rolagem infinita.
- **language_cubit.dart**: Gerencia o estado do idioma da interface.
- **message_cubit.dart**: Gerencia o estado das mensagens de erro.
- **theme_cubit.dart**: Gerencia o estado do tema (claro ou escuro).

#### Repositórios

- **characters_repository.dart**: Responsável por buscar dados dos personagens da API da Marvel.

#### Widgets

- **CharacterCard**: Exibe informações resumidas do personagem no carrossel.
- **CharacterList**: Exibe informações resumidas do personagem na lista.
- **CharacterDialog**: Mostra detalhes do personagem em um diálogo quando clicado.

#### Configurações

- **mwk_app.dart**: Configurações principais do aplicativo, incluindo tema, rotas e localização.
- **mwk_routes.dart**: Define as rotas do aplicativo.
- **mwk_theme.dart**: Define os temas claro e escuro.

### Telas

- **home.dart**: Tela inicial que exibe o carrossel e a lista de personagens.
- **settings.dart**: Tela de configurações onde o usuário pode mudar o idioma, tema, e definir preferências de cache (em desenvolvimento).


#### Melhorias Futuras

## Melhorias Futuras

- Implementar funcionalidade de cache de imagens.
- Melhorar a acessibilidade do aplicativo.
- Adicionar mais testes unitários e testes de integração.
- Melhorar a UI/UX com animações e transições suaves.
- Adicionar tradução das descrições dos personagens.
