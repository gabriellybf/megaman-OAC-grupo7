# Sessão de dados
# Todas os includes de DADOS ficam aqui.
# =========================================================
.data
# ======== MUSICA MEGA MAN ===========
# Numero de Notas a tocar
NUM_1: .word 52
# lista de nota,duraï¿½ï¿½o,nota,duraï¿½ï¿½o,nota,duraï¿½ï¿½o,...
NOTAS_1: 60,166,64,83,64,83,64,166,64,83,64,83,64,166,60,332,60,83,60,83,64,166,64,83,64,83,64,166,60,332,67,166,65,166,67,332,64,83,64,83,64,166,64,83,64,83,64,166,60,332,67,332,65,332,64,332,65,499,65,83,65,83,65,166,65,83,65,83,65,166,62,332,67,332,65,332,64,332,62,332,60,332,60,166,67,166,71,166,73,499,60,332,60,166,67,166,71,166,70,332,74,166,76,166 
# ======== MUSICA MARIO
NUM_2: .word 41
NOTAS_2:  76,150,76,300,76,300,72,150,76,300,79,600,55,600,72,450,67,450,64,450,69,300,71,300,70,150,69,300,67,201,76,197,79,201,81,300,77,150,79,300,76,300,72,150,74,150,71,450,72,450,67,450,64,450,69,300,71,300,70,150,69,300,67,201,76,198,79,201,81,300,77,150,79,300,76,300,72,150,74,150,71,150
# ======== MUSICA GAME LOOP ===========
NUM_3: .word 4
NOTAS_3: 60,250, 64,250, 67,250, 72,500

# ---- estado do jogo ----
PLAYER_X:     .word 0        # posição do personagem no MUNDO (0 .. MAP_LARGURA-LARG_PERSONAGEM)
PLAYER_Y:     .word 145      # posição vertical na tela (0 .. 240-ALT_PERSONAGEM)
CAMERA_X:     .word 0        # deslocamento da câmera dentro do mapa
FRAME_ATIVO:  .word 0        # frame atualmente exibido (0 ou 1)
PULANDO:      .word 0        # 0 = no chão, 1 = no ar
VEL_Y:        .word 0        # velocidade vertical atual
DIRECAO_ATUAL: .word 0        # -1 = esquerda, 0 = parado, 1 = direita
VEL_X_PULO:    .word 0        # impulso horizontal guardado no momento do salto

# --- Variáveis para música assíncrona ---
PROX_NOTA_TEMPO: .word 0         # Tempo exato (em ms) para tocar a próxima nota
NOTA_ATUAL_PTR:  .word NOTAS_1   # Ponteiro para a nota atual no array (Padrão: Fase 1)
NOTAS_TOCADAS:   .word 0         # Contador de notas já tocadas
FAIXA_ATUAL:     .word 1         # 1 = Mega Man, 2 = Mario
 
# ---- constantes do mapa/scroll (ajuste LARG_PERSONAGEM pro tamanho real do sprite) ----
.eqv MAP_LARGURA, 1692
.eqv TELA_LARGURA, 320
.eqv CAM_MAX, 1372          # 1692 - 320, calculado manualmente
.eqv LARG_PERSONAGEM, 48
.eqv VELOCIDADE, 4
.eqv PLAYER_X_MAX, 1644
.eqv PLAYER_Y_CHAO, 145       # mesma posição inicial que você já usava
.eqv IMPULSO_PULO, -13        # velocidade inicial pra cima (negativo = sobe)
.eqv GRAVIDADE, 1             # aceleração pra baixo a cada frame
.include "script/Imagens/imagens_convertidas/arquivos .data/start320x240.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/mapaFase1.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/megamanStill.data"
.include "MACROSv24.s"


# =========================================================
# Código
# =========================================================
.text
main:
	#O programa começa no menu
	j MENU

MENU:
	# Desenha a tela de menu
    	la a0, start320x240
    	li a1, 0
    	li a2, 0
    	li a3, 1
    	call PRINT

		li t0, 0xFF200604
		li t1, 1
		sw t1, 0(t0)

		j KEY_MENU
#-------------------------------------------------------------
#                          MÚSICA
#-------------------------------------------------------------
TOCA_MUSICA:
    # 1. Lê o tempo atual do sistema em milissegundos
    li a7, 30
    ecall
    mv t0, a0                 # t0 recebe o tempo atual (low bits)

    # 2. Verifica se já está na hora de tocar a próxima nota
    la t1, PROX_NOTA_TEMPO
    lw t2, 0(t1)              # t2 = tempo agendado para a próxima nota
    bltu t0, t2, FIM_TOCA_MUSICA # Se tempo_atual < tempo_agendado, sai

