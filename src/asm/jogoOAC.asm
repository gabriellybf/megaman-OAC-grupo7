# Sessão de dados
# Todas os includes de DADOS ficam aqui.
# =========================================================
.data
# Numero de Notas a tocar
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
 
# ---- constantes do mapa/scroll (ajuste LARG_PERSONAGEM pro tamanho real do sprite) ----
.eqv MAP_LARGURA, 1692
.eqv TELA_LARGURA, 320
.eqv CAM_MAX, 1372          # 1692 - 320, calculado manualmente
.eqv LARG_PERSONAGEM, 48
.eqv VELOCIDADE, 4
.eqv PLAYER_X_MAX, 1644
.include "\script\Imagens\imagens_convertidas\arquivos .data\start320x240.data"
.include "\script\Imagens\imagens_convertidas\arquivos .data\mapaFase1.data"
.include "\script\Imagens\imagens_convertidas\arquivos .data\megamanStill.data"
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
    	li t5, 's'
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
    	li t0, 's'
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
	li t1, 0xFF200000
	lw t6, 0(t1)
	andi t6, t6, 1
	beqz t6, GL_SEM_TECLA
 
	lw t2, 4(t1)
 
	li t3, 'd'
	beq t2, t3, GL_DIREITA
	li t3, 'a'
	beq t2, t3, GL_ESQUERDA
	j GL_SEM_TECLA
 
GL_DIREITA:
	la t4, PLAYER_X
	lw t5, 0(t4)
	addi t5, t5, 4    # VELOCIDADE (VELOCIDADE = 4)
	li t6, PLAYER_X_MAX
	ble t5, t6, GL_SALVA_DIR
	mv t5, t6
GL_SALVA_DIR:
	sw t5, 0(t4)
	j GL_ATUALIZA_CAMERA
 
GL_ESQUERDA:
	la t4, PLAYER_X
	lw t5, 0(t4)
	addi t5, t5, -4 #-VELOCIDADE (VELOCIDADE = 4)
	bge t5, zero, GL_SALVA_ESQ
	li t5, 0
GL_SALVA_ESQ:
	sw t5, 0(t4)
 
GL_ATUALIZA_CAMERA:
	la t4, PLAYER_X
	lw t5, 0(t4)
	addi t5, t5, -160   # TELA_LARGURA/2 = 320/2 = 160
	bge t5, zero, GL_CAM_MAX_CHECK
	li t5, 0
	j GL_SALVA_CAM
GL_CAM_MAX_CHECK:
	li t6, CAM_MAX
	ble t5, t6, GL_SALVA_CAM
	li t5, CAM_MAX
GL_SALVA_CAM:
	la t4, CAMERA_X
	sw t5, 0(t4)
 
GL_SEM_TECLA:
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
	call PRINT
 
	# troca o frame exibido
	li t0, 0xFF200604
	sw s1, 0(t0)
	la t0, FRAME_ATIVO
	sw s1, 0(t0)
 
	li a0, 30
	li a7, 32
	ecall                      # pequena pausa (controla a velocidade do jogo)
 
	j GAME_LOOP
	
.data
.include "SYSTEMv24.s"
