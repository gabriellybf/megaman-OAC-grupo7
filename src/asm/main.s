# =====================================================
# main.asm - Esqueleto inicial Mega Man 2
# Bitmap Display: 320x240, 1 byte/pixel, paleta BGR
# Frame 0: 0xFF000000  Frame 1: 0xFF100000
# Troca de frame visivel: 0xFF200604
# Teclado MMIO: 0xFF200000 (status) 0xFF200004 (dado)
# Cor transparente: 0xC7
# =====================================================

.data
CHAR_POS:	.half 0, 0		# x, y do personagem
OLD_CHAR_POS:	.half 0, 0		# x, y anterior (para limpar rastro)

# Frame atual sendo desenhado (alterna entre 0 e 1)
# s0 guarda esse valor durante o jogo

.text

# =====================================================
# SETUP
# Desenha o fundo nos dois frames antes de comecar
# =====================================================
SETUP:
		li s0, 0		# começa no frame 0

		la a0, map		# sprite do fundo
		li a1, 0		# x = 0
		li a2, 0		# y = 0
		li a3, 0		# frame 0
		call PRINT

		li a3, 1		# frame 1
		call PRINT		# desenha fundo nos dois frames

# =====================================================
# GAME_LOOP
# =====================================================
GAME_LOOP:
		call KEY		# le teclado e atualiza CHAR_POS

		xori s0, s0, 1		# troca frame de desenho (0->1, 1->0)

		# --- Desenha personagem no frame escondido ---
		la t0, CHAR_POS
		la a0, char		# sprite do personagem
		lh a1, 0(t0)		# x atual
		lh a2, 2(t0)		# y atual
		mv a3, s0		# frame escondido
		call PRINT

		# --- Mostra o frame para o usuario ---
		li t0, 0xFF200604
		sw s0, 0(t0)

		# --- Limpa rastro no frame que ficou atras ---
		la t0, OLD_CHAR_POS
		la a0, tile		# sprite do fundo (tile)
		lh a1, 0(t0)		# x antigo
		lh a2, 2(t0)		# y antigo
		mv a3, s0
		xori a3, a3, 1		# frame que esta sendo exibido (o de tras)
		call PRINT

		j GAME_LOOP

# =====================================================
# KEY - Le teclado por polling
# Atualiza CHAR_POS e salva OLD_CHAR_POS
# w=cima  s=baixo  a=esquerda  d=direita
# =====================================================
KEY:
		li t1, 0xFF200000	# endereco de controle do teclado
		lw t0, 0(t1)		# le status
		andi t0, t0, 0x0001	# isola bit 0
		beq t0, zero, KEY_FIM	# sem tecla, retorna

		lw t2, 4(t1)		# le a tecla pressionada

		li t0, 'w'
		beq t2, t0, MOVE_CIMA

		li t0, 's'
		beq t2, t0, MOVE_BAIXO

		li t0, 'a'
		beq t2, t0, MOVE_ESQ

		li t0, 'd'
		beq t2, t0, MOVE_DIR

KEY_FIM:	ret

# =====================================================
# Movimentacao - cada direcao salva OLD e atualiza POS
# O passo e 16 pixels (tamanho do sprite)
# Ajuste para 32 quando mudar o sprite para 32x32
# =====================================================
MOVE_ESQ:
		la t0, CHAR_POS
		la t1, OLD_CHAR_POS
		lw t2, 0(t0)
		sw t2, 0(t1)		# salva posicao atual em OLD

		lh t1, 0(t0)		# carrega x
		addi t1, t1, -16	# move para esquerda
		blt t1, zero, KEY_FIM	# nao sai da tela
		sh t1, 0(t0)
		ret

MOVE_DIR:
		la t0, CHAR_POS
		la t1, OLD_CHAR_POS
		lw t2, 0(t0)
		sw t2, 0(t1)

		lh t1, 0(t0)		# carrega x
		addi t1, t1, 16		# move para direita
		li t2, 304		# 320 - 16 (limite direito)
		bgt t1, t2, KEY_FIM	# nao sai da tela
		sh t1, 0(t0)
		ret

MOVE_CIMA:
		la t0, CHAR_POS
		la t1, OLD_CHAR_POS
		lw t2, 0(t0)
		sw t2, 0(t1)

		lh t1, 2(t0)		# carrega y
		addi t1, t1, -16	# move para cima
		blt t1, zero, KEY_FIM	# nao sai da tela
		sh t1, 2(t0)
		ret

MOVE_BAIXO:
		la t0, CHAR_POS
		la t1, OLD_CHAR_POS
		lw t2, 0(t0)
		sw t2, 0(t1)

		lh t1, 2(t0)		# carrega y
		addi t1, t1, 16		# move para baixo
		li t2, 224		# 240 - 16 (limite inferior)
		bgt t1, t2, KEY_FIM	# nao sai da tela
		sh t1, 2(t0)
		ret

# =====================================================
# PRINT - Desenha sprite na tela
# a0 = endereco do sprite (.word largura, .word altura, bytes...)
# a1 = x destino na tela
# a2 = y destino na tela
# a3 = frame (0 ou 1)
# =====================================================
PRINT:
		li t0, 0xFF0		# base: 0xFF0
		add t0, t0, a3		# + frame (vira 0xFF0 ou 0xFF1)
		slli t0, t0, 20		# shift -> 0xFF000000 ou 0xFF100000

		add t0, t0, a1		# + x

		li t1, 320
		mul t1, t1, a2		# 320 * y
		add t0, t0, t1		# endereco inicial no bitmap

		addi t1, a0, 8		# pula largura e altura do cabecalho

		li t2, 0		# contador de linha
		li t3, 0		# contador de coluna

		lw t4, 0(a0)		# largura do sprite em bytes
		lw t5, 4(a0)		# altura do sprite em linhas

PRINT_COL:
		lb t6, 0(t1)		# le 1 byte (1 pixel)
		sb t6, 0(t0)		# escreve no bitmap

		addi t0, t0, 1		# avanca bitmap
		addi t1, t1, 1		# avanca sprite

		addi t3, t3, 1
		blt t3, t4, PRINT_COL	# continua na mesma linha

		# fim de linha: pula para proxima linha no bitmap
		li t6, 320
		sub t6, t6, t4		# 320 - largura
		add t0, t0, t6		# pula o resto da linha no bitmap

		li t3, 0		# zera contador de coluna
		addi t2, t2, 1		# incrementa linha
		blt t2, t5, PRINT_COL	# proxima linha do sprite

		ret

# =====================================================
# SPRITES
# Inclua os arquivos gerados pelo bmp2oac3.exe
# Cada arquivo define: .word largura, .word altura, .byte pixels...
# =====================================================
.