# 3. Descobre qual música está tocando (1, 2 ou 3)
    la t3, FAIXA_ATUAL
    lw t4, 0(t3)
    li t5, 1
    beq t4, t5, CARREGA_FAIXA_1
    li t5, 2
    beq t4, t5, CARREGA_FAIXA_2

CARREGA_FAIXA_3:
    la t1, NUM_3
    lw a5, 0(t1)              # Total de notas da música 3
    li a2, 30                 # Instrumento: Distortion Guitar 
    j VERIFICA_FIM_MUSICA

CARREGA_FAIXA_1:
    la t1, NUM_1
    lw a5, 0(t1)              # a5 = total de notas do Mega Man (52)
    li a2, 80                 # a2 = Instrumento (Square Wave)
    j VERIFICA_FIM_MUSICA

CARREGA_FAIXA_2:
    la t1, NUM_2
    lw a5, 0(t1)              # a5 = total de notas do Mario (41)
    li a2, 12                 # a2 = Instrumento (Marimba)

VERIFICA_FIM_MUSICA:
    # Verifica se a música atual acabou
    la t5, NOTAS_TOCADAS
    lw t6, 0(t5)              # t6 = notas já tocadas
    blt t6, a5, TOCA_NOTA     # Se ainda tem notas, vai tocar

    # --- LÓGICA DE TROCA DE MÚSICA --------
    li t6, 0                  # Zera o contador de notas
	sw t6, 0(t5)
    
    la t3, FAIXA_ATUAL
    lw t4, 0(t3)
    
    li t5, 1
    beq t4, t5, TROCA_PARA_2  # Se for 1, vai pra 2
    li t5, 2
    beq t4, t5, TROCA_PARA_1  # Se for 2, volta pra 1

REINICIA_3:                   # Se for 3, repete a 3 infinitamente
    la t1, NOTA_ATUAL_PTR
    la t2, NOTAS_3
    sw t2, 0(t1)
    j FIM_TOCA_MUSICA

TROCA_PARA_2:
    li t5, 2
    sw t5, 0(t3)              # FAIXA_ATUAL = 2
    la t1, NOTA_ATUAL_PTR
    la t2, NOTAS_2
    sw t2, 0(t1)
    j FIM_TOCA_MUSICA

TROCA_PARA_1:
    li t5, 1
    sw t5, 0(t3)              # FAIXA_ATUAL = 1
    la t1, NOTA_ATUAL_PTR
    la t2, NOTAS_1
    sw t2, 0(t1)
    j FIM_TOCA_MUSICA

TOCA_NOTA:
    # 4. Lê os dados da nota atual no ponteiro
    la t3, NOTA_ATUAL_PTR
    lw t4, 0(t3)              # t4 = endereço da nota
    lw a0, 0(t4)              # a0 = Tom da nota
    lw a1, 4(t4)              # a1 = Duração da nota
    
    # 5. Toca a nota
    li a3, 120                # a3 = Volume
    li a7, 31
    ecall                     # Toca a nota! (o instrumento 'a2' já foi definido lá em cima)

    # 6. Agenda a próxima nota
    add t2, t0, a1
    la t1, PROX_NOTA_TEMPO
    sw t2, 0(t1)              # Salva o novo tempo agendado

    # 7. Atualiza os ponteiros para a próxima passagem
    addi t4, t4, 8            # Avança 8 bytes no array
    sw t4, 0(t3)              # Salva o novo ponteiro da nota
    
    addi t6, t6, 1            # Incrementa o contador
    sw t6, 0(t5)              # Salva o novo contador

FIM_TOCA_MUSICA:
    ret
#---------------------------------------------------------------------------
#                     MÉTODO PARA DESENHAR NA TELA
#---------------------------------------------------------------------------
PRINT:	li t0,0xFF0		
	add t0,t0,a3			
	slli t0,t0,20				
	add t0,t0,a1			
	li t1,320			
	mul t1,t1,a2			
	add t0,t0,t1			
	addi t1,a0,8			
	mv t2,zero			
	mv t3,zero			
	lw t4,0(a0)			
	lw t5,4(a0)
