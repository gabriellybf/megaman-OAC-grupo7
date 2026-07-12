# Sessão de dados
# Todas os includes de DADOS ficam aqui.
# =========================================================
.data
# ======== MUSICA MEGA MAN ===========
# Numero de Notas a tocar
NUM_1: .word 52
# lista de nota,duraï¿½ï¿½o,nota,duraï¿½ï¿½o,nota,duraï¿½ï¿½o,...
NOTAS_1: .word 60,166,64,83,64,83,64,166,64,83,64,83,64,166,60,332,60,83,60,83,64,166,64,83,64,83,64,166,60,332,67,166,65,166,67,332,64,83,64,83,64,166,64,83,64,83,64,166,60,332,67,332,65,332,64,332,65,499,65,83,65,83,65,166,65,83,65,83,65,166,62,332,67,332,65,332,64,332,62,332,60,332,60,166,67,166,71,166,73,499,60,332,60,166,67,166,71,166,70,332,74,166,76,166
# ======== MUSICA MARIO
NUM_2: .word 41
NOTAS_2: .word 76,150,76,300,76,300,72,150,76,300,79,600,55,600,72,450,67,450,64,450,69,300,71,300,70,150,69,300,67,201,76,197,79,201,81,300,77,150,79,300,76,300,72,150,74,150,71,450,72,450,67,450,64,450,69,300,71,300,70,150,69,300,67,201,76,198,79,201,81,300,77,150,79,300,76,300,72,150,74,150,71,150
# ======== MUSICA GAME LOOP ===========

NUM_3: .word 42
NOTAS_3: .word 72,211,83,139,72,143,83,562,81,634,74,211,84,139,74,143,84,562,83,634,72,211,83,139,72,143,83,562,81,423,84,283,81,279,77,283,76,423,74,634,72,211,83,139,72,143,83,562,81,634,74,211,84,139,74,143,84,562,83,634,72,211,83,139,72,143,83,562,81,423,74,210,76,211,77,211,79,422,91,105,93,105,91,317
pulaL: .string "\n"

# --- Variáveis para música assíncrona ---
PROX_NOTA_TEMPO: .word 0         # Tempo exato (em ms) para tocar a próxima nota
NOTA_ATUAL_PTR:  .word NOTAS_1   # Ponteiro para a nota atual no array (Padrão: Fase 1)
NOTAS_TOCADAS:   .word 0         # Contador de notas já tocadas
FAIXA_ATUAL:     .word 1         # define qual faixa tocar

# ---- estado do jogo ----
PLAYER_X:     .word 0        # posição do personagem no MUNDO (0 .. MAP_LARGURA-LARG_PERSONAGEM)
PLAYER_Y:     .word 145      # posição vertical na tela (0 .. 240-ALT_PERSONAGEM)
CAMERA_X:     .word 0        # deslocamento da câmera dentro do mapa
FRAME_ATIVO:  .word 0        # frame atualmente exibido (0 ou 1)
PULANDO:      .word 0        # 0 = no chão, 1 = no ar
VEL_Y:        .word 0        # velocidade vertical atual
DIRECAO_ATUAL: .word 0        # -1 = esquerda, 0 = parado, 1 = direita
VEL_X_PULO:    .word 0        # impulso horizontal guardado no momento do salto
BATEU_TETO:    .word 0        # 1 = nesse frame o personagem bateu a cabeça num bloco sólido/mystery box
VIDAS:        .word 3        # vidas atuais do jogador
VIDAS_MAX:    .word 4        # vidas máximas (usado pra desenhar os "espaços vazios" se quiser)
POWERUP_X:      .word 400       # posição no MUNDO (mesmo sistema de coordenadas do PLAYER_X)
POWERUP_Y:      .word 100       # posição vertical na tela (mesmo sistema do PLAYER_Y)
POWERUP_ATIVO:  .word 1         # 1 = ainda disponível na fase, 0 = já foi coletado (some)
Y_TENTATIVA:        .word 0
VELY_TMP:           .word 0
PLAYER_X_CANDIDATO: .word 0
INVENCIVEL_TIMER: .word 0	# para ele não morrer assim que encostar no inimigo
TELA_FASE2_MOSTRADA: .word 0     # evita ficar re-disparando a transição
FASE_ATUAL:          .word 1    # 1 = fase 1, 2 = fase 2
MAPA_ATUAL_PTR:     .word 0     # vai guardar o endereço da imagem do mapa em uso
COLISAO_ATUAL_PTR:  .word 0     # vai guardar o endereço da matriz de colisão em uso
TILES_LARGURA_ATUAL: .word 141    
PLAYER_X_MAX_ATUAL:  .word 1644    
CAM_MAX_ATUAL:        .word 1372    
PLAYER_Y_CHAO_ATUAL:  .word 145      # ajustar pra fase 2
# ---- animação do personagem ----
FACING:       .word 1        # 1 = direita, -1 = esquerda (direção que o personagem está olhando; NÃO zera quando solta a tecla)
ANIM_TIMER:   .word 0        # contador de ciclos do GAME_LOOP até trocar de frame
ANIM_FRAME:   .word 0        # 0 ou 1 - qual dos 2 frames da animação atual está ativo
.eqv ANIM_VELOCIDADE, 6      # troca de frame a cada 6 iterações do GAME_LOOP (ajuste pra mais rápido/devagar)

# ---- ataques ----
ARMA_ATUAL:   .word 0        # 0 = projétil (tiro), 1 = soco (melee) - trocado com a tecla Q
ATACANDO:     .word 0        # 1 enquanto a pose/animação de ataque está tocando
ATAQUE_TIMER: .word 0        # contador regressivo da duração do ataque atual
.eqv ATAQUE_DURACAO, 10       # quantos ciclos do GAME_LOOP a pose de ataque fica na tela
TIRO_ATIVO:    .word 0        # 1 = tem projétil voando na tela agora
TIRO_X:        .word 0        # posição do projétil no MUNDO (mesmo sistema do PLAYER_X)
TIRO_Y:        .word 0        # posição vertical do projétil na tela
TIRO_DIRECAO:  .word 1        # direção que o projétil está viajando (1 = direita, -1 = esquerda)
TIRO_DIST:     .word 0        # quantos pixels o projétil já percorreu desde que foi disparado
.eqv TIRO_VELOCIDADE, 8       # <-- CONTROLA A VELOCIDADE: pixels que o projétil anda por ciclo (aumente pra ele ir mais rápido)
.eqv TIRO_ALCANCE, 150        # <-- CONTROLA A DURAÇÃO/ALCANCE: quantos pixels o projétil viaja até sumir (aumente pra ele ir mais longe)

# ---- INIMIGO: planta piranha -----
.eqv TAM_INIMIGO_PLANTA, 12      # 3 words = 12 bytes
NUM_PLANTAS: .word 3
PLANTAS:
# planta 1
.word 526     # x
.word 128     # y
.word 2       # vida
# planta 2
.word 886
.word 128
.word 2
# planta 3
.word 1347
.word 133
.word 2
PLANTA_FRAME:	.word 0		# sprite atual (0 ou 1)
PLANTA_TIMER:	.word 0		# contador

# ---- INIMIGO2---------
.eqv TAM_INIMIGO_ANDADOR, 20    # 5 words = 20 bytes
NUM_ANDADORES: .word 2
ANDADORES:
# andador 1
.word 200     # x mundo
.word 145     # y tela
.word 2       # vida
.word 1       # direcao (1=direita, -1=esquerda)
.word 200     # x_min (limite esquerdo da patrulha)
#andador 2 
.word 1000   # x → perto do final do mapa
.word 145    # y → mesmo nível do chão, não muda
.word 2      # vida
.word -1     # direcao (começa indo para esquerda)
.word 1450   # x_min (patrulha de 1450 até 1550)

