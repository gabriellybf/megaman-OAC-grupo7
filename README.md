# Mega Man OAC — Grupo 7

Jogo **Mega Man** em plataforma 2D desenvolvido em **Assembly RISC-V** para a disciplina **Organização e Arquitetura de Computadores (OAC)** da Universidade de Brasília. O jogo roda no simulador **RARS** (RISC-V Assembler and Runtime Simulator) com suporte a saída VGA, entrada por teclado e reprodução de áudio via MMIO.

---

## Tecnologias

| Tecnologia | Finalidade |
|---|---|
| **RISC-V Assembly** | Lógica completa do jogo |
| **RARS** (customizado) | Simulador RISC-V com extensões MMIO para VGA, teclado e áudio |
| **Verilog** | Planejado para implementação futura do processador em FPGA (DE1-SoC/DE2) |
| **Ferramentas de conversão** | `bmp2oac2.exe`, `bmp2isc.exe`, `script.exe` — convertem imagens BMP/PNG para dados incluíveis em assembly |

---

## Estrutura do Projeto

```
megaman-OAC-grupo7/
├── docs/
│   └── situacao-atual.md          # Documento de planejamento (desatualizado)
├── src/
│   ├── asm/                       # Código-fonte principal
│   │   ├── jogoOAC.asm            # Jogo principal (~450 linhas)
│   │   ├── MACROSv24.s            # Biblioteca de macros (v2.4)
│   │   ├── SYSTEMv24.s            # Sistema de ecalls e tratamento de exceções
│   │   ├── main.s                 # Placeholder vazio
│   │   ├── fpgrars-x86_64-pc-windows-msvc--unb.exe  # Simulador RARS customizado
│   │   └── script/
│   │       ├── script.exe         # Utilitário de conversão de imagens
│   │       ├── bmp2/              # Conversores BMP → .data
│   │       ├── imagens_para_conversao/  # Assets fonte (BMP/PNG)
│   │       └── imagens_convertidas/     # Assets convertidos (.data)
│   └── verilog/
│       └── top.v                  # Módulo Verilog (vazio — a implementar)
└── tests/                         # (vazio)
```

---

## Como Executar

1. Abra o arquivo `src/asm/jogoOAC.asm` no simulador **fpgrars** (`fpgrars-x86_64-pc-windows-msvc--unb.exe`).
2. Monte (Assemble) o código.
3. Execute (Run) — a velocidade do simulador pode ser ajustada conforme necessário.
4. Na tela inicial, pressione **S** para iniciar.
5. Controles durante o jogo:
   - **A** — mover para a esquerda
   - **D** — mover para a direita
   - **W** — pular

---

## Funcionalidades Implementadas

- **Tela inicial** com arte do Mega Man e música de fundo (MIDI).
- **Rolagem horizontal** — mapa de 1692×240 px com câmera que segue o personagem.
- **Personagem** — sprite 48×48 com transparência por chave de cor (valor 199).
- **Duplo buffer** — dois frames (0xFF000000 e 0xFF100000) para renderização sem flicker.
- **Movimentação** — corrida (A/D) e pulo com gravidade e inércia horizontal.
- **Música** — sequência de notas MIDI executada no menu inicial.

---

## Arquivos Principais

### `jogoOAC.asm`
Contém toda a lógica do jogo: menu, loop principal, rendering, física, movimentação e câmera.

### `SYSTEMv24.s` (1901 linhas)
Biblioteca do professor Marcus Vinicius Lamar (v2.4, 2024/1). Implementa:
- Handlers personalizados para ecalls (1–148): impressão, leitura, MIDI, sleep, random, CLS, Bresenham.
- Rotinas de multiplicação e divisão em software (`__mulsi3`, `__divsi3`, etc.) — necessárias para ISAs sem extensão M.
- Tratamento de interrupções e exceções.
- Tabela de scancode → ASCII e fonte 8×8 ZX-Spectrum.

### `MACROSv24.s` (227 linhas)
Macros para detecção de placa (DE1), FPU, extensão M, multiplicação por software, divisão por 10, e definições de endereços MMIO (VGA, teclado, áudio, timer, LFSR).

---

## Assets

Os sprites e mapas são armazenados como dados assembly (`.data`) com formato:
- Cabeçalho: `.word largura, altura`
- Seguido por `.byte` com valores de cor para cada pixel (paleta 8 bits).

Sprites disponíveis:
- `megamanStill` — parado
- `48x48megamanhero` — herói base
- `48x48megamanrunninghero` — correndo
- `48x48megamanfirehero` — ataque de fogo
- `48x48megamanpowerfullattackhero` — ataque poderoso

---

## Melhorias Futuras

- Implementação do processador em Verilog (`top.v`).
- Inimigos e colisão com plataformas.
- Sistema de vidas e game over.
- Power-ups e ataques funcionais.
- Múltiplas fases.

---

## Autores

- **Arthur Vilaca**
- **Gabrielly Freitas**
- **Gustavo Pires**

---

## Licença

Projeto acadêmico sem fins comerciais.