PRINT_LINHA:	
	lw t6,0(t1)			
	sw t6,0(t0)			
	addi t0,t0,4			
	addi t1,t1,4 
	addi t3,t3,4			
	blt t3,t4,PRINT_LINHA		
	addi t0,t0,320			
	sub t0,t0,t4			
	mv t3,zero			
	addi t2,t2,1			
	bgt t5,t2,PRINT_LINHA		
	ret				# retorna
#---------------------------------------------------------------------------
#         PRINT_PERSONAGEM - 1 byte por pixel, transparência por pixel
#---------------------------------------------------------------------------
# a0 = imagem do personagem (header: largura, altura)
# a1 = x destino, a2 = y destino, a3 = frame
# a4 = valor de cinza considerado fundo (199 para o megamanStill)
#---------------------------------------------------------------------------
PRINT_PERSONAGEM:
	li t0,0xFF0
	add t0,t0,a3
	slli t0,t0,20
	add t0,t0,a1
	li t1,320
	mul t1,t1,a2
	add t0,t0,t1			# t0 = endereço destino inicial (1 byte/pixel)

	lw t4,0(a0)			# largura (48)
	lw t5,4(a0)			# altura (48)
	addi t1,a0,8			# t1 = ponteiro pros pixels (bytes)

	mv t2,zero			# contador de linhas
PP_LINHA:
	mv t3,zero			# contador de pixels na linha
PP_COPIA:
	lbu t6,0(t1)			# lê 1 pixel (1 byte)
	beq t6,a4,PP_PULA		# é fundo? pula esse pixel só
	sb t6,0(t0)			# não é fundo -> desenha só esse pixel
PP_PULA:
	addi t0,t0,1			# avança 1 pixel na tela
	addi t1,t1,1			# avança 1 pixel na fonte
	addi t3,t3,1
	blt t3,t4,PP_COPIA

	addi t0,t0,320
	sub t0,t0,t4			# volta pro início da próxima linha de tela
	mv t3,zero
	addi t2,t2,1
	bgt t5,t2,PP_LINHA
	ret
#---------------------------------------------------------------------------
#         MÉTODO PARA DESENHAR UMA JANELA (RECORTE) DE UMA
#         IMAGEM LARGA - usado pra rolar o mapa de 1692x240
#---------------------------------------------------------------------------
# a0 = imagem fonte (header: largura TOTAL, altura)
# a1 = x destino na tela
# a2 = y destino na tela
# a3 = frame (0 ou 1)
# a4 = deslocamento horizontal na fonte (camera_x)
# a5 = largura da janela a copiar (320)
PRINT_JANELA:
	li t0,0xFF0
	add t0,t0,a3
	slli t0,t0,20
	add t0,t0,a1
	li t1,320
	mul t1,t1,a2
	add t0,t0,t1			# t0 = endereço destino inicial
 
	lw t4,0(a0)			# largura TOTAL do mapa (stride da fonte)
	lw t5,4(a0)			# altura do mapa
	addi t1,a0,8
	add t1,t1,a4			# t1 = ponteiro fonte + offset da câmera
 
	mv t2,zero			# contador de linhas
PJ_LINHA:
	mv t3,zero			# contador de bytes copiados na linha
PJ_COPIA:
	lw t6,0(t1)
	sw t6,0(t0)
	addi t0,t0,4
	addi t1,t1,4
	addi t3,t3,4
	blt t3,a5,PJ_COPIA		# copia só a5 bytes (janela), não a linha toda
 
	addi t0,t0,320
	sub t0,t0,a5			# volta destino pro início da próxima linha DE TELA
 
	add t1,t1,t4
	sub t1,t1,a5			# avança fonte pelo resto da linha DO MAPA
 
	addi t2,t2,1
	bgt t5,t2,PJ_LINHA
	ret
#---------------------------------------------------------------------------
#                     MÉTODO PARA LIMPAR FRAMES
#---------------------------------------------------------------------------
# ---------------------------------------------------------
# LIMPA O FRAME 1
# ---------------------------------------------------------
LIMPAR_FRAME_1:
    	li t0, 0xFF100000      # EndereÃ§o base do frame 1
    	li t1, 19200           # 320x240 / 4 (pois usamos sw)
    	li t2, 0x00000000      # Cor preta
CLEAR_LOOP:
    	sw t2, 0(t0)
    	addi t0, t0, 4
    	addi t1, t1, -1
    	bnez t1, CLEAR_LOOP
    	ret