ANDADOR_FRAME:  .word 0
ANDADOR_TIMER:  .word 0
# ---- constantes do mapa/scroll (ajuste LARG_PERSONAGEM pro tamanho real do sprite) ----
.eqv MAP_LARGURA, 1692
.eqv TELA_LARGURA, 320
.eqv CAM_MAX, 1372          # 1692 - 320, calculado manualmente
.eqv LARG_PERSONAGEM, 48
.eqv LARG_PERSONAGEM2, 24
.eqv VELOCIDADE, 4
.eqv PLAYER_X_MAX, 1644
.eqv PLAYER_Y_CHAO, 145       # mesma posição inicial que você já usava
.eqv IMPULSO_PULO, -13        # velocidade inicial pra cima (negativo = sobe)
.eqv GRAVIDADE, 1             # aceleração pra baixo a cada frame
.eqv TILE_SIZE, 12
.eqv TILES_LARGURA, 141        # MAP_LARGURA (1692) / TILE_SIZE
.eqv TILES_ALTURA, 20           # 240 / TILE_SIZE
# Valores possíveis dentro da matriz:
#   0 = nada (vazio, personagem passa livre)
#   1 = bloco sólido (chão, plataforma, cano, parede)
#   2 = mystery box - sai o power-up de CURA
#   3 = mystery box - sai o SEGUNDO power-up (a implementar)
#   4 = porta pra próxima fase
#   5 = mystery box JÁ USADA (vira sólida e "vazia")
MAPA_COLISAO:
    .byte 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1    
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,0,0
    .byte 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,4,4,4,4,4,1,1
    .byte 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
    .byte 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
    .byte 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
MAPA_COLISAO2:
    .byte 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,0,0,0
    .byte 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
    .byte 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
    .byte 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
    .byte 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
.include "script/Imagens/imagens_convertidas/arquivos .data/start320x240.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/mapaFase1.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/megamanStill.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/48x48megamanrunninghero.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/Run1.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/RunL1.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/RunL2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/Jump-2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/Jump-1.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/TiroL.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/TiroR.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/socoesq.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/socodir.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/fire.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/coracao.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/cura.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/fireesq.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/planta1.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/planta2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/final.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/fase2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/mapaFase2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/inimigoR1.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/inimigoR2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/inimigoL1.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/inimigoL2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/youwin.data"
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
    li a2, 11                
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
    	li t0, 0xFF100000      # Endereço base do frame 1
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
    	beq t6, zero, KM_ESPERA # Se não a tecla, faz a pausa e continua no loop
    	lw t2, 4(t1)            # Le o valor da tecla
    	li t0, '\n'
    	beq t2, t0, Interrompemusic  # Se for Enter, sai do menu

KM_ESPERA:
    	li a0, 10
    	li a7, 32
    	ecall                    # pausa curta pra não martelar o TOCA_MUSICA
    	j KEY_MENU
    	
Interrompemusic:
    	call LIMPAR_FRAME_1      # Limpa o frame que estava sendo exibido
    	j Setup
 
Setup:
	la t0, mapaFase1
	la t1, MAPA_ATUAL_PTR
	sw t0, 0(t1)
	la t0, MAPA_COLISAO
	la t1, COLISAO_ATUAL_PTR
	sw t0, 0(t1)

	li t0, 141
	la t1, TILES_LARGURA_ATUAL
	sw t0, 0(t1)
	li t0, 1644
	la t1, PLAYER_X_MAX_ATUAL
	sw t0, 0(t1)
	li t0, 1372
	la t1, CAM_MAX_ATUAL
	sw t0, 0(t1)
	li t0, 145
	la t1, PLAYER_Y_CHAO_ATUAL
	sw t0, 0(t1)

	la a0, mapaFase1
  li a1, 0
  li a2, 0
  li a3, 0
  call PRINT
  li a3, 1
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
	call CHECA_BATIDA_BLOCO  
	call CHECA_COLISAO_POWERUP
	call CHECA_PORTA   
	call CHECA_COLISAO_PLANTAS
	call CHECA_TIRO_PLANTAS
	call CHECA_TIRO_ANDADORES
	call CHECA_COLISAO_ANDADORES
	call ATUALIZA_ANDADORES
	call CHECA_SOCO_PLANTAS
	call CHECA_SOCO_ANDADORES
	
	# desenha no frame OCULTO (o oposto do que está sendo exibido)
	la t4, FRAME_ATIVO
	lw t5, 0(t4)
	xori s1, t5, 1            # s1 = frame oculto (onde vamos desenhar agora)
 
	mv a3, s1
	call LIMPAR_FRAME_ATIVO
 
	la t0, MAPA_ATUAL_PTR
	lw a0, 0(t0)
	li a1, 0
	li a2, 0
	la t0, CAMERA_X
	lw a4, 0(t0)
	li a5, TELA_LARGURA
	mv a3, s1
	call PRINT_JANELA
 
	# NOVO: descomente quando tiver o sprite do personagem incluído
	la a0, megamanStill

	# desenha o personagem já animado (corrida/pulo/ataque escolhidos em ESCOLHE_SPRITE)
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
	call ATUALIZA_ATAQUE
	call DESENHA_TIRO
	call DESENHA_POWERUP
	call DESENHA_HUD 
	
	call ATUALIZA_PLANTA
	call DESENHA_PLANTAS
	call DESENHA_ANDADORES
	
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
	addi sp, sp, -4
	sw ra, 0(sp)              # salva o ra ANTES de qualquer call interno
	la t4, BATEU_TETO
	sw zero, 0(t4)             # reseta a flag no começo de todo frame
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
	li t3, 'e'
	beq t2, t3, GL_ATAQUE
	li t3, 'q'                 # tecla para troca de ataque 
	beq t2, t3, GL_TROCA_ARMA
	j MV_PARADO                # tecla lida não é d/a/w/e/q -> também é "parado"

GL_DIREITA:
	la t4, PLAYER_X
	lw t5, 0(t4)
	addi t5, t5, 4
	la t6, PLAYER_X_MAX_ATUAL
	lw t6, 0(t6)  
	ble t5, t6, GL_DIR_CLAMP_OK
	mv t5, t6
GL_DIR_CLAMP_OK:
	la t4, PLAYER_X_CANDIDATO
	sw t5, 0(t4)
 
	addi a0, t5, 47          # borda direita do personagem
	la t0, PLAYER_Y
	lw a1, 0(t0)
	call CHECA_LINHA_V
 
	la t4, PLAYER_X_CANDIDATO
	lw t5, 0(t4)
	beqz a0, GL_DIR_ACEITA
	la t4, PLAYER_X
	lw t5, 0(t4)              # colidiu -> mantém X antigo
GL_DIR_ACEITA:
	la t4, PLAYER_X
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
	bge t5, zero, GL_ESQ_CLAMP_OK
	li t5, 0
GL_ESQ_CLAMP_OK:
	la t4, PLAYER_X_CANDIDATO
	sw t5, 0(t4)
 
	mv a0, t5                # borda esquerda do personagem
	la t0, PLAYER_Y
	lw a1, 0(t0)
	call CHECA_LINHA_V
 
	la t4, PLAYER_X_CANDIDATO
	lw t5, 0(t4)
	beqz a0, GL_ESQ_ACEITA
	la t4, PLAYER_X
	lw t5, 0(t4)
