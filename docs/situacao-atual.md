# Situação Atual do Projeto — Mega Man OAC

## Visão Geral

Projeto acadêmico da disciplina **Organização e Arquitetura de Computadores (OAC)**, com o objetivo de implementar um jogo/baseado no universo **Mega Man** utilizando **Assembly MIPS** e **Verilog**.

Estrutura do repositório:

```
megaman-OAC-grupo7/
├── README.md              # Apenas título
├── data/                  # Vazio (apenas .gitkeep)
├── docs/                  # Vazio (apenas .gitkeep)
├── src/
│   ├── asm/main.s         # Vazio (0 linhas)
│   └── verilog/top.v      # Vazio (0 linhas)
└── tests/                 # Vazio (apenas .gitkeep)
```

## Status atual

| Item | Status |
|------|--------|
| Código Assembly (`main.s`) | **Não implementado** — arquivo vazio |
| Código Verilog (`top.v`) | **Não implementado** — arquivo vazio |
| Documentação | **Inexistente** — `README.md` só tem o título |
| Dados / assets | **Nenhum** — pasta `data/` vazia |
| Testes | **Nenhum** — pasta `tests/` vazia |
| Build / simulação | **Sem ferramentas configuradas** (Makefile, script, etc.) |

## Commits

3 commits no total (todos em 08/05/2026, por Gabrielly Freitas):

- `0f86578` — Initial commit (estrutura inicial)
- `8cd8fdb` — commit inicial
- `c924d7c` — commit inicial

Nenhum código funcional foi commitado até o momento.

## Próximos passos sugeridos

1. **Assembly** — implementar a lógica do jogo em `src/asm/main.s` (controles, sprites, colisão, som, etc.)
2. **Verilog** — implementar o processador/módulo topo em `src/verilog/top.v`
3. **Testes** — criar testes no MARS/ModelSim para validar cada parte
4. **Documentação** — detalhar arquitetura, instruções de execução, referências
5. **Build/run** — configurar scripts para montar, simular e depurar o projeto