# ---------------------------------------------------------
# LIMPA O FRAME 0
# ---------------------------------------------------------
LIMPAR_FRAME_0:
    	li t0, 0xFF000000    # endereço base do frame 0
    	li t1, 19200
    	li t2, 0x00000000    # cor preta
CLEAR0_LOOP:
    	sw t2, 0(t0)
    	addi t0, t0, 4
    	addi t1, t1, -1
    	bnez t1, CLEAR0_LOOP
    	ret
# ---------------------------------------------------------
# LIMPA O FRAME INDICADO EM a3 (0 ou 1)
# usado no GAME_LOOP pra limpar o frame oculto antes de redesenhar
# ---------------------------------------------------------
LIMPAR_FRAME_ATIVO:
	li t0,0xFF0
	add t0,t0,a3
	slli t0,t0,20		# base do frame indicado (0xFF000000 ou 0xFF100000)
	li t1,19200
	li t2,0
LFA_LOOP:
	sw t2,0(t0)
	addi t0,t0,4
	addi t1,t1,-1
	bnez t1,LFA_LOOP
	ret
#-----------------------------------------------------------
#	             Controle do MENU
#-----------------------------------------------------------
# Loop para aguardar a tecla 's' para iniciar
KEY_MENU:	
		call TOCA_MUSICA
    	li t1, 0xFF200000       # Endereço de controle do KDMMIO
    	lw t6, 0(t1)            # Le bit de Controle Teclado
    	andi t6, t6, 0x0001     # Mascara o bit menos significativo
    	beq t6, zero, KEY_MENU  # Se não a tecla, continua no loop
    	lw t2, 4(t1)            # Le o valor da tecla
    	li t0, 's'
    	bne t2, t0, KEY_MENU    # Se não for 's', continua no loop
		# Se 's' foi pressionado, limpa a tela e vai para o setup do jogo
Interrompemusic:
    	call LIMPAR_FRAME_1      # Limpa o frame que estava sendo exibido
    	j Setup

Setup: 
	# Desenha o mapa nas duas frames
		la a0, mapaFase1
    	li a1, 0
    	li a2, 0
    	li a3, 0            # desenha no frame 0
    	call PRINT
    	li a3, 1            # desenha no frame 1
    	call PRINT
	# logica para musica durante  o jogo
		la t0, FAIXA_ATUAL
		li t1, 3
		sw t1, 0(t0)           # Define que agora toca a faixa 2 (Mario)
		
		la t0, NOTAS_TOCADAS
		sw zero, 0(t0)         # Zera o contador de notas para iniciar certo
		
		la t0, NOTA_ATUAL_PTR
		la t1, NOTAS_3
		sw t1, 0(t0)           # Aponta o ponteiro para a música 2
		
		la t0, PROX_NOTA_TEMPO
		sw zero, 0(t0)         # Zera o timer para a música tocar instantaneamente
    	j GAME_LOOP
#---------------------------------------------------------------------------
#         LOOP DO JOGO - lê teclado, move personagem/câmera,
#         redesenha o mapa (com scroll) e o personagem, troca de frame
#---------------------------------------------------------------------------
GAME_LOOP:
	call TOCA_MUSICA
	call MOVIMENTACAO
	# desenha no frame OCULTO (o oposto do que está sendo exibido)
	la t4, FRAME_ATIVO
	lw t5, 0(t4)
	xori s1, t5, 1            # s1 = frame oculto (onde vamos desenhar agora)
 
	mv a3, s1
	call LIMPAR_FRAME_ATIVO
 
	la a0, mapaFase1
	li a1, 0
	li a2, 0
	la t0, CAMERA_X
	lw a4, 0(t0)
	li a5, TELA_LARGURA
	mv a3, s1
	call PRINT_JANELA
 
	# NOVO: descomente quando tiver o sprite do personagem incluído
	la a0, megamanStill
	la t0, PLAYER_X
	lw t1, 0(t0)
	la t0, CAMERA_X
	lw t2, 0(t0)
	sub a1, t1, t2            # posição do personagem relativa à TELA
	la t0, PLAYER_Y
	lw a2, 0(t0)
	mv a3, s1
	li a4, 199
	call PRINT_PERSONAGEM
 
	# troca o frame exibido
	li t0, 0xFF200604
	sw s1, 0(t0)
	la t0, FRAME_ATIVO
	sw s1, 0(t0)
 
	li a0, 30
	li a7, 32
	ecall                      # pequena pausa (controla a velocidade do jogo)
 
	j GAME_LOOP
