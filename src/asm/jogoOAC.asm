# Sessão de dados
# Todas os includes de DADOS ficam aqui.
# =========================================================
.data
# Numero de Notas a tocar
pulaL: .string "\n"
NUM: .word 125
# lista de nota,duraï¿½ï¿½o,nota,duraï¿½ï¿½o,nota,duraï¿½ï¿½o,...
NOTAS: 60,1150,48,115,48,57,48,57,48,1150,48,115,48,57,48,57,48,230,43,230,53,230,55,230,53,230,65,230,67,230,65,230,53,230,55,230,48,230,65,230,67,230,65,230,55,230,59,690,67,230,60,115,60,115,60,230,55,230,55,230,55,230
60,1200,67,1200,65,200,64,200,62,200,72,1200,67,600,65,200,64,200,62,200,72,1200,67,600,65,200,64,200,65,250,62,1500,55,50,55,100,55,100,60,1200,67,1200,65,200,64,200,62,200,72,1200,67,600,65,200,64,200,62,200,72,1200,67,600,65,200,64,200,65,200,62,1200,55,200,55,200,55,200
57,927,57,309,65,309,64,309,62,309,60,309,60,206,62,206,64,206,62,412,57,206,59,618,55,412,55,206,57,1236,65,309,64,309,62,309,60,309,67,618,62,1545,55,309,57,1236,65,309,64,309,62,309,60,309,60,206,62,206,64,206,62,412,57,206,59,618,67,412,67,206,72,412,71,206,69,412,67,206,65,412,64,206,62,412,60,206,67,618,43,412,43,103,43,103,43,618,55,309,55,103,55,103,55,103,57,927,60,309,65,618,62,618
# ---- estado do jogo ----
PLAYER_X:     .word 0        # posição do personagem no MUNDO (0 .. MAP_LARGURA-LARG_PERSONAGEM)
PLAYER_Y:     .word 145      # posição vertical na tela (0 .. 240-ALT_PERSONAGEM)
CAMERA_X:     .word 0        # deslocamento da câmera dentro do mapa
FRAME_ATIVO:  .word 0        # frame atualmente exibido (0 ou 1)
PULANDO:      .word 0        # 0 = no chão, 1 = no ar
VEL_Y:        .word 0        # velocidade vertical atual
DIRECAO_ATUAL: .word 0        # -1 = esquerda, 0 = parado, 1 = direita
VEL_X_PULO:    .word 0        # impulso horizontal guardado no momento do salto
VIDAS:        .word 3        # vidas atuais do jogador
VIDAS_MAX:    .word 4        # vidas máximas (usado pra desenhar os "espaços vazios" se quiser)
POWERUP_X:      .word 400       # posição no MUNDO (mesmo sistema de coordenadas do PLAYER_X)
POWERUP_Y:      .word 100       # posição vertical na tela (mesmo sistema do PLAYER_Y)
POWERUP_ATIVO:  .word 1         # 1 = ainda disponível na fase, 0 = já foi coletado (some)
# ---- animação do personagem ----
FACING:       .word 1        # 1 = direita, -1 = esquerda (direção que o personagem está olhando; NÃO zera quando solta a tecla)
ANIM_TIMER:   .word 0        # contador de ciclos do GAME_LOOP até trocar de frame
ANIM_FRAME:   .word 0        # 0 ou 1 - qual dos 2 frames da animação atual está ativo
.eqv ANIM_VELOCIDADE, 6      # troca de frame a cada 6 iterações do GAME_LOOP (ajuste pra mais rápido/devagar)
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
.include "script/Imagens/imagens_convertidas/arquivos .data/48x48megamanrunninghero.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/Run1.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/RunL1.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/RunL2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/Jump-2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/Jump-1.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/coracao.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/cura.data"
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
#-------------------------------------------------------------
#                          MÚSICA
#-------------------------------------------------------------
    	li s0, 1
    	li t0, 0xFF200604
    	sw s0, 0(t0)
       	la s0,NUM		# define o endereï¿½o do nï¿½mero de notas
	lw s1,0(s0)		# le o numero de notas
	la s0,NOTAS		# define o endereï¿½o das notas
	li t0,0			# zera o contador de notas
	li a2,68		# define o instrumento
	li a3,127		# define o volume

LOOP:	beq t0,s1, FIMmusic		# contador chegou no final? entï¿½o  vï¿½ para FIM
	lw a0,0(s0)		# le o valor da nota
	lw a1,4(s0)		# le a duracao da nota
	li a7,31		# define a chamada de syscall
	ecall			# toca a nota
	 # Espera personalizada com checagem de tecla
    	li t1, 10