GL_ESQ_ACEITA:
	la t4, PLAYER_X
	sw t5, 0(t4)
	la t4, DIRECAO_ATUAL
	li t5, -1
	sw t5, 0(t4)
	j MV_GRAVIDADE
	
GL_SALVA_DIR:
	sw t5, 0(t4)
	la t4, DIRECAO_ATUAL
	li t5, 1
	sw t5, 0(t4)
	j MV_GRAVIDADE
 
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

GL_ATAQUE:
	la t4, ATAQUE_TIMER
	lw t5, 0(t4)
	bnez t5, MV_GRAVIDADE          # já tem um ataque tocando -> ignora tecla nova

	li t5, ATAQUE_DURACAO
	sw t5, 0(t4)
	la t4, ATACANDO
	li t5, 1
	sw t5, 0(t4)

	la t4, ARMA_ATUAL
	lw t5, 0(t4)
	bnez t5, MV_GRAVIDADE            # arma = 1 (soco) -> só a pose já resolve, sem projétil

	# arma = 0 (projétil) -> dispara um tiro, se não houver outro na tela
	la t4, TIRO_ATIVO
	lw t6, 0(t4)
	bnez t6, MV_GRAVIDADE             # já tem projétil voando -> não dispara outro
	li t6, 1
	sw t6, 0(t4)
	la t4, PLAYER_X
	lw t6, 0(t4)
	la t4, TIRO_X
	sw t6, 0(t4)                       # <-- POSIÇÃO INICIAL X: o projétil nasce na posição atual do personagem
	la t4, PLAYER_Y
	lw t6, 0(t4)
	la t4, TIRO_Y
	sw t6, 0(t4)                       # <-- POSIÇÃO INICIAL Y: o projétil nasce na mesma altura do personagem
	la t4, FACING
	lw t6, 0(t4)
	la t4, TIRO_DIRECAO
	sw t6, 0(t4)                       # <-- DIREÇÃO DO PROJÉTIL: copia o FACING (lado que o personagem está olhando)
	la t4, TIRO_DIST
	sw zero, 0(t4)                     # <-- ZERA A DISTÂNCIA PERCORRIDA (começa a contar do zero pro alcance máximo)
	j MV_GRAVIDADE

GL_TROCA_ARMA:
	la t4, ARMA_ATUAL
	lw t5, 0(t4)
	xori t5, t5, 1                  # alterna entre 0 (projétil) e 1 (soco)
	sw t5, 0(t4)
	j MV_GRAVIDADE
MV_PARADO:
	la t4, DIRECAO_ATUAL
	sw zero, 0(t4)                  # zera a direção -> pulo parado fica parado
	j MV_GRAVIDADE
MV_GRAVIDADE:
	la t4, PULANDO
	lw t5, 0(t4)
	bnez t5, MV_GRAV_CONTINUA
 
	# não está "pulando" -> mas ainda tem chão embaixo dos pés?
	la t0, PLAYER_X
	lw a0, 0(t0)
	la t0, PLAYER_Y
	lw a1, 0(t0)
	addi a1, a1, 48
	call CHECA_LINHA_H
	bnez a0, ATUALIZA_CAMERA        # tem chão -> não faz nada
 
	# não tem chão -> começa a cair (saiu da borda de uma plataforma)
	la t4, PULANDO
	li t5, 1
	sw t5, 0(t4)
	la t4, VEL_Y
	sw zero, 0(t4)
 
MV_GRAV_CONTINUA:
	la t4, VEL_Y
	lw t5, 0(t4)
	la t6, PLAYER_Y
	lw t3, 0(t6)
	add t3, t3, t5                 # t3 = Y tentativa
 
	la t0, Y_TENTATIVA
	sw t3, 0(t0)
	la t0, VELY_TMP
	sw t5, 0(t0)
 
	bltz t5, MV_CHECA_TETO
 
MV_CHECA_CHAO:
	la t0, PLAYER_X
	lw a0, 0(t0)
	la t0, Y_TENTATIVA
	lw a1, 0(t0)
	addi a1, a1, 48                # linha dos pés na posição tentativa
	call CHECA_LINHA_H
	beqz a0, MV_SEM_COLISAO_BAIXO
 
	# aterrissou em cima de um bloco/chão -> encaixa no topo do tile
	la t0, PLAYER_X
	lw a0, 0(t0)
	la t0, Y_TENTATIVA
	lw a1, 0(t0)
	addi a1, a1, 48
	li t1, TILE_SIZE
	div t2, a1, t1
	mul t2, t2, t1                  # topo do tile em pixels
	addi t3, t2, -48                 # Y final do personagem
 
	la t4, PULANDO
	sw zero, 0(t4)
	la t4, VEL_Y
	sw zero, 0(t4)
	la t4, VEL_X_PULO
	sw zero, 0(t4)
	j MV_AR_HORIZONTAL
 
MV_SEM_COLISAO_BAIXO:
	la t0, Y_TENTATIVA
	lw t3, 0(t0)
	la t0, VELY_TMP
	lw t5, 0(t0)
	addi t5, t5, GRAVIDADE
	la t4, VEL_Y
	sw t5, 0(t4)
	j MV_CHAO_FIXO
 
MV_CHECA_TETO:
	la t0, PLAYER_X
	lw a0, 0(t0)
	la t0, Y_TENTATIVA
	lw a1, 0(t0)
	call CHECA_LINHA_H
	beqz a0, MV_SEM_COLISAO_CIMA
 
	# bateu a cabeça -> para de subir
	la t0, PLAYER_Y
	lw t3, 0(t0)
	la t4, VEL_Y
	sw zero, 0(t4)
	la t4, BATEU_TETO
	li t5, 1
	sw t5, 0(t4)               # marca que bateu o teto NESSE frame
	j MV_AR_HORIZONTAL
 
MV_SEM_COLISAO_CIMA:
	la t0, Y_TENTATIVA
	lw t3, 0(t0)
	la t0, VELY_TMP
	lw t5, 0(t0)
	addi t5, t5, GRAVIDADE
	la t4, VEL_Y
	sw t5, 0(t4)
 
MV_CHAO_FIXO:
    la t5, PLAYER_Y_CHAO_ATUAL      # ANTES: li t5, PLAYER_Y_CHAO
    lw t5, 0(t5)
    ble t3, t5, MV_AR_HORIZONTAL
    la t3, PLAYER_Y_CHAO_ATUAL      # ANTES: li t3, PLAYER_Y_CHAO
    lw t3, 0(t3)
    la t4, PULANDO
    sw zero, 0(t4)
    la t4, VEL_Y
    sw zero, 0(t4)
    la t4, VEL_X_PULO
    sw zero, 0(t4)
 
MV_AR_HORIZONTAL:
	la t6, PLAYER_Y
	sw t3, 0(t6)
 
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
	la t5, PLAYER_X_MAX_ATUAL 
	lw t5, 0(t5)
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
    la t6, CAM_MAX_ATUAL             
    lw t6, 0(t6)
    ble t5, t6, AC_SALVA
    mv t5, t6
AC_SALVA:
	la t4, CAMERA_X
	sw t5, 0(t4)
	
	lw ra, 0(sp)              # restaura o ra de MOVIMENTACAO
	addi sp, sp, 4
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
#         ATUALIZA_ATAQUE - conta o tempo da pose de ataque e move o projétil
#---------------------------------------------------------------------------
ATUALIZA_ATAQUE:
	# --- timer da pose de ataque (soco/tiro) ---
	la t0, ATAQUE_TIMER
	lw t1, 0(t0)
	beqz t1, AT_TIRO
	addi t1, t1, -1
	sw t1, 0(t0)
	bnez t1, AT_TIRO
	la t0, ATACANDO
	sw zero, 0(t0)                  # pose de ataque terminou

