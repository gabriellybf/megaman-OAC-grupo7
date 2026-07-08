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

.include "\script\Imagens\imagens_convertidas\arquivos .data\start320x240.data"
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

Setup: li a7,10
	ecall
	
.data
.include "SYSTEMv24.s"