MUSIC_WAIT:
    	li t2, 0xFF200000       # Endereço KDMMIO
    	lw t3, 0(t2)
    	andi t3, t3, 1
    	beqz t3, SEM_TECLA
    	lw t4, 4(t2)
    	li t5, '\n'
    	beq t4, t5, Interrompemusic
SEM_TECLA:
    	addi t1, t1, -1
    	bnez t1, MUSIC_WAIT
    	mv a0,a1		# passa a duraï¿½ï¿½o da nota para a pausa
	li a7,32		# define a chamada de syscal 
	ecall			# realiza uma pausa de a0 ms
	addi s0,s0,8		# incrementa para o endereï¿½o da prï¿½xima nota
	addi t0,t0,1		# incrementa o contador de notas
	j LOOP			# volta ao loop
	
FIMmusic:	j KEY_MENU
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
    	li t1, 0xFF200000       # Endereço de controle do KDMMIO
    	lw t6, 0(t1)            # Le bit de Controle Teclado
    	andi t6, t6, 0x0001     # Mascara o bit menos significativo
    	beq t6, zero, KEY_MENU  # Se não a tecla, continua no loop
    	lw t2, 4(t1)            # Le o valor da tecla
    	li t0, '\n'
    	bne t2, t6, KEY_MENU    # Se não for 's', continua no loop
# Se 's' foi pressionado, limpa a tela e vai para o setup do jogo
Interrompemusic:
    	call LIMPAR_FRAME_1      # Limpa o frame que estava sendo exibido
    	j Setup

Setup: 
	#Desenha o mapa nas duas frames
	la a0, mapaFase1
    	li a1, 0
    	li a2, 0
    	li a3, 0            # desenha no frame 0
    	call PRINT
    	li a3, 1            # desenha no frame 1
    	call PRINT
    	j GAME_LOOP
#---------------------------------------------------------------------------
#         LOOP DO JOGO - lê teclado, move personagem/câmera,
#         redesenha o mapa (com scroll) e o personagem, troca de frame
#---------------------------------------------------------------------------
GAME_LOOP:
	call MOVIMENTACAO
	call CHECA_COLISAO_POWERUP
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

	# desenha o personagem já animado (corrida/pulo escolhidos em ESCOLHE_SPRITE)
	call ATUALIZA_ANIMACAO
	call ESCOLHE_SPRITE        # a0 já vem com o sprite certo escolhido
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
	call DESENHA_POWERUP
	call DESENHA_HUD 
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
	la t4, FACING              # atualiza pra onde o personagem está olhando
	sw t5, 0(t4)                # FACING = 1 (direita)
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
	la t4, FACING               # atualiza pra onde o personagem está olhando
	sw t5, 0(t4)                 # FACING = -1 (esquerda)
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
#---------------------------------------------------------------------------
#         ATUALIZA_ANIMACAO - avança o contador e alterna o frame
#         (só anima se estiver correndo ou pulando; parado fica fixo)
#---------------------------------------------------------------------------
ATUALIZA_ANIMACAO:
	la t0, DIRECAO_ATUAL
	lw t1, 0(t0)
	la t0, PULANDO
	lw t2, 0(t0)
	bnez t1, AA_ANIMA
	bnez t2, AA_ANIMA

	# parado e no chão -> zera timer e frame
	la t0, ANIM_TIMER
	sw zero, 0(t0)
	la t0, ANIM_FRAME
	sw zero, 0(t0)
	ret
AA_ANIMA:
	la t0, ANIM_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, ANIM_VELOCIDADE
	blt t1, t2, AA_SALVA
	li t1, 0
	la t3, ANIM_FRAME
	lw t4, 0(t3)
	xori t4, t4, 1
	sw t4, 0(t3)
AA_SALVA:
	sw t1, 0(t0)
	ret
#---------------------------------------------------------------------------
#         ESCOLHE_SPRITE - decide qual sprite desenhar
#         retorna o endereço do sprite escolhido em a0
#---------------------------------------------------------------------------
ESCOLHE_SPRITE:
	la t0, PULANDO
	lw t1, 0(t0)
	bnez t1, ES_PULO

	la t0, DIRECAO_ATUAL
	lw t1, 0(t0)
	beqz t1, ES_PARADO
	bgtz t1, ES_CORRE_DIR
	j ES_CORRE_ESQ

ES_PARADO:
	la a0, megamanStill
	ret

ES_CORRE_DIR:
	la t0, ANIM_FRAME
	lw t1, 0(t0)
	beqz t1, ES_DIR1
	la a0, megamanrunninghero
	ret
ES_DIR1:
	la a0, run1
	ret

ES_CORRE_ESQ:
	la t0, ANIM_FRAME
	lw t1, 0(t0)
	beqz t1, ES_ESQ1
	la a0, RunL2
	ret