AT_TIRO:
	la t0, TIRO_ATIVO
	lw t1, 0(t0)
	beqz t1, AT_FIM

	#  POSIÇÃO ATUALIZADA: TIRO_X += TIRO_VELOCIDADE * TIRO_DIRECAO (roda a cada ciclo do GAME_LOOP)
	la t0, TIRO_DIRECAO
	lw t2, 0(t0)
	li t3, TIRO_VELOCIDADE
	mul t2, t2, t3
	la t0, TIRO_X
	lw t4, 0(t0)
	add t4, t4, t2
	sw t4, 0(t0)

	# DURAÇÃO/ALCANCE: soma a distância percorrida e compara com TIRO_ALCANCE
	la t0, TIRO_DIST
	lw t5, 0(t0)
	li t6, TIRO_VELOCIDADE
	add t5, t5, t6
	sw t5, 0(t0)
	li t6, TIRO_ALCANCE
	blt t5, t6, AT_FIM               # ainda não chegou no alcance máximo -> continua voando

	# passou do alcance -> projétil desativado (some da tela, libera pra atirar de novo)
	la t0, TIRO_ATIVO
	sw zero, 0(t0)
	la t0, TIRO_DIST
	sw zero, 0(t0)
AT_FIM:
	ret
#---------------------------------------------------------------------------
#         DESENHA_TIRO - desenha o projétil na tela, se estiver ativo
#---------------------------------------------------------------------------
DESENHA_TIRO:
	addi sp, sp, -4
	sw ra, 0(sp)            

	la t0, TIRO_ATIVO
	lw t1, 0(t0)
	beqz t1, DT_FIM

	la t0, TIRO_DIRECAO
	lw t1, 0(t0)
	bgtz t1, DT_DIR
	la a0, fireesq       
	j DT_POS
DT_DIR:
	la a0, fire
DT_POS:
	la t0, TIRO_X
	lw t1, 0(t0)
	la t0, CAMERA_X
	lw t2, 0(t0)
	sub a1, t1, t2
	bltz a1, DT_FIM
	li t5, TELA_LARGURA
	bge a1, t5, DT_FIM
	la t0, TIRO_Y
	lw a2, 0(t0)
	mv a3, s1
	li a4, 199
	call PRINT_PERSONAGEM
DT_FIM:
	lw ra, 0(sp)              
	addi sp, sp, 4
	ret
#---------------------------------------------------------------------------
#         ESCOLHE_SPRITE - decide qual sprite desenhar
#         retorna o endereço do sprite escolhido em a0
#---------------------------------------------------------------------------
ESCOLHE_SPRITE:
	# se estiver atacando, a pose de ataque tem prioridade sobre corrida/pulo/parado
	la t0, ATACANDO
	lw t1, 0(t0)
	beqz t1, ES_CHECA_PULO
	la t0, ARMA_ATUAL
	lw t2, 0(t0)
	bnez t2, ES_POSE_SOCO           # arma = 1 (soco) -> pula pra pose de soco

	# arma = 0 (projétil) -> personagem mostra pose de ATIRANDO
	la t0, FACING
	lw t3, 0(t0)
	bgtz t3, ES_ATIRA_DIR
	la a0, TiroL    
	ret
ES_ATIRA_DIR:
	la a0, TiroR     
	ret

ES_POSE_SOCO:
	la t0, FACING
	lw t3, 0(t0)
	bgtz t3, ES_SOCO_DIR
	la a0, socoesq    
	ret
ES_SOCO_DIR:
	la a0, socodir     
	ret

ES_CHECA_PULO:
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
	la t0, ANIM_FRAME
	lw t1, 0(t0)
	beqz t1, ES_PULO1
	la a0, Jump2
	ret
ES_PULO1:
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
# ---------------------------------------------------------
# Le o valor do tile numa posição do MUNDO
# ---------------------------------------------------------
# a0 = x no mundo (pixels)
# a1 = y na tela (pixels)   -- mesma escala que PLAYER_Y
# retorna em a0 o valor do tile (0,1,2,3,4,5)
GET_TILE:
    li t0, TILE_SIZE
    div t1, a0, t0
    div t2, a1, t0

    la t3, TILES_LARGURA_ATUAL     # ANTES: li t3, TILES_LARGURA
    lw t3, 0(t3)
    mul t2, t2, t3
    add t2, t2, t1

    la t4, COLISAO_ATUAL_PTR
    lw t4, 0(t4)
    add t4, t4, t2
    lbu a0, 0(t4)
    ret
# ---------------------------------------------------------
# CHECA_SOLIDO - usa pra travar o movimento
# ---------------------------------------------------------
# a0 = x do personagem (mundo), a1 = y do personagem (tela)
# retorna a0 = 1 se algum dos 4 cantos bateu em algo sólido (1,4 ou 5)
CHECA_SOLIDO:
    addi sp, sp, -24
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)
    sw s4, 20(sp)
 
    mv s0, a0
    mv s1, a1
    li s4, 0                     # flag: achou solido?
 
    mv a0, s0
    mv a1, s1
    call GET_TILE
    call EH_SOLIDO_AUX
    or s4, s4, a0
 
    addi a0, s0, 47
    mv a1, s1
    call GET_TILE
    call EH_SOLIDO_AUX
    or s4, s4, a0
 
    mv a0, s0
    addi a1, s1, 47
    call GET_TILE
    call EH_SOLIDO_AUX
    or s4, s4, a0
 
    addi a0, s0, 47
    addi a1, s1, 47
    call GET_TILE
    call EH_SOLIDO_AUX
    or s4, s4, a0
 
    mv a0, s4
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
    lw s4, 20(sp)
    addi sp, sp, 24
    ret
 
# a0 = valor do tile -> retorna a0 = 1 se for sólido (1, 4 ou 5)
EH_SOLIDO_AUX:
    li t0, 1
    beq a0, t0, ESA_SIM
    li t0, 2
    beq a0, t0, ESA_SIM
    li t0, 3
    beq a0, t0, ESA_SIM
    li t0, 5
    beq a0, t0, ESA_SIM
    li a0, 0
    ret
ESA_SIM:
    li a0, 1
    ret
 
# checa uma linha HORIZONTAL (usada pra pés/cabeça): a0=x base, a1=y
CHECA_LINHA_H:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    mv s0, a0
    mv s1, a1
    li s2, 0
    addi a0, s0, 2
    mv a1, s1
    call GET_TILE
    call EH_SOLIDO_AUX
    or s2, s2, a0
    addi a0, s0, 45
    mv a1, s1
    call GET_TILE
    call EH_SOLIDO_AUX
    or s2, s2, a0
    mv a0, s2
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    addi sp, sp, 16
    ret
 
# checa uma linha VERTICAL (usada pra laterais): a0=x, a1=y base
CHECA_LINHA_V:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    mv s0, a0
    mv s1, a1
    li s2, 0
    mv a0, s0
    addi a1, s1, 2
    call GET_TILE
    call EH_SOLIDO_AUX
    or s2, s2, a0
    mv a0, s0
    addi a1, s1, 45
    call GET_TILE
    call EH_SOLIDO_AUX
    or s2, s2, a0
    mv a0, s2
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    addi sp, sp, 16
    ret