# ---------------------------------------------------------
# LÓGICA DE MOVIMENTAÇÃO
# ---------------------------------------------------------
MOVIMENTACAO:
	li t1, 0xFF200000
	lw t6, 0(t1)
	andi t6, t6, 1
	beqz t6, MV_PARADO        # nenhuma tecla -> considera "parado"

	lw t2, 4(t1)

	li t3, 'd'
	beq t2, t3, GL_DIREITA
	li t3, 'a'
	beq t2, t3, GL_ESQUERDA
	li t3, 'w'
	beq t2, t3, GL_PULA
	j MV_PARADO                # tecla lida não é d/a/w -> também é "parado"

GL_DIREITA:
	la t4, PLAYER_X
	lw t5, 0(t4)
	addi t5, t5, 4
	li t6, PLAYER_X_MAX
	ble t5, t6, GL_SALVA_DIR
	mv t5, t6
GL_SALVA_DIR:
	sw t5, 0(t4)
	la t4, DIRECAO_ATUAL
	li t5, 1
	sw t5, 0(t4)
	j MV_GRAVIDADE

GL_ESQUERDA:
	la t4, PLAYER_X
	lw t5, 0(t4)
	addi t5, t5, -4
	bge t5, zero, GL_SALVA_ESQ
	li t5, 0
GL_SALVA_ESQ:
	sw t5, 0(t4)
	la t4, DIRECAO_ATUAL
	li t5, -1
	sw t5, 0(t4)
	j MV_GRAVIDADE

GL_PULA:
	la t4, PULANDO
	lw t5, 0(t4)
	bnez t5, MV_GRAVIDADE          # já pulando -> ignora tecla nova
	li t5, 1
	sw t5, 0(t4)
	la t4, VEL_Y
	li t5, IMPULSO_PULO
	sw t5, 0(t4)

	# captura a direção atual como impulso horizontal do pulo
	la t4, DIRECAO_ATUAL
	lw t5, 0(t4)
	li t6, 3                        # velocidade horizontal do pulo
	mul t5, t5, t6
	la t4, VEL_X_PULO
	sw t5, 0(t4)
	j MV_GRAVIDADE
MV_PARADO:
	la t4, DIRECAO_ATUAL
	sw zero, 0(t4)                  # zera a direção -> pulo parado fica parado
	j MV_GRAVIDADE
MV_GRAVIDADE:
	la t4, PULANDO
	lw t5, 0(t4)
	beqz t5, ATUALIZA_CAMERA        # não pulando -> não mexe em Y nem no impulso

	# --- atualiza Y (gravidade) ---
	la t4, VEL_Y
	lw t5, 0(t4)
	la t6, PLAYER_Y
	lw t3, 0(t6)
	add t3, t3, t5
	addi t5, t5, GRAVIDADE
	sw t5, 0(t4)

	li t5, PLAYER_Y_CHAO
	ble t3, t5, MV_AR_HORIZONTAL
	li t3, PLAYER_Y_CHAO             # aterrissou
	la t4, PULANDO
	sw zero, 0(t4)
	la t4, VEL_Y
	sw zero, 0(t4)
	la t4, VEL_X_PULO
	sw zero, 0(t4)                    # zera o impulso ao tocar o chão
MV_AR_HORIZONTAL:
	sw t3, 0(t6)                        # salva PLAYER_Y

	# --- aplica o impulso horizontal guardado no pulo ---
	la t4, VEL_X_PULO
	lw t5, 0(t4)
	la t6, PLAYER_X
	lw t3, 0(t6)
	add t3, t3, t5
	bge t3, zero, MV_CHECA_MAX
	li t3, 0
	j MV_SALVA_X
MV_CHECA_MAX:
	li t5, PLAYER_X_MAX
	ble t3, t5, MV_SALVA_X
	li t3, PLAYER_X_MAX
MV_SALVA_X:
	sw t3, 0(t6)

ATUALIZA_CAMERA:
	la t4, PLAYER_X
	lw t5, 0(t4)
	addi t5, t5, -160
	bge t5, zero, AC_MAX_CHECK
	li t5, 0
	j AC_SALVA
AC_MAX_CHECK:
	li t6, CAM_MAX
	ble t5, t6, AC_SALVA
	li t5, CAM_MAX
AC_SALVA:
	la t4, CAMERA_X
	sw t5, 0(t4)
	ret
	
.data
.include "SYSTEMv24.s"
