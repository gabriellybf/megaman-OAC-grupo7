# Mega Man OAC — Grupo 7

Jogo **Mega Man** em plataforma 2D desenvolvido em **Assembly RISC-V** para a disciplina **Organização e Arquitetura de Computadores (OAC)** da Universidade de Brasília. O jogo roda no simulador **fpgrars** (RISC-V Assembler and Runtime Simulator, versão customizada) com suporte a saída VGA, entrada por teclado e reprodução de áudio via MMIO.

O jogo conta com **2 fases**, **3 chefes** (Bowser, Rosalina e Mario), **2 tipos de inimigos**, sistema de armas com municao, power-ups e tela de Game Over com restart.

---

## Tecnologias

| Tecnologia | Finalidade |
|---|---|
| **RISC-V Assembly** | Lógica completa do jogo (~7400 linhas) |
| **fpgrars** (customizado) | Simulador RISC-V com extensões MMIO para VGA, teclado e áudio |
| **Ferramentas de conversão** | `bmp2oac2.exe`, `bmp2isc.exe`, `script.exe` — convertem imagens BMP/PNG para dados incluíveis em assembly |

---

## Estrutura do Projeto

```
megaman-OAC-grupo7/
├── README.md
├── .gitignore
├── data/                              # Diretório de dados (reservado)
│   └── .gitkeep
├── docs/
│   ├── Trabalho_OAC.pdf               # Documento/trabalho da disciplina
│   └── .gitkeep
├── src/
│   └── asm/                           # Código-fonte principal
│       ├── jogoOAC.asm                # Jogo principal (~7400 linhas)
│       ├── MACROSv24.s                # Biblioteca de macros (v2.4)
│       ├── SYSTEMv24.s                # Sistema de ecalls e tratamento de exceções
│       ├── main.s                     # Placeholder vazio
│       ├── fpgrars-x86_64-pc-windows-msvc--unb.exe  # Simulador fpgrars (Windows)
│       ├── fpgrars-x86_64-unknown-linux-gnu--unb    # Simulador fpgrars (Linux)
│       ├── Rars16_Custom1.jar         # Simulador RARS customizado (alternativo)
│       └── script/
│           ├── script.exe             # Utilitário de conversão de imagens
│           └── Imagens/
│               ├── bmp2/              # Conversores BMP → .data
│               │   ├── bmp2oac2.exe
│               │   └── bmp2isc.exe
│               ├── imagens_para_conversao/  # Assets fonte (BMP/PNG)
│               └── imagens_convertidas/     # Assets convertidos (.data)
│                   └── arquivos .data/
└── tests/                             # (vazio)
```

---

## Como Executar

1. Abra o arquivo `src/asm/jogoOAC.asm` no simulador **fpgrars**:
   - **Windows**: `fpgrars-x86_64-pc-windows-msvc--unb.exe`
   - **Linux**: `fpgrars-x86_64-unknown-linux-gnu--unb`
   - **Alternativa**: `Rars16_Custom1.jar` (RARS customizado via Java)
2. Monte (Assemble) o código.
3. Execute (Run) — a velocidade do simulador pode ser ajustada conforme necessário.
4. Na tela inicial, pressione **Enter** para iniciar.
5. Controles durante o jogo:

| Tecla | Ação |
|---|---|
| **A** | Mover para a esquerda |
| **D** | Mover para a direita |
| **W** | Pular |
| **E** | Atacar (atira ou soco, dependendo da arma selecionada) |
| **Q** | Trocar arma (projétil ↔ soco) |
| **R** | Reiniciar jogo (apenas na tela de Game Over) |

---

## Funcionalidades Implementadas

### Gameplay
- **2 fases** com mapas e musicas diferentes, chefes e inimigos proprios.
- **Sistema de armas** — tecla **Q** alterna entre projétil (com municao limitada a 8 tiros) e soco (ilimitado).
- **Power-ups** — mystery boxes que soltam cura (+1 vida, max 4) ou municao (recarrega para 8 tiros); na fase 2, itens fixos espalhados pelo mapa.
- **HUD completo** — coracoes (vida), icones de municao e indicador de arma atual.
- **Game Over** — ao zerar vidas, tela de derrota com musica; pressione **R** para reiniciar do inicio.
- **Tela de vitoria** — ao derrotar todos os chefes e alcancar a porta final da fase 2.