# ---------------------------------------------------------
# CHECA BATIDA NA MYTERY BOX
# ---------------------------------------------------------
# Chame no GAME_LOOP, DEPOIS de atualizar a posição do personagem.
# Só reage quando o personagem tá SUBINDO (pulando pra cima). Olha o
# tile logo ACIMA da cabeça dele; se for mystery box (2 ou 3), faz
# aparecer o power-up sentado em cima do bloco (não coleta na hora -
# o jogador ainda precisa encostar nele, igual já funciona no seu
# CHECA_COLISAO_POWERUP).
CHECA_BATIDA_BLOCO:
    la t0, PULANDO
    lw t1, 0(t0)
    beqz t1, CBB_FIM              # não tá pulando -> não checa cabeçada
 
    la t0, BATEU_TETO
    lw t1, 0(t0)
    beqz t1, CBB_FIM              # só reage no frame em que realmente bateu no teto
 
    addi sp, sp, -4
    sw ra, 0(sp)
 
    # olha o tile bem no topo-centro da cabeça do personagem
    la t0, PLAYER_X
    lw a0, 0(t0)
    addi a0, a0, LARG_PERSONAGEM2
    la t0, Y_TENTATIVA
    lw a1, 0(t0)                   # linha que realmente colidiu (não o PLAYER_Y antigo)
    call GET_TILE
 
    li t1, 2
    beq a0, t1, CBB_ABRE_CURA
    li t1, 3
    beq a0, t1, CBB_ABRE_POWERUP2
    j CBB_FIM_POP
 
CBB_ABRE_CURA:
    li t2, 0                       # tipo 0 = cura
    j CBB_SPAWN
 
CBB_ABRE_POWERUP2:
    li t2, 1                       # tipo 1 = 2o power-up (ainda TODO)
    j CBB_SPAWN
 
CBB_SPAWN:
    # marca a mystery box como usada (vira bloco sólido "vazio", tipo Mario)
    la t0, PLAYER_X
    lw a0, 0(t0)
    addi a0, a0, LARG_PERSONAGEM2
    la t0, Y_TENTATIVA
    lw a1, 0(t0)
    call MARCA_TILE_USADO
 
    # descobre a posição em pixels do tile que foi batido, pra soltar
    # o power-up exatamente em cima dele
    la t0, PLAYER_X
    lw t3, 0(t0)
    addi t3, t3, LARG_PERSONAGEM2
    li t4, TILE_SIZE
    div t3, t3, t4
    mul t3, t3, t4                  # t3 = x do tile (arredondado pro grid)
 
    la t0, Y_TENTATIVA
    lw t5, 0(t0)
    div t5, t5, t4
    mul t5, t5, t4                  # t5 = y do tile (linha do bloco batido)
 
    # salva no sistema de power-up que você já tem (POWERUP_X/Y/ATIVO)
    la t0, POWERUP_X
    sw t3, 0(t0)
    la t0, POWERUP_Y
    addi t6, t5, -36         # aparece 2 "andares" acima do bloco batido (mais 12px)
    sw t6, 0(t0)
    la t0, POWERUP_ATIVO
    li t6, 1
    sw t6, 0(t0)
 
    # opcional: zera VEL_Y aqui pra simular a "batida" (o pulo perde o
    # impulextra pra cima na hora que bate na caixa, igual no Mario)
    la t0, VEL_Y
    sw zero, 0(t0)
 
CBB_FIM_POP:
    lw ra, 0(sp)
    addi sp, sp, 4
CBB_FIM:
    ret
 
# ---------------------------------------------------------
# CHECA PORTA - Ir para a próxima fase
# ---------------------------------------------------------
CHECA_PORTA:
    addi sp, sp, -4
    sw ra, 0(sp)

    la t0, PLAYER_X
    lw a0, 0(t0)
    addi a0, a0, LARG_PERSONAGEM2
    la t0, PLAYER_Y
    lw a1, 0(t0)
    addi a1, a1, LARG_PERSONAGEM2
    call GET_TILE

    lw ra, 0(sp)
    addi sp, sp, 4

    li t1, 4
    bne a0, t1, FIM

    la t0, FASE_ATUAL
    lw t1, 0(t0)
    li t2, 2
    beq t1, t2, CP_VAI_VITORIA
    j CP_VAI_FASE2

CP_VAI_FASE2:
    j TRANSICAO_FASE2
CP_VAI_VITORIA:
    j TELA_VITORIA
FIM:
    ret
 
# ---------------------------------------------------------
# Marca uma Mystery Box como "usada" (valor 5)
# ---------------------------------------------------------
# a0 = x mundo, a1 = y tela (mesmo ponto passado pra GET_TILE)
MARCA_TILE_USADO:
    li t0, TILE_SIZE
    div t1, a0, t0
    div t2, a1, t0
    la t3, TILES_LARGURA_ATUAL     
    lw t3, 0(t3)
    mul t2, t2, t3
    add t2, t2, t1
    la t4, COLISAO_ATUAL_PTR      
    lw t4, 0(t4)
    add t4, t4, t2
    li t5, 5
    sb t5, 0(t4)
    ret
	
#---------------------------------------------------------------------------
#   TRANSICAO_FASE2 - mostra tela "FASE 2" por ~4s e carrega o novo mapa
#---------------------------------------------------------------------------
TRANSICAO_FASE2:
    # limpa os dois frames
    li a3, 0
    call LIMPAR_FRAME_ATIVO
    li a3, 1
    call LIMPAR_FRAME_ATIVO

    # desenha a tela "FASE 2" nos dois frames
    la a0, fase2
    li a1, 0
    li a2, 0
    li a3, 0
    call PRINT
    li a3, 1
    call PRINT

    # mostra o frame 0
    li t0, 0xFF200604
    li t1, 0
    sw t1, 0(t0)
    la t0, FRAME_ATIVO
    sw zero, 0(t0)

    # espera ~4 segundos (40 x 100ms)
    li s5, 40
TF2_ESPERA:
    li a0, 100
    li a7, 32
    ecall
    addi s5, s5, -1
    bnez s5, TF2_ESPERA

    call CARREGA_FASE2
    j GAME_LOOP

#---------------------------------------------------------------------------
#   CARREGA_FASE2 - troca ponteiros de mapa/colisão e reseta o estado
#---------------------------------------------------------------------------
CARREGA_FASE2:
    addi sp, sp, -4
    sw ra, 0(sp)

    la t0, mapaFase2
    la t1, MAPA_ATUAL_PTR
    sw t0, 0(t1)

    la t0, MAPA_COLISAO2
    la t1, COLISAO_ATUAL_PTR
    sw t0, 0(t1)

    li t0, 148
    la t1, TILES_LARGURA_ATUAL
    sw t0, 0(t1)
    li t0, 1728          # MAP_LARGURA2(1776) - LARG_PERSONAGEM(48)
    la t1, PLAYER_X_MAX_ATUAL
    sw t0, 0(t1)
    li t0, 1456          # MAP_LARGURA2(1776) - TELA_LARGURA(320)
    la t1, CAM_MAX_ATUAL
    sw t0, 0(t1)

    li t0, 132           # Y inicial/chão da fase 2
    la t1, PLAYER_Y_CHAO_ATUAL
    sw t0, 0(t1)

    la t0, FASE_ATUAL
    li t1, 2
    sw t1, 0(t0)

    la t0, PLAYER_X
    sw zero, 0(t0)
    la t0, PLAYER_Y
    la t1, PLAYER_Y_CHAO_ATUAL
    lw t1, 0(t1)
    sw t1, 0(t0)
    la t0, CAMERA_X
    sw zero, 0(t0)
    la t0, PULANDO
    sw zero, 0(t0)
    la t0, VEL_Y
    sw zero, 0(t0)
    la t0, DIRECAO_ATUAL
    sw zero, 0(t0)

    la t0, NUM_PLANTAS
    sw zero, 0(t0)

    li a3, 0
    call LIMPAR_FRAME_ATIVO
    li a3, 1
    call LIMPAR_FRAME_ATIVO

    la t0, MAPA_ATUAL_PTR
    lw a0, 0(t0)
    li a1, 0
    li a2, 0
    li a3, 0
    call PRINT
    li a3, 1
    call PRINT

    lw ra, 0(sp)
    addi sp, sp, 4
    ret