ES_ESQ1:
	la a0, RunL1
	ret

ES_PULO:
	la t0, FACING
	lw t1, 0(t0)
	la t2, ANIM_FRAME
	lw t3, 0(t2)
	bgtz t1, ES_PULO_DIR
	j ES_PULO_ESQ
ES_PULO_DIR:
	beqz t3, ES_PULO_DIR1
	la a0, Jump2
	ret
ES_PULO_DIR1:
	la a0, Jump1
	ret
ES_PULO_ESQ:
	beqz t3, ES_PULO_ESQ1
	la a0, Jump2
	ret
ES_PULO_ESQ1:
	la a0, Jump1
	ret
#---------------------------------------------------------------------------
#                     HUD DE VIDAS (canto superior esquerdo)
#---------------------------------------------------------------------------
DESENHA_HUD:
	addi sp, sp, -4
	sw ra, 0(sp)          # salva o endereço de retorno ANTES de chamar outra função

	la t0, VIDAS
	lw s2, 0(t0)          # vidas restantes
	li s3, 0              # contador de ícones desenhados
	li s4, 4              # x inicial (margem esquerda da tela)
DH_LOOP:
	beq s3, s2, DH_FIM
	la a0, coracao
	mv a1, s4
	li a2, 4              # y (margem do topo)
	mv a3, s1             # frame oculto atual (vem do GAME_LOOP)
	li a4, 199            # cor de fundo transparente do ícone
	call PRINT_PERSONAGEM
	addi s4, s4, 34
	addi s3, s3, 1
	j DH_LOOP
DH_FIM:
	lw ra, 0(sp)           # restaura o endereço de retorno certo
	addi sp, sp, 4
	ret
#---------------------------------------------------------------------------
#                     DESENHA O POWER-UP DE CURA (se ainda não foi pego)
#---------------------------------------------------------------------------
DESENHA_POWERUP:
	addi sp, sp, -4
	sw ra, 0(sp)

	la t0, POWERUP_ATIVO
	lw t1, 0(t0)
	beqz t1, DP_FIM

	la a0, cura
	la t0, POWERUP_X
	lw t1, 0(t0)
	la t0, CAMERA_X
	lw t2, 0(t0)
	sub a1, t1, t2
	bltz a1, DP_FIM
	li t5, TELA_LARGURA
	bge a1, t5, DP_FIM

	la t0, POWERUP_Y
	lw a2, 0(t0)
	mv a3, s1
	li a4, 199
	call PRINT_PERSONAGEM
DP_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret
#---------------------------------------------------------------------------
#      CHECA_COLISAO_POWERUP - personagem encostou no power-up de cura?
#---------------------------------------------------------------------------
CHECA_COLISAO_POWERUP:
	la t0, POWERUP_ATIVO
	lw t1, 0(t0)
	beqz t1, CP_FIM                 # já foi coletado, não checa mais

	la t0, cura
	lw t6, 0(t0)                    # largura do power-up
	lw t2, 4(t0)                    # altura do power-up
	
	# --- eixo X ---
	la t0, PLAYER_X
	lw t3, 0(t0)                    # player x
	la t0, POWERUP_X
	lw t4, 0(t0)                    # powerup x

	add t5, t4, t6                  # powerup_x + largura
	bge t3, t5, CP_FIM                # player totalmente à direita -> sem colisão

	li t5, LARG_PERSONAGEM
	add t5, t3, t5                    # player_x + largura do personagem
	ble t5, t4, CP_FIM                  # player totalmente à esquerda -> sem colisão

	# --- eixo Y ---
	la t0, PLAYER_Y
	lw t3, 0(t0)                        # player y
	la t0, POWERUP_Y
	lw t4, 0(t0)                        # powerup y

	add t5, t4, t2                      # powerup_y + altura
	bge t3, t5, CP_FIM                    # player totalmente abaixo -> sem colisão

	li t5, LARG_PERSONAGEM                # personagem é quadrado (48x48), reaproveita como altura
	add t5, t3, t5
	ble t5, t4, CP_FIM                      # player totalmente acima -> sem colisão

	# --- colidiu! cura se não estiver no máximo ---
	la t0, VIDAS
	lw t1, 0(t0)
	la t4, VIDAS_MAX
	lw t4, 0(t4)
	bge t1, t4, CP_REMOVE            # vida já no máximo -> só remove o power-up mesmo assim
	addi t1, t1, 1
	sw t1, 0(t0)
CP_REMOVE:
	la t0, POWERUP_ATIVO
	sw zero, 0(t0)                     # some da tela (não desenha mais, não colide mais)
CP_FIM:
	ret
.data
.include "SYSTEMv24.s"