### Combate
- **Sistema de dano** — todo ataque inimigo retira 1 vida; jogador ganha periodo de invencibilidade (30-35 frames) e knockback ao levar dano.
- **Arma projétil** — projétil viaja na direção que o jogador olha (8px/frame, alcance 150px, largura 32x32).
- **Arma soco** — hitbox na frente do jogador (26x40 pixels), acerta uma vez por ataque.

### Fisica e Renderizacao
- **Duplo buffer** — dois frames (0xFF000000 e 0xFF100000) para renderizacao sem flicker.
- **Câmera** — segue o jogador com limites, suporte a mapas de larguras diferentes.
- **Gravidade e pulo** — impulso inicial -13, gravidade +1/frame, velocidade terminal 12, inércia horizontal preservada durante o pulo.
- **Transparência por chave de cor** — valor 199 (jogador/inimigos) ou 135/143/105/146 (chefes).

### Audio
- **Musica MIDI** — sequências de notas tocadas assincronamente no loop principal; musica diferente por fase e tela (menu, fase 1, fase 2, game over, vitoria).
- **Efeitos sonoros** — som de dano, pulo, tiro, soco, coleta de power-up e abertura de mystery box.

---

## Fases e Progressão

| Fase | Mapa | Chefes | Inimigos | Musica |
|---|---|---|---|---|
| **Fase 1** | 141 tiles (1644px) | Bowser (6 HP) | 3 plantas piranha, 2 andadores | FAIXA 3 |
| **Fase 2** | 148 tiles (1728px) | Rosalina (4 HP) + Mario (12 HP) | Nenhum | FAIXA 4 |

- Para avançar da Fase 1 para a Fase 2, o Bowser deve ser derrotado e o jogador deve entrar na porta.
- Para vencer o jogo na Fase 2, Rosalina e Mario devem ser derrotados e o jogador deve entrar na porta final.
- A fase 2 possui uma tela de transição com a imagem "fase2" antes do carregamento.

---

## Inimigos e Chefes

### Inimigos Basicos

| Inimigo | Vida | Comportamento | Dano ao jogador |
|---|---|---|---|
| **Planta Piranha** | 2 | Posicionada em plataformas, sem movimento | 1 vida (contato) |
| **Andador** | 2 | Patrulha entre limites, inverte direcao ao bater nas bordas | 1 vida (contato) |

### Chefes

| Chefe | Vida | Ataques | Fase |
|---|---|---|---|
| **Bowser** | 6 | Bola de fogo, investida, salto com impacto no chao | Fase 1 |
| **Rosalina** | 4 | Luma horizontal, Luma diagonal, pulso (empurra jogador) | Fase 2 |
| **Mario** | 12 | Fogo, estrela, investida, salto com impacto, copia (clone) | Fase 2 |

- Chefes possuem estados (maquina de estados) com diferentes sprites (normal vs. ataque) e piscam quando invenciveis apos levar dano.
- O Mario possui 2 fases de combate: ao perder vida, muda o padrao de ataques.

---

## Arquivos Principais

### `jogoOAC.asm` (~7400 linhas)
Contém toda a lógica do jogo em Assembly RISC-V:
- Menu inicial e tela de Game Over
- Loop principal com atualizacao de estado e rendering
- Fisica (gravidade, pulo, colisao com blocos)
- Sistema de colisao AABB (caixa delimitadora) para jogador-inimigo, jogador-chefe, jogador-power-up
- Maquinas de estado para IA dos 3 chefes
- Animacao de inimigos (2-frame toggle) e chefses (sprite normal/ataque)
- Gerenciamento de fases e transicoes
- Sistema de dano com invencibilidade e knockback
- HUD (vida, municao, arma)
- Audio (musicas e efeitos sonoros)

### `SYSTEMv24.s` (~1900 linhas)
Biblioteca do professor Marcus Vinicius Lamar (v2.4, 2024/1). Implementa:
- Handlers personalizados para ecalls (1–148): impressão, leitura, MIDI, sleep, random, CLS, Bresenham.
- Rotinas de multiplicação e divisão em software (`__mulsi3`, `__divsi3`, etc.) — necessárias para ISAs sem extensão M.
- Tratamento de interrupções e exceções.
- Tabela de scancode → ASCII e fonte 8×8 ZX-Spectrum.