#------------------------------------------------------
#                         VITÓRIA
#------------------------------------------------------ 
TELA_VITORIA:
    li a3, 0
    call LIMPAR_FRAME_ATIVO
    li a3, 1
    call LIMPAR_FRAME_ATIVO

    la a0, youwin       
    li a1, 0
    li a2, 0
    li a3, 0
    call PRINT

    la a0, youwin
    li a1, 0
    li a2, 0
    li a3, 1
    call PRINT

    li t0, 0xFF200604
    li t1, 0
    sw t1, 0(t0)

    # espera 5 minutos (3000 x 100ms)
    li s5, 3000
TV_ESPERA:
    li a0, 100
    li a7, 32
    ecall
    addi s5, s5, -1
    bnez s5, TV_ESPERA

    li a7, 10
    ecall
#-----------------------------------------------------------
# CHECA COLISAO COM PLANTAS PIRANHAS
#-----------------------------------------------------------
CHECA_COLISAO_PLANTAS:
    addi sp,sp,-4
    sw ra,0(sp)
    
    # verifica invencibilidade
    la t0,INVENCIVEL_TIMER
    lw t1,0(t0)

    beqz t1, CCP_CONTINUA

    # ainda invencível
    addi t1,t1,-1
    sw t1,0(t0)
    ret

CCP_CONTINUA:
    la t0,NUM_PLANTAS
    lw s2,0(t0)

    la s3,PLANTAS
    li t3,0

CCP_LOOP:
    beq t3,s2,CCP_FIM

    # verifica se a planta está viva
    lw t4,8(s3)
    beqz t4,CCP_PROXIMA


# ---- eixo X ----
    lw t5,0(s3)        # planta x
    la t0,PLAYER_X
    lw t6,0(t0)        # player x

    # player direita da planta
    addi t4,t5,48      # planta x + largura
    bge t6,t4,CCP_PROXIMA

    # player esquerda da planta
    addi t4,t6,48      # player x + largura
    ble t4,t5,CCP_PROXIMA

# ----- eixo Y -----
    lw t5,4(s3)        # planta y

    la t0,PLAYER_Y
    lw t6,0(t0)

    # player abaixo
    addi t4,t5,48

    bge t6,t4,CCP_PROXIMA

    # player acima
    addi t4,t6,48
    ble t4,t5,CCP_PROXIMA

# ----- colidiu -----
    # perde vida
    la t0,VIDAS
    lw t1,0(t0)
    beqz t1,CCP_FIM
    addi t1,t1,-1
    sw t1,0(t0)
    
    call CHECA_GAME_OVER

    # ativa invencibilidade
    la t0,INVENCIVEL_TIMER
    li t1,30
    sw t1,0(t0)

    # recua jogador
    la t0,PLAYER_X
    lw t1,0(t0)
    la t2,DIRECAO_ATUAL
    lw t2,0(t2)
    bgtz t2,CCP_RECUA_ESQ

# estava indo para esquerda - empurra para direita
    addi t1,t1,40
    j CCP_SALVA_RECUO

CCP_RECUA_ESQ:
    addi t1,t1,-40


CCP_SALVA_RECUO:
    bge t1,zero,CCP_OK_MIN
    li t1,0

CCP_OK_MIN:
    sw t1,0(t0)
    j CCP_FIM

CCP_PROXIMA:
    addi s3,s3,TAM_INIMIGO_PLANTA
    addi t3,t3,1
    j CCP_LOOP

CCP_FIM:
    lw ra,0(sp)
    addi sp,sp,4
    ret


#-----------------------------------------------------------
# ATUALIZA ANIMAÇÃO PLANTA PIRANHA
# Frame 0 = planta1 | Frame 1 = planta2
#-----------------------------------------------------------
ATUALIZA_PLANTA:
    # incrementa contador
    la t0, PLANTA_TIMER
    lw t1, 0(t0)

    addi t1, t1, 1

    li t2, 10              # velocidade da animação
    blt t1,t2, AP_SALVA

    # troca frame
    li t1,0

    la t3, PLANTA_FRAME
    lw t4,0(t3)

    xori t4,t4,1

    sw t4,0(t3)

AP_SALVA:
    sw t1,0(t0)
    ret
   
#-----------------------------------------------------------
# DESENHA PLANTAS PIRANHAS
#-----------------------------------------------------------
DESENHA_PLANTAS:
    addi sp,sp,-12
    sw ra,0(sp)
    sw s2,4(sp)
    sw s3,8(sp)

    la t0,NUM_PLANTAS
    lw s2,0(t0)          # quantidade de plantas

    la s3,PLANTAS        # ponteiro do vetor

    li t3,0              # contador

DESENHA_PLANTAS_LOOP:
    beq t3,s2,DESENHA_PLANTAS_FIM

    # lê vida
    lw t4,8(s3)

    beqz t4,DESENHA_PLANTAS_PROXIMA    # morta não desenha

    # calcula posição X na tela
    lw t5,0(s3)           # planta x mundo

    la t6,CAMERA_X
    lw t6,0(t6)

    sub a1,t5,t6          # x tela

    # se saiu pela esquerda
    bltz a1,DESENHA_PLANTAS_PROXIMA

    li t5,TELA_LARGURA

    bge a1,t5,DESENHA_PLANTAS_PROXIMA

    # Y
    lw a2,4(s3)

    # escolhe sprite
    la t5,PLANTA_FRAME
    lw t6,0(t5)

    beqz t6,DESENHA_PLANTAS_FRAME0

    # frame 1
    la a0,planta2
    j DESENHA_PLANTAS_DESENHA

DESENHA_PLANTAS_FRAME0:
    la a0,planta1

DESENHA_PLANTAS_DESENHA:
    mv a3,s1          # frame oculto
    li a4,199         # transparência
    call PRINT_PERSONAGEM

DESENHA_PLANTAS_PROXIMA:
    addi s3,s3,TAM_INIMIGO_PLANTA
    addi t3,t3,1
    j DESENHA_PLANTAS_LOOP

DESENHA_PLANTAS_FIM:
    lw ra,0(sp)
    addi sp,sp,4
    ret   
    
    
#-----------------------------------------------------------
# CHECA_GAME_OVER
#-----------------------------------------------------------

CHECA_GAME_OVER:
    la t0,VIDAS
    lw t1,0(t0)

    bnez t1,CGO_FIM      # ainda tem vida

    # acabou o jogo
    j GAME_OVER

CGO_FIM:
    ret
    
#-----------------------------------------------------------
# GAME_OVER
#-----------------------------------------------------------
GAME_OVER:
    # limpa frame 0
    li a3,0
    call LIMPAR_FRAME_ATIVO

    # limpa frame 1
    li a3,1
    call LIMPAR_FRAME_ATIVO

    # desenha tela GAME OVER no frame 0
    la a0,final
    li a1,0
    li a2,0
    li a3,0
    call PRINT

    # desenha também no frame 1
    la a0,final
    li a1,0
    li a2,0
    li a3,1
    call PRINT

    # mostra frame 0
    li t0,0xFF200604
    li t1,0
    sw t1,0(t0)

GAME_OVER_LOOP:
    j GAME_OVER_LOOP
    
    #-----------------------------------------------------------
# COLISAO TIRO COM PLANTAS
#-----------------------------------------------------------
CHECA_TIRO_PLANTAS:
    la t0, TIRO_ATIVO
    lw t1, 0(t0)
    beqz t1, CTP_FIM          # sem tiro ativo, não checa

    la t0, NUM_PLANTAS
    lw s2, 0(t0)
    la s3, PLANTAS
    li t3, 0

CTP_LOOP:
    beq t3, s2, CTP_FIM

    lw t4, 8(s3)              # vida da planta
    beqz t4, CTP_PROXIMA      # morta, pula

    # eixo X
    lw t5, 0(s3)              # planta x
    la t0, TIRO_X
    lw t6, 0(t0)              # tiro x

    addi t4, t5, 24           # planta x + largura (24)
    bge t6, t4, CTP_PROXIMA   # tiro à direita da planta

    addi t4, t6, 8            # tiro x + largura do tiro
    ble t4, t5, CTP_PROXIMA   # tiro à esquerda da planta

    # eixo Y
    lw t5, 4(s3)              # planta y
    la t0, TIRO_Y
    lw t6, 0(t0)              # tiro y

    addi t4, t5, 32           # planta y + altura (32)
    bge t6, t4, CTP_PROXIMA

    addi t4, t6, 8
    ble t4, t5, CTP_PROXIMA

    # acertou — reduz vida da planta
    lw t4, 8(s3)
    addi t4, t4, -1
    sw t4, 8(s3)

    # desativa o tiro
    la t0, TIRO_ATIVO
    sw zero, 0(t0)
    la t0, TIRO_DIST
    sw zero, 0(t0)

CTP_PROXIMA:
    addi s3, s3, TAM_INIMIGO_PLANTA
    addi t3, t3, 1
    j CTP_LOOP

CTP_FIM:
    ret

#-----------------------------------------------------------
# COLISAO TIRO COM ANDADORES
#-----------------------------------------------------------
CHECA_TIRO_ANDADORES:
    la t0, TIRO_ATIVO
    lw t1, 0(t0)
    beqz t1, CTA_FIM

    la t0, NUM_ANDADORES
    lw s2, 0(t0)
    la s3, ANDADORES
    li t3, 0

CTA_LOOP:
    beq t3, s2, CTA_FIM

    lw t4, 8(s3)              # vida
    beqz t4, CTA_PROXIMA

    # eixo X
    lw t5, 0(s3)              # andador x
    la t0, TIRO_X
    lw t6, 0(t0)

    addi t4, t5, 48
    bge t6, t4, CTA_PROXIMA

    addi t4, t6, 8
    ble t4, t5, CTA_PROXIMA

    # eixo Y
    lw t5, 4(s3)
    la t0, TIRO_Y
    lw t6, 0(t0)

    addi t4, t5, 48
    bge t6, t4, CTA_PROXIMA

    addi t4, t6, 8
    ble t4, t5, CTA_PROXIMA

    # acertou
    lw t4, 8(s3)
    addi t4, t4, -1
    sw t4, 8(s3)

    la t0, TIRO_ATIVO
    sw zero, 0(t0)
    la t0, TIRO_DIST
    sw zero, 0(t0)

CTA_PROXIMA:
    addi s3, s3, TAM_INIMIGO_ANDADOR
    addi t3, t3, 1
    j CTA_LOOP

CTA_FIM:
    ret

#-----------------------------------------------------------
# ATUALIZA ANDADORES - move e anima
#-----------------------------------------------------------
ATUALIZA_ANDADORES:
    la t0, NUM_ANDADORES
    lw s2, 0(t0)
    la s3, ANDADORES
    li t3, 0
AA2_LOOP:
    beq t3, s2, AA2_FIM
    lw t4, 8(s3)              # vida
    beqz t4, AA2_PROXIMA      # morto, pula
    lw t5, 0(s3)              # x atual
    lw t6, 12(s3)             # direcao (1 ou -1)
    lw t0, 16(s3)             # x_min da patrulha
    li t1, 100                # tamanho da patrulha (x_min + 100 = x_max)
    add t1, t0, t1            # t1 = x_max
    # move
    add t5, t5, t6            # x += direcao (velocidade 1)
    
    add t5, t5, t6
    # checa limites e inverte direcao
    bge t5, t1, AA2_INVERTE_ESQ
    ble t5, t0, AA2_INVERTE_DIR
    j AA2_SALVA_X
AA2_INVERTE_ESQ:
    li t6, -1
    sw t6, 12(s3)
    mv t5, t1
    j AA2_SALVA_X
AA2_INVERTE_DIR:
    li t6, 1
    sw t6, 12(s3)
    mv t5, t0
AA2_SALVA_X:
    # impede de sair pelo lado esquerdo do mapa
    bge t5, zero, AA2_CHECA_MAX_MAPA
    li t5, 0
    li t6, 1                    # inverte direção para direita
    sw t6, 12(s3)
    j AA2_STORE
AA2_CHECA_MAX_MAPA:
    # impede de sair pelo lado direito do mapa
    li t6, PLAYER_X_MAX
    ble t5, t6, AA2_STORE
    li t5, PLAYER_X_MAX
    li t6, -1                   # inverte direção para esquerda
    sw t6, 12(s3)
AA2_STORE:
    sw t5, 0(s3)
AA2_PROXIMA:
    addi s3, s3, TAM_INIMIGO_ANDADOR
    addi t3, t3, 1
    j AA2_LOOP
AA2_FIM:
    # atualiza animacao (mesmo timer das plantas)
    la t0, ANDADOR_TIMER
    lw t1, 0(t0)
    addi t1, t1, 1
    li t2, 8
    blt t1, t2, AA2_SALVA_TIMER
    li t1, 0
    la t2, ANDADOR_FRAME
    lw t3, 0(t2)
    xori t3, t3, 1
    sw t3, 0(t2)
AA2_SALVA_TIMER:
    sw t1, 0(t0)
    ret
#-----------------------------------------------------------
# DESENHA ANDADORES
#-----------------------------------------------------------
DESENHA_ANDADORES:
    addi sp, sp, -12
    sw ra, 0(sp)
    sw s2, 4(sp)
    sw s3, 8(sp)

    la t0, NUM_ANDADORES
    lw s2, 0(t0)
    la s3, ANDADORES
    li t3, 0

DA_LOOP:
    beq t3, s2, DA_FIM

    lw t4, 8(s3)
    beqz t4, DA_PROXIMA       # morto não desenha

    lw t5, 0(s3)              # x mundo
    la t6, CAMERA_X
    lw t6, 0(t6)
    sub a1, t5, t6            # x tela

    bltz a1, DA_PROXIMA
    li t5, TELA_LARGURA
    bge a1, t5, DA_PROXIMA

    lw a2, 4(s3)              # y

  la t5, ANDADOR_FRAME
    lw t6, 0(t5)              # frame (0 ou 1)
    lw t5, 12(s3)             # direcao (1=direita, -1=esquerda)
    bgtz t5, DA_DIREITA

    # esquerda
    beqz t6, DA_FRAME0_ESQ
    la a0, inimigoL2
    j DA_DESENHA