### `MACROSv24.s` (227 linhas)
Macros para detecção de placa (DE1), FPU, extensão M, multiplicação por software, divisão por 10, e definições de endereços MMIO (VGA, teclado, áudio, timer, LFSR).

---

## Assets

Todos os sprites e mapas sao armazenados como dados assembly (`.data`) com formato:
- Cabecalho: `.word largura, altura`
- Seguido por `.byte` com valores de cor para cada pixel (paleta 8 bits).

### Sprites do Jogador (11)

| Arquivo | Descricao |
|---|---|
| `megamanStill.data` | Megaman parado (idle) |
| `48x48megamanrunninghero.data` | Megaman correndo direita (frame 1) |
| `Run1.data` | Megaman correndo direita (frame 2) |
| `RunL1.data` | Megaman correndo esquerda (frame 1) |
| `RunL2.data` | Megaman correndo esquerda (frame 2) |
| `Jump-1.data` | Megaman pulando (frame 1) |
| `Jump-2.data` | Megaman pulando (frame 2) |
| `TiroR.data` | Megaman atirando (olhando direita) |
| `TiroL.data` | Megaman atirando (olhando esquerda) |
| `socodir.data` | Megaman socando (olhando direita) |
| `socoesq.data` | Megaman socando (olhando esquerda) |

### Sprites de Inimigos (6)

| Arquivo | Descricao |
|---|---|
| `planta1.data` | Planta piranha (frame 1) |
| `planta2.data` | Planta piranha (frame 2) |
| `inimigoR1.data` | Andador olhando direita (frame 1) |
| `inimigoR2.data` | Andador olhando direita (frame 2) |
| `inimigoL1.data` | Andador olhando esquerda (frame 1) |
| `inimigoL2.data` | Andador olhando esquerda (frame 2) |

### Sprites de Chefes e Projetеis (13)

| Arquivo | Descricao |
|---|---|
| `bowser80.data` | Bowser — sprite normal |
| `bowser_power.data` | Bowser — pose de ataque |
| `bowser_fogo2.data` | Projetil de fogo do Bowser |
| `rosalina.data` | Rosalina — sprite normal |
| `rosalina_power.data` | Rosalina — pose de ataque |
| `rosalina_projetil.data` | Projetil/estrela da Rosalina |
| `luma_azul.data` | Luma azul (projetil Rosalina) |
| `luma_rosa.data` | Luma rosa (projetil Rosalina) |
| `luma_verde.data` | Luma verde (projetil Rosalina) |
| `luma_amarela.data` | Luma amarela (projetil Rosalina) |
| `mario.data` | Mario — sprite normal |
| `mario_power.data` | Mario — pose de ataque |
| `mario_fogo.data` | Projetil de fogo do Mario |

### Telas, HUD e Power-ups (12)

| Arquivo | Descricao |
|---|---|
| `start320x240.data` | Tela de menu inicial |
| `final.data` | Tela de Game Over |
| `fase2.data` | Tela de transicao Fase 2 |
| `youwin.data` | Tela de vitoria |
| `coracao.data` | Icone de vida (HUD) |
| `municao.data` | Icone de municao (HUD) |
| `canhao.data` | Icone de arma projetil (HUD) |
| `soco.data` | Icone de arma soco (HUD) |
| `fire.data` | Projetil do jogador (direita) |
| `fireesq.data` | Projetil do jogador (esquerda) |
| `cura.data` | Power-up de cura |
| `energia.data` | Power-up de municao |

### Mapas (2)

| Arquivo | Descricao |
|---|---|
| `mapaFase1.data` | Mapa de fundo da Fase 1 |
| `mapaFase2.data` | Mapa de fundo da Fase 2 |

---

## Melhorias Futuras

- Implementação do processador em Verilog para sintetizável em FPGA.

---

## Autores

- **Arthur Vilaca**
- **Gabrielly Freitas**
- **Gustavo Pires**
- **Adria Carolina**
- **João Francisco Torres**
- **Ana Luiza Coelho**

---

## Licença

Projeto acadêmico sem fins comerciais.