DA_FRAME0_ESQ:
    la a0, inimigoL1
    j DA_DESENHA

DA_DIREITA:
    beqz t6, DA_FRAME0_DIR
    la a0, inimigoR2
    j DA_DESENHA
DA_FRAME0_DIR:
    la a0, inimigoR1

DA_DESENHA:
    mv a3, s1
    li a4, 199
    call PRINT_PERSONAGEM

DA_PROXIMA:
    addi s3, s3, TAM_INIMIGO_ANDADOR
    addi t3, t3, 1
    j DA_LOOP

DA_FIM:
    lw ra, 0(sp)
    lw s2, 4(sp)
    lw s3, 8(sp)
    addi sp, sp, 12
    ret

#-----------------------------------------------------------
# CHECA COLISAO JOGADOR COM ANDADORES
#-----------------------------------------------------------
CHECA_COLISAO_ANDADORES:
    addi sp, sp, -4
    sw ra, 0(sp)

    la t0, INVENCIVEL_TIMER
    lw t1, 0(t0)
    bnez t1, CCA_FIM          # invencivel, pula

    la t0, NUM_ANDADORES
    lw s2, 0(t0)
    la s3, ANDADORES
    li t3, 0

CCA_LOOP:
    beq t3, s2, CCA_FIM

    lw t4, 8(s3)
    beqz t4, CCA_PROXIMA

    # eixo X
    lw t5, 0(s3)
    la t0, PLAYER_X
    lw t6, 0(t0)

    addi t4, t5, 48
    bge t6, t4, CCA_PROXIMA

    addi t4, t6, 48
    ble t4, t5, CCA_PROXIMA

    # eixo Y
    lw t5, 4(s3)
    la t0, PLAYER_Y
    lw t6, 0(t0)

    addi t4, t5, 48
    bge t6, t4, CCA_PROXIMA

    addi t4, t6, 48
    ble t4, t5, CCA_PROXIMA

    # colidiu - mesma logica da planta
    la t0, VIDAS
    lw t1, 0(t0)
    beqz t1, CCA_FIM
    addi t1, t1, -1
    sw t1, 0(t0)

    call CHECA_GAME_OVER

    la t0, INVENCIVEL_TIMER
    li t1, 30
    sw t1, 0(t0)

    la t0, PLAYER_X
    lw t1, 0(t0)
    la t2, DIRECAO_ATUAL
    lw t2, 0(t2)
    bgtz t2, CCA_RECUA_ESQ
    addi t1, t1, 40
    j CCA_SALVA_RECUO
CCA_RECUA_ESQ:
    addi t1, t1, -40
CCA_SALVA_RECUO:
    bge t1, zero, CCA_OK_MIN
    li t1, 0
CCA_OK_MIN:
    sw t1, 0(t0)
    j CCA_FIM

CCA_PROXIMA:
    addi s3, s3, TAM_INIMIGO_ANDADOR
    addi t3, t3, 1
    j CCA_LOOP

CCA_FIM:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

#-----------------------------------------------------------
# CHECA SOCO COM PLANTAS
#-----------------------------------------------------------
CHECA_SOCO_PLANTAS:
    # só checa se estiver atacando com soco
    la t0, ATACANDO
    lw t1, 0(t0)
    beqz t1, CSP_FIM

    la t0, ARMA_ATUAL
    lw t1, 0(t0)
    beqz t1, CSP_FIM          # arma = 0 (tiro) -> não é soco

    # calcula hitbox do soco
    # se FACING = 1 (direita): hitbox começa em PLAYER_X + 48
    # se FACING = -1 (esquerda): hitbox começa em PLAYER_X - 24
    la t0, PLAYER_X
    lw t3, 0(t0)
    la t0, FACING
    lw t4, 0(t0)
    bgtz t4, CSP_DIR

    # esquerda: hitbox de PLAYER_X-24 até PLAYER_X
    addi t3, t3, -24          # t3 = soco_x
    li t4, 24                 # t4 = largura da hitbox
    j CSP_CHECA

CSP_DIR:
    # direita: hitbox de PLAYER_X+48 até PLAYER_X+72
    addi t3, t3, 48           # t3 = soco_x
    li t4, 24                 # t4 = largura da hitbox

CSP_CHECA:
    # t3 = soco_x, t4 = largura hitbox
    la t0, PLAYER_Y
    lw t5, 0(t0)              # t5 = soco_y (mesma altura do personagem)
    li t6, 48                 # altura da hitbox

    la s4, NUM_PLANTAS
    lw s2, 0(s4)
    la s3, PLANTAS
    li s4, 0                  # contador

CSP_LOOP:
    beq s4, s2, CSP_FIM

    lw a0, 8(s3)              # vida da planta
    beqz a0, CSP_PROXIMA

    # eixo X
    lw a1, 0(s3)              # planta x
    add a2, t3, t4            # soco_x + largura
    ble a2, a1, CSP_PROXIMA   # soco termina antes da planta

    addi a2, a1, 24           # planta x + largura
    ble a2, t3, CSP_PROXIMA   # planta termina antes do soco

    # eixo Y
    lw a1, 4(s3)              # planta y
    add a2, t5, t6            # soco_y + altura
    ble a2, a1, CSP_PROXIMA

    addi a2, a1, 32           # planta y + altura
    ble a2, t5, CSP_PROXIMA

    # acertou
    lw a0, 8(s3)
    addi a0, a0, -1
    sw a0, 8(s3)

CSP_PROXIMA:
    addi s3, s3, TAM_INIMIGO_PLANTA
    addi s4, s4, 1
    j CSP_LOOP

CSP_FIM:
    ret

#-----------------------------------------------------------
# CHECA SOCO COM ANDADORES
#-----------------------------------------------------------
CHECA_SOCO_ANDADORES:
    la t0, ATACANDO
    lw t1, 0(t0)
    beqz t1, CSA_FIM

    la t0, ARMA_ATUAL
    lw t1, 0(t0)
    beqz t1, CSA_FIM

    # mesma hitbox do soco
    la t0, PLAYER_X
    lw t3, 0(t0)
    la t0, FACING
    lw t4, 0(t0)
    bgtz t4, CSA_DIR

    addi t3, t3, -24
    li t4, 24
    j CSA_CHECA

CSA_DIR:
    addi t3, t3, 48
    li t4, 24

CSA_CHECA:
    la t0, PLAYER_Y
    lw t5, 0(t0)
    li t6, 48

    la s4, NUM_ANDADORES
    lw s2, 0(s4)
    la s3, ANDADORES
    li s4, 0

CSA_LOOP:
    beq s4, s2, CSA_FIM

    lw a0, 8(s3)
    beqz a0, CSA_PROXIMA

    # eixo X
    lw a1, 0(s3)
    add a2, t3, t4
    ble a2, a1, CSA_PROXIMA

    addi a2, a1, 48
    ble a2, t3, CSA_PROXIMA

    # eixo Y
    lw a1, 4(s3)
    add a2, t5, t6
    ble a2, a1, CSA_PROXIMA

    addi a2, a1, 48
    ble a2, t5, CSA_PROXIMA

    # acertou
    lw a0, 8(s3)
    addi a0, a0, -1
    sw a0, 8(s3)

CSA_PROXIMA:
    addi s3, s3, TAM_INIMIGO_ANDADOR
    addi s4, s4, 1
    j CSA_LOOP

CSA_FIM:
    ret
    
.data
.include "SYSTEMv24.s"