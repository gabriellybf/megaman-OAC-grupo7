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
# ======== MUSICA FASE 1===========
NUM_3: .word 42
NOTAS_3: .word 72,211,83,139,72,143,83,562,81,634,74,211,84,139,74,143,84,562,83,634,72,211,83,139,72,143,83,562,81,423,84,283,81,279,77,283,76,423,74,634,72,211,83,139,72,143,83,562,81,634,74,211,84,139,74,143,84,562,83,634,72,211,83,139,72,143,83,562,81,423,74,210,76,211,77,211,79,422,91,105,93,105,91,317
# ======== MUSICA FASE 2 ==========
NUM_4: .word 64
NOTAS_4: .word 55,999,53,166,59,333,57,333,55,333,57,333,55,1165,53,166,59,333,57,333,55,333,57,333,52,832,52,166,53,166,55,166,50,1332,60,332,60,166,67,166,71,166,70,499,60,332,60,166,67,166,71,166,73,332,71,166,72,832,72,333,71,166,72,332,76,499,79,166,77,166,76,166,74,166,72,666,72,333,71,166,72,332,76,499,76,166,77,166,76,333,74,666,74,166,72,166,71,166,79,499,77,333,76,333,74,333,74,166,76,166,74,166,72,666,60,332,60,166,67,166,71,166,73,332,71,166,72,166
# ======== MUSICA GAME OVER ===========
NUM_5: .word 9
NOTAS_5: .word 76,588,72,294,67,294,76,588,71,588,74,882,76,294,81,294,86,882
# ======== MUSICA VITORIA ===========
NUM_6: .word 32
NOTAS_6: .word 48,167,52,167,55,167,48,167,52,167,59,167,48,167,52,167,61,167,48,167,52,167,57,167,48,167,52,167,56,167,55,167,52,167,55,167,60,167,52,167,55,167,62,167,52,167,55,167,63,167,52,167,55,167,60,167,52,167,55,167,61,167,59,167
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
VIDAS_MAX:    .word 4        # quantidade máxima de espaços exibidos no HUD
POWERUP_X:      .word 400       # posição no MUNDO (mesmo sistema de coordenadas do PLAYER_X)
POWERUP_Y:      .word 100       # posição vertical na tela (mesmo sistema do PLAYER_Y)
POWERUP_ATIVO:  .word 0         # 1 = ainda disponível na fase, 0 = já foi coletado (some)
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
PROJETIS_ATUAL: .word 8        # munição atual de tiros
POWERUP_TIPO:   .word 0        # 0 = cura, 1 = munição (usa o mesmo slot POWERUP_X/Y/ATIVO)
# ---- animação do personagem ----
FACING:       .word 1        # 1 = direita, -1 = esquerda (direção que o personagem está olhando; NÃO zera quando solta a tecla)
ANIM_TIMER:   .word 0        # contador de ciclos do GAME_LOOP até trocar de frame
ANIM_FRAME:   .word 0        # 0 ou 1 - qual dos 2 frames da animação atual está ativo
.eqv ANIM_VELOCIDADE, 6      # intervalo, em ciclos, entre os frames da animação

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
.eqv TIRO_VELOCIDADE, 8       # deslocamento horizontal do projétil por ciclo
.eqv TIRO_ALCANCE, 150        # distância máxima percorrida pelo projétil

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
.word 1080   # x → trecho intermediário, sem sobrepor planta/chefão
.word 1080   # x → trecho intermediário, sem sobrepor planta/chefão
.word 145    # y → mesmo nível do chão, não muda
.word 2      # vida
.word -1     # direcao (começa indo para esquerda)
.word 1080   # x_min (patrulha de 1080 até 1180)
.word 1080   # x_min (patrulha de 1080 até 1180)

ANDADOR_FRAME:  .word 0
ANDADOR_TIMER:  .word 0
# ---- POWER-UPS FIXOS DA FASE 2 (sem mystery box) ----
.eqv TAM_POWERUP2, 16      # 4 words: x, y, ativo, tipo
NUM_POWERUPS2: .word 3
POWERUPS2:
# powerup 1 - cura
.word 300      # x mundo (AJUSTE conforme seu mapa)
.word 95       # y tela
.word 1        # ativo
.word 0        # tipo: 0 = cura
# powerup 2 - cura
.word 900
.word 90
.word 1
.word 0        # cura
# powerup 3 - munição
.word 1400
.word 95
.word 1
.word 1        # tipo: 1 = munição

# ---- chefes por fase ----
# fase 1: Bowser de fogo; fase 2: Rosalina e Mario

# ---- posições anteriores usadas para suavizar o movimento ----
ROSALINA_X_ANTERIOR:      .word 650
ROSALINA_Y_ANTERIOR:      .word 90
BOWSER_X_ANTERIOR:        .word 1540
BOWSER_Y_ANTERIOR:        .word 113
MARIO_X_ANTERIOR:         .word 1540
MARIO_Y_ANTERIOR:         .word 100

# ---- rosalina (fase 2) ----
ROSALINA_X:               .word 650
ROSALINA_Y:               .word 90
ROSALINA_ATIVA:           .word 1
ROSALINA_LIBERADA:        .word 0
ROSALINA_VIDA:            .word 4
ROSALINA_ESTADO:          .word 0
ROSALINA_TIMER:           .word 0
ROSALINA_DIRECAO_Y:       .word 1
ROSALINA_DIRECAO_X:       .word -1
ROSALINA_MOVIMENTO_TIMER: .word 0
ROSALINA_ATAQUE_PROXIMO:  .word 0
ROSALINA_ALTERNANCIA:     .word 0
ROSALINA_ATAQUES:         .word 0
ROSALINA_CONTATO:         .word 0
ROSALINA_INVENCIVEL:      .word 0
ROSALINA_POSE_ATAQUE:     .word 0
ESTRELA_ROSALINA_ATIVA:   .word 0
ESTRELA_ROSALINA_TIPO:    .word 0
ESTRELA_ROSALINA_X:       .word 0
ESTRELA_ROSALINA_Y:       .word 0
ESTRELA_ROSALINA_VX:      .word 0
ESTRELA_ROSALINA_VY:      .word 0
ESTRELA_ROSALINA_ALVO_X:  .word 0
ESTRELA_ROSALINA_AVISO:   .word 0
ESTRELA_ROSALINA_SPRITE:  .word 0

# ---- bowser de fogo (chefão da fase 1) ----
BOWSER_X:                 .word 1540
BOWSER_Y:                 .word 113
BOWSER_ATIVO:             .word 1
BOWSER_LIBERADO:          .word 0        # ativa ao entrar na arena final da fase 1
BOWSER_VIDA:              .word 6
BOWSER_ESTADO:            .word 0
BOWSER_TIMER:             .word 0
BOWSER_DIRECAO:           .word -1
BOWSER_VEL_Y:             .word 0
BOWSER_CONTATO:           .word 0
BOWSER_INVENCIVEL:        .word 0
BOWSER_POSE_ATAQUE:       .word 0
FOGO_BOWSER_ATIVO:        .word 0
FOGO_BOWSER_X:            .word 0
FOGO_BOWSER_Y:            .word 0
FOGO_BOWSER_VX:           .word 0
IMPACTO_BOWSER_ATIVO:     .word 0
IMPACTO_BOWSER_TIMER:     .word 0
IMPACTO_BOWSER_X:         .word 0

# ---- mario (chefão final da fase 2) ----
MARIO_X:                  .word 1540
MARIO_Y:                  .word 100
MARIO_ATIVO:              .word 1
MARIO_LIBERADO:           .word 0
MARIO_VIDA:               .word 12
MARIO_FASE:               .word 1
MARIO_ESTADO:             .word 0
MARIO_TIMER:              .word 0
MARIO_DIRECAO:            .word -1
MARIO_VEL_Y:              .word 0
MARIO_ATAQUE_INDICE:      .word 0
MARIO_COMBINACAO:         .word 0
MARIO_CONTATO:            .word 0
MARIO_INVENCIVEL:         .word 0
MARIO_POSE_ATAQUE:        .word 0
MARIO_COPIA_ATIVA:        .word 0
MARIO_COPIA_X:            .word 0
MARIO_PROJETIL_ATIVO:     .word 0
MARIO_PROJETIL_TIPO:      .word 0
MARIO_PROJETIL_X:         .word 0
MARIO_PROJETIL_Y:         .word 0
MARIO_PROJETIL_VX:        .word 0
MARIO_PROJETIL_VY:        .word 0
IMPACTO_MARIO_ATIVO:      .word 0
IMPACTO_MARIO_TIMER:      .word 0
IMPACTO_MARIO_X:          .word 0

# ---- constantes do mapa/scroll (ajuste LARG_PERSONAGEM pro tamanho real do sprite) ----
.eqv MAP_LARGURA, 1692
.eqv TELA_LARGURA, 320
.eqv CAM_MAX, 1372          # 1692 - 320, calculado manualmente
.eqv LARG_PERSONAGEM, 48
.eqv LARG_PERSONAGEM2, 24
.eqv VELOCIDADE, 4
.eqv PLAYER_X_MAX, 1644
.eqv PLAYER_Y_CHAO, 145       # posição vertical do personagem no chão
.eqv IMPULSO_PULO, -13        # velocidade inicial pra cima (negativo = sobe)
.eqv GRAVIDADE, 1             # aceleração pra baixo a cada frame
.eqv VELY_MAX, 12             # velocidade máxima de queda
.eqv TILE_SIZE, 12
.eqv TILES_LARGURA, 141        # MAP_LARGURA (1692) / TILE_SIZE
.eqv TILES_ALTURA, 20           # 240 / TILE_SIZE
.eqv PROJETIS_MAX, 8           # munição máxima (usado pra recarregar)
# Valores possíveis dentro da matriz:
#   0 = nada (vazio, personagem passa livre)
#   1 = bloco sólido (chão, plataforma, cano, parede)
#   2 = mystery box - sai o power-up de CURA
#   3 = mystery box - sai o municao
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
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,0,0
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
# ---- constantes dos chefes ----
.eqv INIMIGO_LARGURA, 80
.eqv INIMIGO_ALTURA, 80
.eqv TEMPO_INVENCIVEL, 35
.eqv TEMPO_INVENCIVEL_INIMIGO, 36
.eqv TEMPO_POSE_ATAQUE, 12
.eqv RECUO_DANO, 32
.eqv PROJETIL_PEQUENO, 16
.eqv ESTRELA_ROSALINA_TAMANHO, 18
.eqv MARGEM_TELA_INIMIGO, 12
.eqv PLANTA_LARGURA_REAL, 24
.eqv PLANTA_ALTURA_REAL, 32

.eqv INIMIGO_HITBOX_X, 10
.eqv INIMIGO_HITBOX_Y, 8
.eqv INIMIGO_HITBOX_LARGURA, 60
.eqv INIMIGO_HITBOX_ALTURA, 62
.eqv ESPACO_ENTRE_CORPOS, 8
.eqv TIRO_LARGURA_REAL, 32
.eqv TIRO_ALTURA_REAL, 32
.eqv SOCO_LARGURA_REAL, 26
.eqv SOCO_ALTURA_REAL, 40

# Rosalina ocupa a primeira arena da fase 2.
.eqv ROSALINA_X_MIN, 520
.eqv ROSALINA_X_MAX, 880
.eqv ROSALINA_Y_MIN, 65
.eqv ROSALINA_Y_MAX, 100
.eqv ROSALINA_DISTANCIA_MIN, 92
.eqv ROSALINA_DISTANCIA_MAX, 155
.eqv ROSALINA_ENTRADA_TELA, 270

# Bowser fica fechado no fim da fase 1, sem alcançar planta/andador.
.eqv BOWSER_X_MIN, 1410
.eqv BOWSER_X_MAX, 1612
.eqv BOWSER_Y_MIN, 45
.eqv BOWSER_Y_MAX, 113

# Mario ocupa apenas a arena final da fase 2.
.eqv MARIO_X_MIN, 1260
.eqv MARIO_X_MAX, 1696
.eqv MARIO_Y_MIN, 32
.eqv MARIO_Y_MAX, 100

.eqv ROS_ESTADO_MOVE, 0
.eqv ROS_ESTADO_PREPARA_HORIZONTAL, 1
.eqv ROS_ESTADO_PREPARA_VERTICAL, 2
.eqv ROS_ESTADO_PULSO, 3
.eqv ROS_ESTADO_RECUPERA, 4
.eqv ROS_ESTADO_VULNERAVEL, 5

.eqv BOW_ESTADO_ANDA, 0
.eqv BOW_ESTADO_PREPARA_FOGO, 1
.eqv BOW_ESTADO_PREPARA_INVESTIDA, 2
.eqv BOW_ESTADO_INVESTIDA, 3
.eqv BOW_ESTADO_ATORDOADO, 4
.eqv BOW_ESTADO_PREPARA_SALTO, 5
.eqv BOW_ESTADO_SALTO, 6
.eqv BOW_ESTADO_RECUPERA, 7

.eqv MARIO_ESTADO_ESPERA, 0
.eqv MARIO_ESTADO_PREPARA_FOGO, 1
.eqv MARIO_ESTADO_PULO, 2
.eqv MARIO_ESTADO_RECUPERA, 3
.eqv MARIO_ESTADO_PREPARA_ESTRELA, 4
.eqv MARIO_ESTADO_PREPARA_INVESTIDA, 5
.eqv MARIO_ESTADO_INVESTIDA, 6
.eqv MARIO_ESTADO_COPIA, 7
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
.include "script/Imagens/imagens_convertidas/arquivos .data/rosalina.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/rosalina_power.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/bowser80.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/bowser_power.data"
# sprite normal do Mario
.include "script/Imagens/imagens_convertidas/arquivos .data/mario.data"
# sprite de ataque do Mario
.include "script/Imagens/imagens_convertidas/arquivos .data/mario_power.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/final.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/fase2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/mapaFase2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/inimigoR1.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/inimigoR2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/inimigoL1.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/inimigoL2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/youwin.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/municao.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/energia.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/soco.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/canhao.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/rosalina_projetil.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/bowser_fogo2.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/mario_fogo.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/luma_amarela.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/luma_azul.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/luma_rosa.data"
.include "script/Imagens/imagens_convertidas/arquivos .data/luma_verde.data"
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

# 3. Descobre qual música está tocando (1, 2, 3, 4, 5, 6)
    la t3, FAIXA_ATUAL
    lw t4, 0(t3)
    li t5, 1
    beq t4, t5, CARREGA_FAIXA_1
    li t5, 2
    beq t4, t5, CARREGA_FAIXA_2
    li t5, 3
    beq t4, t5, CARREGA_FAIXA_3
    li t5, 4
    beq t4, t5, CARREGA_FAIXA_4
    li t5, 5
    beq t4, t5, CARREGA_FAIXA_5
    li t5, 6
    beq t4, t5, CARREGA_FAIXA_6

CARREGA_FAIXA_3:
    la t1, NUM_3
    lw a5, 0(t1)              # Total de notas da música 3
    li a2, 11                
    j VERIFICA_FIM_MUSICA

CARREGA_FAIXA_4:
    la t1, NUM_4
    lw a5, 0(t1)              # Total de notas da música 4
    li a2, 81                 # Instrumento: Synth (diferente da Fase 1)
    j VERIFICA_FIM_MUSICA
# derrota
CARREGA_FAIXA_5:
    la t1, NUM_5
    lw a5, 0(t1)              
    li a2, 43              # Instrumento: Tuba (Som de derrota)
    j VERIFICA_FIM_MUSICA
    # vitoria
CARREGA_FAIXA_6:
    la t1, NUM_6
    lw a5, 0(t1)              
    li a2, 27                # Instrumento: Trumpet (Som de vitória)
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
    li t5, 4
    beq t4, t5, REINICIA_4    # Se for 4, repete a 4
    li t5, 5
    beq t4, t5, REINICIA_5 # Se for 5, repete a 5
    li t5, 6
    beq t4, t5, REINICIA_6 # Se for 6, repete a 6

REINICIA_3:                   # Se for 3, repete a 3 infinitamente
    la t1, NOTA_ATUAL_PTR
    la t2, NOTAS_3
    sw t2, 0(t1)
    j FIM_TOCA_MUSICA

REINICIA_4:                   # Se for 4, repete a 4 infinitamente
    la t1, NOTA_ATUAL_PTR
    la t2, NOTAS_4
    sw t2, 0(t1)
    j FIM_TOCA_MUSICA

REINICIA_5:                   
    la t1, NOTA_ATUAL_PTR
    la t2, NOTAS_5
    sw t2, 0(t1)
    j FIM_TOCA_MUSICA

REINICIA_6:                   
    la t1, NOTA_ATUAL_PTR
    la t2, NOTAS_6
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

# Reinicia a faixa atual
REINICIA_MUSICA:
    la t3, FAIXA_ATUAL
    lw t4, 0(t3)
    li t5, 1
    beq t4, t5, REINICIA_MUSICA_1
    li t5, 2
    beq t4, t5, REINICIA_MUSICA_2
    la t0, NOTA_ATUAL_PTR
    la t1, NOTAS_3
    sw t1, 0(t0)
    j REINICIA_MUSICA_FIM
REINICIA_MUSICA_1:
    la t0, NOTA_ATUAL_PTR
    la t1, NOTAS_1
    sw t1, 0(t0)
    j REINICIA_MUSICA_FIM
REINICIA_MUSICA_2:
    la t0, NOTA_ATUAL_PTR
    la t1, NOTAS_2
    sw t1, 0(t0)
REINICIA_MUSICA_FIM:
    la t0, NOTAS_TOCADAS
    sw zero, 0(t0)
    la t0, PROX_NOTA_TEMPO
    sw zero, 0(t0)
    ret
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
	call ATUALIZA_INVENCIBILIDADE_INIMIGOS  # atualiza o intervalo de dano dos inimigos
	call ATUALIZA_INIMIGOS                   # atualiza ia, limites e ataques
	call ATUALIZA_INVENCIBILIDADE_INIMIGOS  # atualiza o intervalo de dano dos inimigos
	call ATUALIZA_INIMIGOS                   # atualiza ia, limites e ataques
	call CHECA_BATIDA_BLOCO  
	call CHECA_COLISAO_POWERUP
	call CHECA_PORTA   
	call CHECA_COLISAO_PLANTAS
	call CHECA_COLISAO_ANDADORES
	call ATUALIZA_ANDADORES
	call CHECA_COLISOES_INIMIGOS             # chefes da fase atual
	call CHECA_COLISOES_INIMIGOS             # chefes da fase atual
	
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
	call DESENHA_INIMIGOS                    # desenha inimigos e poderes ativos
	call DESENHA_INIMIGOS                    # desenha inimigos e poderes ativos
 
	# sprite base usado antes da seleção da animação atual
	# sprite base usado antes da seleção da animação atual
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
	call CHECA_ATAQUE_PLAYER_INIMIGOS        # liga tiro e soco as rotinas de dano
	call CHECA_ATAQUE_PLAYER_INIMIGOS        # liga tiro e soco as rotinas de dano
	call DESENHA_TIRO
	call DESENHA_POWERUP
	call DESENHA_HUD 
	call DESENHA_ARMA_HUD
	
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
    # Som pulo
    li a0, 72              # Tom alto
	li a1, 150             # Duração curta (150ms)
	li a2, 113             # Instrumento: Tinkle Bell
	li a3, 127             # Volume máximo
	li a7, 31
	ecall
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

	la t4, PROJETIS_ATUAL
	lw t6, 0(t4)
	beqz t6, MV_GRAVIDADE             # sem munição -> não dispara
	addi t6, t6, -1
	sw t6, 0(t4)                      # gasta 1 projétil

	li t6, 1
	la t4, TIRO_ATIVO
	sw t6, 0(t4)
	la t4, PLAYER_X
	lw t6, 0(t4)
	la t4, TIRO_X
	sw t6, 0(t4)                       # posição horizontal inicial do projétil
	sw t6, 0(t4)                       # posição horizontal inicial do projétil
	la t4, PLAYER_Y
	lw t6, 0(t4)
	la t4, TIRO_Y
	sw t6, 0(t4)                       # posição vertical inicial do projétil
	sw t6, 0(t4)                       # posição vertical inicial do projétil
	la t4, FACING
	lw t6, 0(t4)
	la t4, TIRO_DIRECAO
	sw t6, 0(t4)                       # direção inicial baseada no lado do personagem
	sw t6, 0(t4)                       # direção inicial baseada no lado do personagem
	la t4, TIRO_DIST
	sw zero, 0(t4)                     # reinicia a distância percorrida
	# som de tiro
    li a0, 60              # Tom médio
	li a1, 100             # Duração muito curta (100ms)
	li a2, 118             # Instrumento: Synth Drum 
	li a3, 127             # Volume
	li a7, 31
	ecall

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
	li t6, VELY_MAX
	ble t5, t6, MV_SEM_BAIXO_OK
	mv t5, t6
MV_SEM_BAIXO_OK:
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
	li t6, VELY_MAX
	ble t5, t6, MV_SEM_CIMA_OK
	mv t5, t6
MV_SEM_CIMA_OK:
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
	beqz t5, MV_SALVA_X_FIM
	la t6, PLAYER_X
	lw t3, 0(t6)
	add t3, t3, t5
	bge t3, zero, MV_CHECA_MAX
	li t3, 0
	j MV_TESTA_X_PULO
MV_CHECA_MAX:
	la t5, PLAYER_X_MAX_ATUAL
	lw t5, 0(t5)
	ble t3, t5, MV_TESTA_X_PULO
	mv t3, t5
MV_TESTA_X_PULO:
	la t0, PLAYER_X_CANDIDATO
	sw t3, 0(t0)
	mv a0, t3
	call POSICAO_PLAYER_LIVRE          # impede o impulso de entrar em paredes ou plantas
	beqz a0, MV_BLOQUEIA_X_PULO
	la t0, PLAYER_X_CANDIDATO
	lw t3, 0(t0)
	la t6, PLAYER_X
	sw t3, 0(t6)
	j MV_SALVA_X_FIM
MV_BLOQUEIA_X_PULO:
	la t0, VEL_X_PULO
	sw zero, 0(t0)                     # encerra o impulso ao encontrar um obstaculo
MV_SALVA_X_FIM:
 
ATUALIZA_CAMERA:
	la t4, PLAYER_X
	lw t5, 0(t4)
	addi t5, t5, -70
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
	sw ra, 0(sp)
 
	la t0, VIDAS
	lw s2, 0(t0)
	li s3, 0
	li s4, 4
DH_LOOP:
	beq s3, s2, DH_MUNICAO
	la a0, coracao
	mv a1, s4
	li a2, 4
	mv a3, s1
	li a4, 199
	call PRINT_PERSONAGEM
	addi s4, s4, 34
	addi s3, s3, 1
	j DH_LOOP

DH_MUNICAO:
	la t0, PROJETIS_ATUAL
	lw s2, 0(t0)          # quantos tiros restam
	li s3, 0
	li s4, 4              # mesma margem esquerda dos corações
DH_MUNICAO_LOOP:
	beq s3, s2, DH_FIM
	la a0, municao
	mv a1, s4
	li a2, 30             # y abaixo da fileira de corações (ajuste se sobrepor)
	mv a3, s1
	li a4, 199
	call PRINT_PERSONAGEM
	addi s4, s4, 16
	addi s3, s3, 1
	j DH_MUNICAO_LOOP
DH_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret
#---------------------------------------------------------------------------
#                     DESENHA O POWER-UP DE CURA (se ainda não foi pego)
#---------------------------------------------------------------------------
DESENHA_POWERUP:
	addi sp, sp, -4
	sw ra, 0(sp)

	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 2
	beq t1, t2, DP_VETOR

	la t0, POWERUP_ATIVO
	lw t1, 0(t0)
	beqz t1, DP_FIM
 
	la t0, POWERUP_TIPO
	lw t1, 0(t0)
	bnez t1, DP_MUNICAO
	la a0, cura
	j DP_POS
DP_MUNICAO:
	la a0, energia
DP_POS:
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

DP_VETOR:
    la t0, NUM_POWERUPS2
    lw s2, 0(t0)
    la s3, POWERUPS2
    li t3, 0

DP2_LOOP:
    beq t3, s2, DP_FIM               # sai pelo mesmo ponto (restaura ra/sp certinho)

    lw t4, 8(s3)
    beqz t4, DP2_PROXIMA

    lw t5, 0(s3)
    la t6, CAMERA_X
    lw t6, 0(t6)
    sub a1, t5, t6
    bltz a1, DP2_PROXIMA
    li t5, TELA_LARGURA
    bge a1, t5, DP2_PROXIMA

    lw a2, 4(s3)
    lw t5, 12(s3)
    bnez t5, DP2_MUNICAO
    la a0, cura
    j DP2_DESENHA
DP2_MUNICAO:
    la a0, energia
DP2_DESENHA:
    mv a3, s1
    li a4, 199
    call PRINT_PERSONAGEM
DP2_PROXIMA:
    addi s3, s3, TAM_POWERUP2
    addi t3, t3, 1
    j DP2_LOOP
#---------------------------------------------------------------------------
#      DESENHA_ARMA_HUD - mostra no canto sup. direito qual arma está ativa
#---------------------------------------------------------------------------
DESENHA_ARMA_HUD:
    addi sp, sp, -4
    sw ra, 0(sp)

    la t0, ARMA_ATUAL
    lw t1, 0(t0)
    bnez t1, DAH_SOCO

    la a0, canhao            # ícone da arma de TIRO (arma=0)
    j DAH_POS
DAH_SOCO:
    la a0, soco         # ícone da arma de SOCO (arma=1)

DAH_POS:
    lw t4, 0(a0)            # largura do ícone (lida do header da imagem)
    li t5, TELA_LARGURA
    sub t5, t5, t4
    addi a1, t5, -4         # x = borda direita - largura - margem de 4px
    li a2, 4                # y = mesma margem de topo dos corações
    mv a3, s1
    li a4, 199
    call PRINT_PERSONAGEM

    lw ra, 0(sp)
    addi sp, sp, 4
    ret
#---------------------------------------------------------------------------
#      CHECA_COLISAO_POWERUP - personagem encostou no power-up de cura?
#---------------------------------------------------------------------------
CHECA_COLISAO_POWERUP:
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 2
	beq t1, t2, CCP_VETOR       # fase 2 -> usa a lista de power-ups fixos

	la t0, POWERUP_ATIVO
	lw t1, 0(t0)
	beqz t1, CP_FIM                 # já foi coletado, não checa mais
 
	la t0, cura
	lw t6, 0(t0)                    # largura do power-up
	lw t2, 4(t0)                    # altura do power-up
	
	# --- eixo X ---
	la t0, PLAYER_X
	lw t3, 0(t0)
	la t0, POWERUP_X
	lw t4, 0(t0)
 
	add t5, t4, t6
	bge t3, t5, CP_FIM
 
	li t5, LARG_PERSONAGEM
	add t5, t3, t5
	ble t5, t4, CP_FIM
 
	# --- eixo Y ---
	la t0, PLAYER_Y
	lw t3, 0(t0)
	la t0, POWERUP_Y
	lw t4, 0(t0)
 
	add t5, t4, t2
	bge t3, t5, CP_FIM
 
	li t5, LARG_PERSONAGEM
	add t5, t3, t5
	ble t5, t4, CP_FIM
 
	# --- colidiu! ---
	la t0, POWERUP_TIPO
	lw t1, 0(t0)
	bnez t1, CP_MUNICAO

	la t0, VIDAS
	lw t1, 0(t0)
	la t4, VIDAS_MAX
	lw t4, 0(t4)
	bge t1, t4, CP_REMOVE
	addi t1, t1, 1
	sw t1, 0(t0)
	j CP_REMOVE

CP_MUNICAO:
	la t0, PROJETIS_ATUAL
	li t1, PROJETIS_MAX
	sw t1, 0(t0)

CP_REMOVE:
    # Som para pegar power
    li a0, 84              # Tom mais alto
	li a1, 300             # Duração média-longa (300ms)
	li a2, 9               # Instrumento: Glockenspiel (som de brilho/moeda)
	li a3, 127             # Volume
	li a7, 31
	ecall

	la t0, POWERUP_ATIVO
	sw zero, 0(t0)
CP_FIM:
	ret

CCP_VETOR:
    la t0, NUM_POWERUPS2
    lw s2, 0(t0)
    la s3, POWERUPS2
    li t3, 0

CCP2_LOOP:
    beq t3, s2, CP_FIM              # reaproveita o mesmo ponto de saída

    lw t4, 8(s3)                    # ativo?
    beqz t4, CCP2_PROXIMA

    lw a0, 12(s3)                   # tipo
    bnez a0, CCP2_TAM_MUNICAO
    la a1, cura
    j CCP2_TAM_OK
CCP2_TAM_MUNICAO:
    la a1, energia
CCP2_TAM_OK:
    lw t6, 0(a1)
    lw t2, 4(a1)

    lw t5, 0(s3)
    la t0, PLAYER_X
    lw t1, 0(t0)
    add t4, t5, t6
    bge t1, t4, CCP2_PROXIMA
    li t4, LARG_PERSONAGEM
    add t4, t1, t4
    ble t4, t5, CCP2_PROXIMA

    lw t5, 4(s3)
    la t0, PLAYER_Y
    lw t1, 0(t0)
    add t4, t5, t2
    bge t1, t4, CCP2_PROXIMA
    li t4, LARG_PERSONAGEM
    add t4, t1, t4
    ble t4, t5, CCP2_PROXIMA

    lw a0, 12(s3)
    bnez a0, CCP2_MUNICAO
    la t0, VIDAS
    lw t1, 0(t0)
    la t4, VIDAS_MAX
    lw t4, 0(t4)
    bge t1, t4, CCP2_REMOVE
    addi t1, t1, 1
    sw t1, 0(t0)
    j CCP2_REMOVE
CCP2_MUNICAO:
    la t0, PROJETIS_ATUAL
    li t1, PROJETIS_MAX
    sw t1, 0(t0)
CCP2_REMOVE:
    sw zero, 8(s3)
CCP2_PROXIMA:
    addi s3, s3, TAM_POWERUP2
    addi t3, t3, 1
    j CCP2_LOOP
# ---------------------------------------------------------
# Le o valor do tile numa posição do MUNDO
# ---------------------------------------------------------
# a0 = x no mundo (pixels)
# a1 = y na tela (pixels)   -- mesma escala que PLAYER_Y
# retorna em a0 o valor do tile (0,1,2,3,4,5)
GET_TILE:
    bltz a0, GET_TILE_FORA        # impede acesso antes do inicio do mapa
    bltz a1, GET_TILE_FORA        # impede acesso acima da tela
    la t0, PLAYER_X_MAX_ATUAL
    lw t0, 0(t0)
    addi t0, t0, LARG_PERSONAGEM
    bge a0, t0, GET_TILE_FORA     # usa a largura real da fase atual
    li t0, 240
    bge a1, t0, GET_TILE_FORA     # impede leitura abaixo da matriz

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
GET_TILE_FORA:
    li a0, 1                # fora do mapa funciona como parede sólida
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
    la t0, POWERUP_TIPO
    sw t2, 0(t0)                    # guarda o tipo ANTES da call
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
 
    # registra a posição e ativa o power-up de cura
    # registra a posição e ativa o power-up de cura
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

    li t1, 4
    bne a0, t1, CP_PORTA_FIM

    la t0, FASE_ATUAL
    lw t1, 0(t0)
    li t2, 1
    beq t1, t2, CP_CHECA_BOWSER
    li t2, 2
    beq t1, t2, CP_CHECA_FASE2
    j CP_PORTA_FIM

CP_CHECA_BOWSER:
    la t0, BOWSER_ATIVO
    lw t1, 0(t0)
    bnez t1, CP_PORTA_FIM                 # não sai da fase 1 com o chefão vivo
    lw ra, 0(sp)
    addi sp, sp, 4
    j TRANSICAO_FASE2

CP_CHECA_FASE2:
    la t0, ROSALINA_ATIVA
    lw t1, 0(t0)
    bnez t1, CP_PORTA_FIM
    la t0, MARIO_ATIVO
    lw t1, 0(t0)
    bnez t1, CP_PORTA_FIM                 # vitória apenas depois dos dois chefes
    lw ra, 0(sp)
    addi sp, sp, 4
    j TELA_VITORIA

CP_PORTA_FIM:
    lw ra, 0(sp)
    addi sp, sp, 4
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
    la t0, NUM_ANDADORES
    sw zero, 0(t0)

    # encerra todos os efeitos da fase 1
    la t0, BOWSER_ATIVO
    sw zero, 0(t0)
    la t0, BOWSER_LIBERADO
    sw zero, 0(t0)
    la t0, FOGO_BOWSER_ATIVO
    sw zero, 0(t0)
    la t0, IMPACTO_BOWSER_ATIVO
    sw zero, 0(t0)

    # Rosalina: primeira arena da fase 2
    la t0, ROSALINA_X
    li t1, 650
    sw t1, 0(t0)
    la t0, ROSALINA_Y
    li t1, 90
    sw t1, 0(t0)
    la t0, ROSALINA_ATIVA
    li t1, 1
    sw t1, 0(t0)
    la t0, ROSALINA_LIBERADA
    sw zero, 0(t0)
    la t0, ROSALINA_VIDA
    li t1, 4
    sw t1, 0(t0)
    la t0, ROSALINA_ESTADO
    sw zero, 0(t0)
    la t0, ROSALINA_TIMER
    sw zero, 0(t0)
    la t0, ESTRELA_ROSALINA_ATIVA
    sw zero, 0(t0)
    la t0, ESTRELA_ROSALINA_AVISO
    sw zero, 0(t0)

    # Mario: arena final, bloqueado até Rosalina ser derrotada
    la t0, MARIO_X
    li t1, 1540
    sw t1, 0(t0)
    la t0, MARIO_Y
    li t1, 100
    sw t1, 0(t0)
    la t0, MARIO_ATIVO
    li t1, 1
    sw t1, 0(t0)
    la t0, MARIO_LIBERADO
    sw zero, 0(t0)
    la t0, MARIO_VIDA
    li t1, 12
    sw t1, 0(t0)
    la t0, MARIO_FASE
    li t1, 1
    sw t1, 0(t0)
    la t0, MARIO_ESTADO
    sw zero, 0(t0)
    la t0, MARIO_TIMER
    sw zero, 0(t0)
    la t0, MARIO_PROJETIL_ATIVO
    sw zero, 0(t0)
    la t0, MARIO_COPIA_ATIVA
    sw zero, 0(t0)
    la t0, IMPACTO_MARIO_ATIVO
    sw zero, 0(t0)
    la t0, NUM_ANDADORES
    sw zero, 0(t0)

    # encerra todos os efeitos da fase 1
    la t0, BOWSER_ATIVO
    sw zero, 0(t0)
    la t0, BOWSER_LIBERADO
    sw zero, 0(t0)
    la t0, FOGO_BOWSER_ATIVO
    sw zero, 0(t0)
    la t0, IMPACTO_BOWSER_ATIVO
    sw zero, 0(t0)

    # Rosalina: primeira arena da fase 2
    la t0, ROSALINA_X
    li t1, 650
    sw t1, 0(t0)
    la t0, ROSALINA_Y
    li t1, 90
    sw t1, 0(t0)
    la t0, ROSALINA_ATIVA
    li t1, 1
    sw t1, 0(t0)
    la t0, ROSALINA_LIBERADA
    sw zero, 0(t0)
    la t0, ROSALINA_VIDA
    li t1, 4
    sw t1, 0(t0)
    la t0, ROSALINA_ESTADO
    sw zero, 0(t0)
    la t0, ROSALINA_TIMER
    sw zero, 0(t0)
    la t0, ESTRELA_ROSALINA_ATIVA
    sw zero, 0(t0)
    la t0, ESTRELA_ROSALINA_AVISO
    sw zero, 0(t0)

    # Mario: arena final, bloqueado até Rosalina ser derrotada
    la t0, MARIO_X
    li t1, 1540
    sw t1, 0(t0)
    la t0, MARIO_Y
    li t1, 100
    sw t1, 0(t0)
    la t0, MARIO_ATIVO
    li t1, 1
    sw t1, 0(t0)
    la t0, MARIO_LIBERADO
    sw zero, 0(t0)
    la t0, MARIO_VIDA
    li t1, 12
    sw t1, 0(t0)
    la t0, MARIO_FASE
    li t1, 1
    sw t1, 0(t0)
    la t0, MARIO_ESTADO
    sw zero, 0(t0)
    la t0, MARIO_TIMER
    sw zero, 0(t0)
    la t0, MARIO_PROJETIL_ATIVO
    sw zero, 0(t0)
    la t0, MARIO_COPIA_ATIVA
    sw zero, 0(t0)
    la t0, IMPACTO_MARIO_ATIVO
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

    la t0, FAIXA_ATUAL
    li t1, 4               # Define que agora toca a faixa 4
    sw t1, 0(t0)           
    
    la t0, NOTAS_TOCADAS
    sw zero, 0(t0)         # Zera o contador de notas
    
    la t0, NOTA_ATUAL_PTR
    la t1, NOTAS_4
    sw t1, 0(t0)           # Aponta para a nova música
    
    la t0, PROX_NOTA_TEMPO
    sw zero, 0(t0)         # Zera o timer para tocar instantaneamente

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
    # logica musica vitoria
    la t0, FAIXA_ATUAL
    li t1, 6
    sw t1, 0(t0)           
    la t0, NOTAS_TOCADAS
    sw zero, 0(t0)         
    la t0, NOTA_ATUAL_PTR
    la t1, NOTAS_6
    sw t1, 0(t0)           
    la t0, PROX_NOTA_TEMPO
    sw zero, 0(t0)

    # espera 5 minutos (3000 x 100ms)
    li s5, 3000
TV_ESPERA:
    call TOCA_MUSICA
    li a0, 10
    li a7, 32
    ecall
    addi s5, s5, -1
    bnez s5, TV_ESPERA

    li a7, 10
    ecall
    
#---------------------------------------------------------------------------
#                     controle geral dos inimigos
#---------------------------------------------------------------------------
ATUALIZA_INVENCIBILIDADE_INIMIGOS:
    la t0, ROSALINA_INVENCIVEL
    lw t1, 0(t0)
    beqz t1, AII_BOWSER
    addi t1, t1, -1
    sw t1, 0(t0)
AII_BOWSER:
    la t0, BOWSER_INVENCIVEL
    lw t1, 0(t0)
    beqz t1, AII_MARIO
    addi t1, t1, -1
    sw t1, 0(t0)
AII_MARIO:
    la t0, MARIO_INVENCIVEL
    lw t1, 0(t0)
    beqz t1, AII_POSE_ROSALINA
    addi t1, t1, -1
    sw t1, 0(t0)
AII_POSE_ROSALINA:
    la t0, ROSALINA_POSE_ATAQUE
    lw t1, 0(t0)
    beqz t1, AII_POSE_BOWSER
    addi t1, t1, -1
    sw t1, 0(t0)
AII_POSE_BOWSER:
    la t0, BOWSER_POSE_ATAQUE
    lw t1, 0(t0)
    beqz t1, AII_POSE_MARIO
    addi t1, t1, -1
    sw t1, 0(t0)
AII_POSE_MARIO:
    la t0, MARIO_POSE_ATAQUE
    lw t1, 0(t0)
    beqz t1, AII_FIM
    addi t1, t1, -1
    sw t1, 0(t0)
AII_FIM:
    ret

ATUALIZA_INIMIGOS:
    addi sp, sp, -4
    sw ra, 0(sp)
    call SALVA_POSICOES_INIMIGOS
    call ATUALIZA_ROSALINA
    call ATUALIZA_BOWSER
    call ATUALIZA_MARIO
    call AJUSTA_MOVIMENTO_INIMIGOS
    call REMOVE_PROJETEIS_SOBRE_MAPA
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

CHECA_COLISOES_INIMIGOS:
    addi sp, sp, -4
    sw ra, 0(sp)
    call CHECA_COLISOES_ROSALINA
    call CHECA_COLISOES_BOWSER
    call CHECA_COLISOES_MARIO
    call SEPARA_PLAYER_INIMIGOS
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

DESENHA_INIMIGOS:
    addi sp, sp, -4
    sw ra, 0(sp)
    call DESENHA_ROSALINA
    call DESENHA_BOWSER
    call DESENHA_MARIO
    lw ra, 0(sp)
    addi sp, sp, 4
    ret


#---------------------------------------------------------------------------
#                     ajuste de movimento e sobreposição
#---------------------------------------------------------------------------
SALVA_POSICOES_INIMIGOS:
    la t0, ROSALINA_X
    lw t1, 0(t0)
    la t2, ROSALINA_X_ANTERIOR
    sw t1, 0(t2)
    la t0, ROSALINA_Y
    lw t1, 0(t0)
    la t2, ROSALINA_Y_ANTERIOR
    sw t1, 0(t2)

    la t0, BOWSER_X
    lw t1, 0(t0)
    la t2, BOWSER_X_ANTERIOR
    sw t1, 0(t2)
    la t0, BOWSER_Y
    lw t1, 0(t0)
    la t2, BOWSER_Y_ANTERIOR
    sw t1, 0(t2)

    la t0, MARIO_X
    lw t1, 0(t0)
    la t2, MARIO_X_ANTERIOR
    sw t1, 0(t2)
    la t0, MARIO_Y
    lw t1, 0(t0)
    la t2, MARIO_Y_ANTERIOR
    sw t1, 0(t2)
    ret

AJUSTA_MOVIMENTO_INIMIGOS:
    addi sp, sp, -4
    sw ra, 0(sp)
    call AJUSTA_MOVIMENTO_ROSALINA
    call AJUSTA_MOVIMENTO_BOWSER
    call AJUSTA_MOVIMENTO_MARIO
    call EVITA_SOBREPOSICAO_INIMIGOS
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# a0 = x atual; a1 e a2 ficam reservados para a arena da fase 2
# retorna a0 com o sprite inteiro dentro da tela
LIMITA_X_ARENA_TELA:
	la t0, CAMERA_X
	lw t0, 0(t0)
	addi t1, t0, MARGEM_TELA_INIMIGO       # limite esquerdo visivel
	addi t2, t0, 228                       # 320 - 80 - margem

	mv t3, a1                             # combina arena e tela pela esquerda
	bge t3, t1, LXAT_LIMITE_ESQ_OK
	mv t3, t1
LXAT_LIMITE_ESQ_OK:
	mv t4, a2                             # combina arena e tela pela direita
	ble t4, t2, LXAT_LIMITE_DIR_OK
	mv t4, t2
LXAT_LIMITE_DIR_OK:
	ble t3, t4, LXAT_APLICA
	mv t3, t1                             # sem intersecao: usa somente a area visivel
	mv t4, t2
LXAT_APLICA:
	bge a0, t3, LXAT_CHECA_MAX
	mv a0, t3
LXAT_CHECA_MAX:
	ble a0, t4, LXAT_FIM
	mv a0, t4
LXAT_FIM:
	ret

# a0 = x atual do sprite, a1 = x anterior do sprite, a2 = y do inimigo
# retorna a0 sem deixar a hitbox util atravessar o jogador
IMPEDE_INIMIGO_ATRAVESSAR_PLAYER:
	la t0, PLAYER_Y
	lw t1, 0(t0)
	addi t2, t1, LARG_PERSONAGEM
	addi t3, a2, INIMIGO_HITBOX_Y
	bge t3, t2, IIAP_FIM                  # hitbox totalmente abaixo
	addi t4, t3, INIMIGO_HITBOX_ALTURA
	ble t4, t1, IIAP_FIM                  # hitbox totalmente acima

	la t0, PLAYER_X
	lw t1, 0(t0)
	addi t2, t1, LARG_PERSONAGEM
	addi t3, a1, INIMIGO_HITBOX_X
	bge t3, t2, IIAP_VINHA_DIREITA        # hitbox anterior estava a direita
	addi t4, t3, INIMIGO_HITBOX_LARGURA
	ble t4, t1, IIAP_VINHA_ESQUERDA       # hitbox anterior estava a esquerda
	j IIAP_FIM
IIAP_VINHA_DIREITA:
	addi t3, a0, INIMIGO_HITBOX_X
	bge t3, t2, IIAP_FIM
	addi a0, t2, -11                      # apenas 1 pixel de contato na hitbox
	j IIAP_FIM
IIAP_VINHA_ESQUERDA:
	addi t3, a0, INIMIGO_HITBOX_X
	addi t3, t3, INIMIGO_HITBOX_LARGURA
	ble t3, t1, IIAP_FIM
	addi a0, t1, -69                      # apenas 1 pixel de contato na hitbox
IIAP_FIM:
	ret

AJUSTA_MOVIMENTO_ROSALINA:
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, ROSALINA_ATIVA
	lw t1, 0(t0)
	beqz t1, AMR_FIM
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 2
	bne t1, t2, AMR_FIM
	la t0, ROSALINA_LIBERADA
	lw t1, 0(t0)
	beqz t1, AMR_FIM
	la t0, ROSALINA_MOVIMENTO_TIMER
	lw t5, 0(t0)
	addi t5, t5, 1
	sw t5, 0(t0)                    # contador continuo usado pela patrulha

	la t0, ROSALINA_X_ANTERIOR
	lw t1, 0(t0)
	la t0, ROSALINA_X
	lw t2, 0(t0)
	sub t3, t2, t1
	li t4, 2                         # resposta lateral em todos os quadros
	ble t3, t4, AMR_CHECA_NEG_X
	addi t2, t1, 2
	j AMR_LIMITA_X
AMR_CHECA_NEG_X:
	li t4, -2
	bge t3, t4, AMR_LIMITA_X
	addi t2, t1, -2
AMR_LIMITA_X:
	mv a0, t2
	li a1, ROSALINA_X_MIN
	li a2, ROSALINA_X_MAX
	call LIMITA_X_ARENA_TELA
	la t0, ROSALINA_X
	sw a0, 0(t0)

	la t0, ROSALINA_Y_ANTERIOR
	lw t1, 0(t0)
	la t0, ROSALINA_Y
	lw t2, 0(t0)
	sub t3, t2, t1
	li t4, 1
	ble t3, t4, AMR_CHECA_NEG_Y
	addi t2, t1, 1
	j AMR_LIMITA_Y
AMR_CHECA_NEG_Y:
	li t4, -1
	bge t3, t4, AMR_LIMITA_Y
	addi t2, t1, -1
AMR_LIMITA_Y:
	li t3, ROSALINA_Y_MIN
	bge t2, t3, AMR_Y_MAX
	mv t2, t3
AMR_Y_MAX:
	li t3, ROSALINA_Y_MAX
	ble t2, t3, AMR_SALVA_Y
	mv t2, t3
AMR_SALVA_Y:
	la t0, ROSALINA_Y
	sw t2, 0(t0)
AMR_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

AJUSTA_MOVIMENTO_BOWSER:
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, BOWSER_ATIVO
	lw t1, 0(t0)
	beqz t1, AMB_FIM
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 1
	bne t1, t2, AMB_FIM
	la t0, BOWSER_LIBERADO
	lw t1, 0(t0)
	beqz t1, AMB_FIM

	li t5, 3                         # velocidade normal no chao
	la t0, BOWSER_ESTADO
	lw t1, 0(t0)
	li t2, BOW_ESTADO_INVESTIDA
	bne t1, t2, AMB_CHECA_SALTO
	li t5, 7                         # velocidade maxima da investida
	j AMB_DELTA_X
AMB_CHECA_SALTO:
	li t2, BOW_ESTADO_SALTO
	bne t1, t2, AMB_DELTA_X
	li t5, 4
AMB_DELTA_X:
	la t0, BOWSER_X_ANTERIOR
	lw t1, 0(t0)
	la t0, BOWSER_X
	lw t2, 0(t0)
	sub t3, t2, t1
	ble t3, t5, AMB_CHECA_NEG_X
	add t2, t1, t5
	j AMB_LIMITA_X
AMB_CHECA_NEG_X:
	neg t4, t5
	bge t3, t4, AMB_LIMITA_X
	sub t2, t1, t5
AMB_LIMITA_X:
	mv a0, t2
	li a1, BOWSER_X_MIN
	li a2, BOWSER_X_MAX
	call LIMITA_X_ARENA_TELA
	mv t6, a0
	mv a0, t6
	la t0, BOWSER_X_ANTERIOR
	lw a1, 0(t0)
	la t0, BOWSER_Y
	lw a2, 0(t0)
#	call IMPEDE_INIMIGO_ATRAVESSAR_PLAYER # para no corpo do jogador sem atravessar
	mv t6, a0
	
	la t0, CAMERA_X
	lw t1, 0(t0)
	addi t2, t1, MARGEM_TELA_INIMIGO
	ble t6, t2, AMB_VIRA_DIREITA
	addi t2, t1, 224
	bge t6, t2, AMB_VIRA_ESQUERDA
	j AMB_SALVA_X
AMB_VIRA_DIREITA:
	la t0, BOWSER_DIRECAO
	li t1, 1
	sw t1, 0(t0)
	j AMB_SALVA_X
AMB_VIRA_ESQUERDA:
	la t0, BOWSER_DIRECAO
	li t1, -1
	sw t1, 0(t0)
AMB_SALVA_X:
	la t0, BOWSER_X
	sw t6, 0(t0)

	la t0, BOWSER_Y
	lw t1, 0(t0)
	li t2, BOWSER_Y_MIN
	bge t1, t2, AMB_Y_MAX
	mv t1, t2
AMB_Y_MAX:
	li t2, BOWSER_Y_MAX
	ble t1, t2, AMB_SALVA_Y
	mv t1, t2
AMB_SALVA_Y:
	la t0, BOWSER_Y
	sw t1, 0(t0)
AMB_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

AJUSTA_MOVIMENTO_MARIO:
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, MARIO_ATIVO
	lw t1, 0(t0)
	beqz t1, AMM_FIM
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 2
	bne t1, t2, AMM_FIM
	la t0, MARIO_LIBERADO
	lw t1, 0(t0)
	beqz t1, AMM_FIM

	li t5, 3
	la t0, MARIO_ESTADO
	lw t1, 0(t0)
	li t2, MARIO_ESTADO_INVESTIDA
	bne t1, t2, AMM_CHECA_PULO
	li t5, 8
	j AMM_DELTA_X
AMM_CHECA_PULO:
	li t2, MARIO_ESTADO_PULO
	bne t1, t2, AMM_DELTA_X
	li t5, 4
AMM_DELTA_X:
	la t0, MARIO_X_ANTERIOR
	lw t1, 0(t0)
	la t0, MARIO_X
	lw t2, 0(t0)
	sub t3, t2, t1
	ble t3, t5, AMM_CHECA_NEG_X
	add t2, t1, t5
	j AMM_LIMITA_X
AMM_CHECA_NEG_X:
	neg t4, t5
	bge t3, t4, AMM_LIMITA_X
	sub t2, t1, t5
AMM_LIMITA_X:
	mv a0, t2
	li a1, MARIO_X_MIN
	li a2, MARIO_X_MAX
	call LIMITA_X_ARENA_TELA
	mv t6, a0
	mv a0, t6
	la t0, MARIO_X_ANTERIOR
	lw a1, 0(t0)
	la t0, MARIO_Y
	lw a2, 0(t0)
	call IMPEDE_INIMIGO_ATRAVESSAR_PLAYER # ataque para no jogador
	mv t6, a0
	la t0, CAMERA_X
	lw t1, 0(t0)
	addi t2, t1, MARGEM_TELA_INIMIGO
	ble t6, t2, AMM_VIRA_DIREITA
	addi t2, t1, 224
	bge t6, t2, AMM_VIRA_ESQUERDA
	j AMM_SALVA_X
AMM_VIRA_DIREITA:
	la t0, MARIO_DIRECAO
	li t1, 1
	sw t1, 0(t0)
	j AMM_SALVA_X
AMM_VIRA_ESQUERDA:
	la t0, MARIO_DIRECAO
	li t1, -1
	sw t1, 0(t0)
AMM_SALVA_X:
	la t0, MARIO_X
	sw t6, 0(t0)

	la t0, MARIO_Y
	lw t1, 0(t0)
	li t2, MARIO_Y_MIN
	bge t1, t2, AMM_Y_MAX
	mv t1, t2
AMM_Y_MAX:
	li t2, MARIO_Y_MAX
	ble t1, t2, AMM_SALVA_Y
	mv t1, t2
AMM_SALVA_Y:
	la t0, MARIO_Y
	sw t1, 0(t0)
	call AJUSTA_COPIA_MARIO
AMM_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

AJUSTA_COPIA_MARIO:
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, MARIO_COPIA_ATIVA
	lw t1, 0(t0)
	beqz t1, ACM_FIM
	la t0, MARIO_COPIA_X
	lw a0, 0(t0)
	li a1, MARIO_X_MIN
	li a2, MARIO_X_MAX
	call LIMITA_X_ARENA_TELA
	mv t2, a0
	la t0, MARIO_X
	lw t3, 0(t0)
	sub t4, t2, t3
	mv t5, t4
	bgez t5, ACM_ABS_OK
	neg t5, t5
ACM_ABS_OK:
	li t6, 96
	bge t5, t6, ACM_SALVA
	bltz t4, ACM_COLOCA_ESQ
	addi t2, t3, 120
	j ACM_LIMITA
ACM_COLOCA_ESQ:
	addi t2, t3, -120
ACM_LIMITA:
	mv a0, t2
	li a1, MARIO_X_MIN
	li a2, MARIO_X_MAX
	call LIMITA_X_ARENA_TELA
	mv t2, a0
ACM_SALVA:
	la t0, MARIO_COPIA_X
	sw t2, 0(t0)
ACM_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

# impede que os corpos atravessem plantas ou ocupem a mesma area
EVITA_SOBREPOSICAO_INIMIGOS:
    addi sp, sp, -4
    sw ra, 0(sp)
    call EVITA_SOBREPOSICAO_MAPA
    call EVITA_PLANTA_BOWSER
    call EVITA_INIMIGOS_ENTRE_SI
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# a0 = x atual, a1 = y atual, a2 = x anterior
# retorna a0 na posicao mais proxima que nao ocupa uma planta
AJUSTA_X_FORA_PLANTAS:
	addi sp, sp, -28
	sw ra, 24(sp)
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw a2, 8(sp)
	li t0, 4
	sw t0, 12(sp)                    # distancia inicial da busca

	li a2, INIMIGO_LARGURA
	li a3, INIMIGO_ALTURA
	call CAIXA_COLIDE_PLANTAS
	beqz a0, AXFP_USA_ATUAL

	lw a0, 8(sp)                     # tenta primeiro a posicao do quadro anterior
	lw a1, 4(sp)
	li a2, INIMIGO_LARGURA
	li a3, INIMIGO_ALTURA
	call CAIXA_COLIDE_PLANTAS
	beqz a0, AXFP_USA_ANTERIOR

AXFP_BUSCA:
	lw t0, 12(sp)
	li t1, 112
	bgt t0, t1, AXFP_USA_ANTERIOR

	lw t2, 0(sp)
	add t2, t2, t0                  # testa o lado direito
	mv a0, t2
	call POSICAO_INIMIGO_VISIVEL
	beqz a0, AXFP_TESTA_ESQUERDA
	mv a0, t2
	lw a1, 4(sp)
	li a2, INIMIGO_LARGURA
	li a3, INIMIGO_ALTURA
	call CAIXA_COLIDE_PLANTAS
	beqz a0, AXFP_SALVA_DIREITA

AXFP_TESTA_ESQUERDA:
	lw t0, 12(sp)
	lw t2, 0(sp)
	sub t2, t2, t0                  # testa o lado esquerdo
	mv a0, t2
	call POSICAO_INIMIGO_VISIVEL
	beqz a0, AXFP_PROXIMA
	mv a0, t2
	lw a1, 4(sp)
	li a2, INIMIGO_LARGURA
	li a3, INIMIGO_ALTURA
	call CAIXA_COLIDE_PLANTAS
	beqz a0, AXFP_SALVA_ESQUERDA

AXFP_PROXIMA:
	lw t0, 12(sp)
	addi t0, t0, 4
	sw t0, 12(sp)
	j AXFP_BUSCA

AXFP_SALVA_DIREITA:
	lw t0, 12(sp)
	lw a0, 0(sp)
	add a0, a0, t0
	li a1, 1
	j AXFP_FIM
AXFP_SALVA_ESQUERDA:
	lw t0, 12(sp)
	lw a0, 0(sp)
	sub a0, a0, t0
	li a1, 1
	j AXFP_FIM
AXFP_USA_ATUAL:
	lw a0, 0(sp)
	li a1, 0
	j AXFP_FIM
AXFP_USA_ANTERIOR:
	lw a0, 8(sp)
	li a1, 1
AXFP_FIM:
	lw ra, 24(sp)
	addi sp, sp, 28
	ret

# a0 = x candidato; retorna 1 quando o sprite inteiro cabe na tela
POSICAO_INIMIGO_VISIVEL:
	la t0, CAMERA_X
	lw t0, 0(t0)
	addi t1, t0, MARGEM_TELA_INIMIGO
	blt a0, t1, PIV_NAO
	addi t1, t0, 224                 # 320 - 80 - 16
	bgt a0, t1, PIV_NAO
	li a0, 1
	ret
PIV_NAO:
	li a0, 0
	ret

EVITA_PLANTA_ROSALINA:
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 2
	bne t1, t2, EPR_FIM
	la t0, ROSALINA_ATIVA
	lw t1, 0(t0)
	beqz t1, EPR_FIM
	la t0, ROSALINA_LIBERADA
	lw t1, 0(t0)
	beqz t1, EPR_FIM
	la t0, ROSALINA_X
	lw a0, 0(t0)
	la t0, ROSALINA_Y
	lw a1, 0(t0)
	la t0, ROSALINA_X_ANTERIOR
	lw a2, 0(t0)
	call AJUSTA_X_FORA_PLANTAS
	beqz a1, EPR_FIM
	la t0, ROSALINA_X
	sw a0, 0(t0)
	la t0, ROSALINA_DIRECAO_X         # inverte o voo ao encontrar a planta
	lw t1, 0(t0)
	neg t1, t1
	sw t1, 0(t0)
EPR_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

EVITA_PLANTA_BOWSER:
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 1
	bne t1, t2, EPB_FIM
	la t0, BOWSER_ATIVO
	lw t1, 0(t0)
	beqz t1, EPB_FIM
	la t0, BOWSER_X
	lw a0, 0(t0)
	la t0, BOWSER_Y
	lw a1, 0(t0)
	la t0, BOWSER_X_ANTERIOR
	lw a2, 0(t0)
	call AJUSTA_X_FORA_PLANTAS
	beqz a1, EPB_FIM
	la t0, BOWSER_X
	sw a0, 0(t0)
	la t0, BOWSER_DIRECAO             # volta quando a planta bloqueia o caminho
	lw t1, 0(t0)
	neg t1, t1
	sw t1, 0(t0)
EPB_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

EVITA_PLANTA_MARIO:
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, MARIO_ATIVO
	lw t1, 0(t0)
	beqz t1, EPM_COPIA
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 2
	bne t1, t2, EPM_FIM
	la t0, MARIO_X
	lw a0, 0(t0)
	la t0, MARIO_Y
	lw a1, 0(t0)
	la t0, MARIO_X_ANTERIOR
	lw a2, 0(t0)
	call AJUSTA_X_FORA_PLANTAS
	la t0, MARIO_X
	sw a0, 0(t0)
EPM_COPIA:
	la t0, MARIO_COPIA_ATIVA
	lw t1, 0(t0)
	beqz t1, EPM_FIM
	la t0, MARIO_COPIA_X
	lw a0, 0(t0)
	la t0, MARIO_Y
	lw a1, 0(t0)
	mv a2, a0
	call AJUSTA_X_FORA_PLANTAS
	la t0, MARIO_COPIA_X
	sw a0, 0(t0)
EPM_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

# os encontros usam faixas diferentes, mas a verificacao evita contato residual
EVITA_INIMIGOS_ENTRE_SI:
    addi sp, sp, -4
    sw ra, 0(sp)
    la t0, FASE_ATUAL
    lw t1, 0(t0)
    li t2, 2
    bne t1, t2, EIES_FIM
    la t0, ROSALINA_ATIVA
    lw t1, 0(t0)
    beqz t1, EIES_FIM
    la t0, MARIO_ATIVO
    lw t1, 0(t0)
    beqz t1, EIES_FIM
    la t0, ROSALINA_X
    lw a0, 0(t0)
    la t0, ROSALINA_Y
    lw a1, 0(t0)
    li a2, INIMIGO_LARGURA
    li a3, INIMIGO_ALTURA
    la t0, MARIO_X
    lw a4, 0(t0)
    la t0, MARIO_Y
    lw a5, 0(t0)
    li a6, INIMIGO_LARGURA
    li a7, INIMIGO_ALTURA
    call COLIDE_CAIXAS
    beqz a0, EIES_FIM
    la t0, ROSALINA_X_ANTERIOR
    lw t1, 0(t0)
    la t0, ROSALINA_X
    sw t1, 0(t0)
    la t0, MARIO_X_ANTERIOR
    lw t1, 0(t0)
    la t0, MARIO_X
    sw t1, 0(t0)
EIES_FIM:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# remove os ataques que entram na mesma area visual de uma planta
REMOVE_PROJETEIS_SOBRE_PLANTAS:
    addi sp, sp, -4
    sw ra, 0(sp)
    la t0, ESTRELA_ROSALINA_ATIVA
    lw t1, 0(t0)
    beqz t1, RPSP_FOGO
    la t0, ESTRELA_ROSALINA_X
    lw a0, 0(t0)
    la t0, ESTRELA_ROSALINA_Y
    lw a1, 0(t0)
    li a2, ESTRELA_ROSALINA_TAMANHO
    li a3, ESTRELA_ROSALINA_TAMANHO
    call CAIXA_COLIDE_PLANTAS
    beqz a0, RPSP_FOGO
    la t0, ESTRELA_ROSALINA_ATIVA
    sw zero, 0(t0)
RPSP_FOGO:
    la t0, FOGO_BOWSER_ATIVO
    lw t1, 0(t0)
    beqz t1, RPSP_MARIO
    la t0, FOGO_BOWSER_X
    lw a0, 0(t0)
    la t0, FOGO_BOWSER_Y
    lw a1, 0(t0)
    li a2, 20
    li a3, 12
    call CAIXA_COLIDE_PLANTAS
    beqz a0, RPSP_MARIO
    la t0, FOGO_BOWSER_ATIVO
    sw zero, 0(t0)
RPSP_MARIO:
    la t0, MARIO_PROJETIL_ATIVO
    lw t1, 0(t0)
    beqz t1, RPSP_FIM
    la t0, MARIO_PROJETIL_X
    lw a0, 0(t0)
    la t0, MARIO_PROJETIL_Y
    lw a1, 0(t0)
    li a2, PROJETIL_PEQUENO
    li a3, PROJETIL_PEQUENO
    call CAIXA_COLIDE_PLANTAS
    beqz a0, RPSP_FIM
    la t0, MARIO_PROJETIL_ATIVO
    sw zero, 0(t0)
RPSP_FIM:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# remove poderes quando o centro entra em um tile solido
REMOVE_PROJETEIS_SOBRE_MAPA:
    addi sp, sp, -4
    sw ra, 0(sp)
    la t0, ESTRELA_ROSALINA_ATIVA
    lw t1, 0(t0)
    beqz t1, RPSM_FOGO
    la t0, ESTRELA_ROSALINA_X
    lw a0, 0(t0)
    addi a0, a0, 9
    la t0, ESTRELA_ROSALINA_Y
    lw a1, 0(t0)
    addi a1, a1, 9
    call GET_TILE
    call EH_SOLIDO_AUX
    beqz a0, RPSM_FOGO
    la t0, ESTRELA_ROSALINA_ATIVA
    sw zero, 0(t0)
RPSM_FOGO:
    la t0, FOGO_BOWSER_ATIVO
    lw t1, 0(t0)
    beqz t1, RPSM_MARIO
    la t0, FOGO_BOWSER_X
    lw a0, 0(t0)
    addi a0, a0, 10
    la t0, FOGO_BOWSER_Y
    lw a1, 0(t0)
    addi a1, a1, 6
    call GET_TILE
    call EH_SOLIDO_AUX
    beqz a0, RPSM_MARIO
    la t0, FOGO_BOWSER_ATIVO
    sw zero, 0(t0)
RPSM_MARIO:
    la t0, MARIO_PROJETIL_ATIVO
    lw t1, 0(t0)
    beqz t1, RPSM_FIM
    la t0, MARIO_PROJETIL_X
    lw a0, 0(t0)
    addi a0, a0, 8
    la t0, MARIO_PROJETIL_Y
    lw a1, 0(t0)
    addi a1, a1, 8
    call GET_TILE
    call EH_SOLIDO_AUX
    beqz a0, RPSM_FIM
    la t0, MARIO_PROJETIL_ATIVO
    sw zero, 0(t0)
RPSM_FIM:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# a0 = x, a1 = y, a2 = largura, a3 = altura
# retorna a0 = 1 quando a caixa ocupa a mesma area de uma planta viva
CAIXA_COLIDE_PLANTAS:
	addi sp, sp, -32
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw s2, 8(sp)
	sw s3, 12(sp)
	sw s4, 16(sp)
	sw s5, 20(sp)
	sw s6, 24(sp)
	sw s7, 28(sp)
	mv s0, a0
	mv s1, a1
	mv s2, a2
	mv s3, a3
	la t0, NUM_PLANTAS
	lw s4, 0(t0)
	la s5, PLANTAS
	li s6, 0
CCPL_LOOP:
	beq s6, s4, CCPL_NAO
	lw t0, 8(s5)
	beqz t0, CCPL_PROXIMA
	lw t1, 0(s5)
	lw t2, 4(s5)
	add t3, s0, s2
	ble t3, t1, CCPL_PROXIMA
	addi t3, t1, PLANTA_LARGURA_REAL
	ble t3, s0, CCPL_PROXIMA
	add t3, s1, s3
	ble t3, t2, CCPL_PROXIMA
	addi t3, t2, PLANTA_ALTURA_REAL
	ble t3, s1, CCPL_PROXIMA
	li a0, 1
	j CCPL_FIM
CCPL_PROXIMA:
	addi s5, s5, TAM_INIMIGO_PLANTA
	addi s6, s6, 1
	j CCPL_LOOP
CCPL_NAO:
	li a0, 0
CCPL_FIM:
	lw s0, 0(sp)
	lw s1, 4(sp)
	lw s2, 8(sp)
	lw s3, 12(sp)
	lw s4, 16(sp)
	lw s5, 20(sp)
	lw s6, 24(sp)
	lw s7, 28(sp)
	addi sp, sp, 32
	ret

# verifica a parte util do sprite sem considerar o chao logo abaixo
# a0 = x do sprite, a1 = y do sprite; retorna a0 = 1 quando ocupa o cenario
CAIXA_INIMIGO_COLIDE_MAPA:
	addi sp, sp, -24
	sw ra, 20(sp)
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw s2, 8(sp)
	sw s3, 12(sp)
	sw s4, 16(sp)
	mv s0, a0
	mv s1, a1
	li s4, 0

	addi a0, s0, INIMIGO_HITBOX_X
	addi a1, s1, INIMIGO_HITBOX_Y
	call GET_TILE
	call EH_SOLIDO_AUX
	or s4, s4, a0

	addi a0, s0, 69
	addi a1, s1, INIMIGO_HITBOX_Y
	call GET_TILE
	call EH_SOLIDO_AUX
	or s4, s4, a0

	addi a0, s0, INIMIGO_HITBOX_X
	addi a1, s1, 69
	call GET_TILE
	call EH_SOLIDO_AUX
	or s4, s4, a0

	addi a0, s0, 69
	addi a1, s1, 69
	call GET_TILE
	call EH_SOLIDO_AUX
	or s4, s4, a0

	mv a0, s4
	lw s0, 0(sp)
	lw s1, 4(sp)
	lw s2, 8(sp)
	lw s3, 12(sp)
	lw s4, 16(sp)
	lw ra, 20(sp)
	addi sp, sp, 24
	ret

# a0/a1 = posicao atual, a2/a3 = posicao anterior
# retorna a0/a1 livres e a2 = 1 quando precisou corrigir
AJUSTA_CAIXA_FORA_MAPA:
	addi sp, sp, -36
	sw ra, 32(sp)
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw a2, 8(sp)
	sw a3, 12(sp)
	li t0, 4
	sw t0, 16(sp)

	call CAIXA_INIMIGO_COLIDE_MAPA
	beqz a0, ACFM_USA_ATUAL

	lw a0, 8(sp)
	lw a1, 12(sp)
	call CAIXA_INIMIGO_COLIDE_MAPA
	beqz a0, ACFM_USA_ANTERIOR

ACFM_BUSCA_X:
	lw t0, 16(sp)
	li t1, 96
	bgt t0, t1, ACFM_BUSCA_Y_INICIA

	lw a0, 8(sp)
	add a0, a0, t0
	lw a1, 12(sp)
	call CAIXA_INIMIGO_COLIDE_MAPA
	beqz a0, ACFM_SALVA_DIREITA

	lw t0, 16(sp)
	lw a0, 8(sp)
	sub a0, a0, t0
	lw a1, 12(sp)
	call CAIXA_INIMIGO_COLIDE_MAPA
	beqz a0, ACFM_SALVA_ESQUERDA

	lw t0, 16(sp)
	addi t0, t0, 4
	sw t0, 16(sp)
	j ACFM_BUSCA_X

ACFM_BUSCA_Y_INICIA:
	li t0, 4
	sw t0, 16(sp)
ACFM_BUSCA_Y:
	lw t0, 16(sp)
	li t1, 64
	bgt t0, t1, ACFM_USA_ANTERIOR
	lw a0, 8(sp)
	lw a1, 12(sp)
	sub a1, a1, t0
	call CAIXA_INIMIGO_COLIDE_MAPA
	beqz a0, ACFM_SALVA_CIMA
	lw t0, 16(sp)
	addi t0, t0, 4
	sw t0, 16(sp)
	j ACFM_BUSCA_Y

ACFM_SALVA_DIREITA:
	lw t0, 16(sp)
	lw a0, 8(sp)
	add a0, a0, t0
	lw a1, 12(sp)
	li a2, 1
	j ACFM_FIM
ACFM_SALVA_ESQUERDA:
	lw t0, 16(sp)
	lw a0, 8(sp)
	sub a0, a0, t0
	lw a1, 12(sp)
	li a2, 1
	j ACFM_FIM
ACFM_SALVA_CIMA:
	lw t0, 16(sp)
	lw a0, 8(sp)
	lw a1, 12(sp)
	sub a1, a1, t0
	li a2, 1
	j ACFM_FIM
ACFM_USA_ATUAL:
	lw a0, 0(sp)
	lw a1, 4(sp)
	li a2, 0
	j ACFM_FIM
ACFM_USA_ANTERIOR:
	lw a0, 8(sp)
	lw a1, 12(sp)
	li a2, 1
ACFM_FIM:
	lw ra, 32(sp)
	addi sp, sp, 36
	ret

EVITA_SOBREPOSICAO_MAPA:
    addi sp, sp, -4
    sw ra, 0(sp)
    call EVITA_MAPA_ROSALINA
    call EVITA_MAPA_BOWSER
    call EVITA_MAPA_MARIO
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

EVITA_MAPA_ROSALINA:
	la t0, ROSALINA_ATIVA
	lw t1, 0(t0)
	beqz t1, EMR_FIM
	la t0, ROSALINA_LIBERADA
	lw t1, 0(t0)
	beqz t1, EMR_FIM
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, ROSALINA_X
	lw a0, 0(t0)
	la t0, ROSALINA_Y
	lw a1, 0(t0)
	la t0, ROSALINA_X_ANTERIOR
	lw a2, 0(t0)
	la t0, ROSALINA_Y_ANTERIOR
	lw a3, 0(t0)
	call AJUSTA_CAIXA_FORA_MAPA
	la t0, ROSALINA_X
	sw a0, 0(t0)
	la t0, ROSALINA_Y
	sw a1, 0(t0)
	lw ra, 0(sp)
	addi sp, sp, 4
EMR_FIM:
	ret

EVITA_MAPA_BOWSER:
	la t0, BOWSER_ATIVO
	lw t1, 0(t0)
	beqz t1, EMB_FIM
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, BOWSER_X
	lw a0, 0(t0)
	la t0, BOWSER_Y
	lw a1, 0(t0)
	la t0, BOWSER_X_ANTERIOR
	lw a2, 0(t0)
	la t0, BOWSER_Y_ANTERIOR
	lw a3, 0(t0)
	call AJUSTA_CAIXA_FORA_MAPA
	la t0, BOWSER_X
	sw a0, 0(t0)
	la t0, BOWSER_Y
	sw a1, 0(t0)
	lw ra, 0(sp)
	addi sp, sp, 4
EMB_FIM:
	ret

EVITA_MAPA_MARIO:
	la t0, MARIO_ATIVO
	lw t1, 0(t0)
	beqz t1, EMM_COPIA
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, MARIO_X
	lw a0, 0(t0)
	la t0, MARIO_Y
	lw a1, 0(t0)
	la t0, MARIO_X_ANTERIOR
	lw a2, 0(t0)
	la t0, MARIO_Y_ANTERIOR
	lw a3, 0(t0)
	call AJUSTA_CAIXA_FORA_MAPA
	la t0, MARIO_X
	sw a0, 0(t0)
	la t0, MARIO_Y
	sw a1, 0(t0)
	lw ra, 0(sp)
	addi sp, sp, 4
EMM_COPIA:
	la t0, MARIO_COPIA_ATIVA
	lw t1, 0(t0)
	beqz t1, EMM_FIM
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, MARIO_COPIA_X
	lw a0, 0(t0)
	la t0, MARIO_Y
	lw a1, 0(t0)
	mv a2, a0
	mv a3, a1
	call AJUSTA_CAIXA_FORA_MAPA
	la t0, MARIO_COPIA_X
	sw a0, 0(t0)
	lw ra, 0(sp)
	addi sp, sp, 4
EMM_FIM:
	ret

# resolve o contato no mesmo quadro em que o dano foi verificado
SEPARA_PLAYER_INIMIGOS:
    addi sp, sp, -4
    sw ra, 0(sp)
    la t0, FASE_ATUAL
    lw t1, 0(t0)
    li t2, 1
    beq t1, t2, SPI_BOWSER
    li t2, 2
    beq t1, t2, SPI_FASE2
    j SPI_FIM
SPI_BOWSER:
    la t0, BOWSER_ATIVO
    lw t1, 0(t0)
    beqz t1, SPI_FIM
    la t0, BOWSER_LIBERADO
    lw t1, 0(t0)
    beqz t1, SPI_FIM
    la t0, BOWSER_X
    lw a0, 0(t0)
    la t0, BOWSER_Y
    lw a1, 0(t0)
    call SEPARA_PLAYER_CAIXA
    j SPI_FIM
SPI_FASE2:
    la t0, ROSALINA_ATIVA
    lw t1, 0(t0)
    beqz t1, SPI_MARIO
    la t0, ROSALINA_LIBERADA
    lw t1, 0(t0)
    beqz t1, SPI_MARIO
    la t0, ROSALINA_X
    lw a0, 0(t0)
    la t0, ROSALINA_Y
    lw a1, 0(t0)
    call SEPARA_PLAYER_CAIXA
SPI_MARIO:
    la t0, MARIO_LIBERADO
    lw t1, 0(t0)
    beqz t1, SPI_FIM
    la t0, MARIO_ATIVO
    lw t1, 0(t0)
    beqz t1, SPI_MARIO_COPIA
    la t0, MARIO_X
    lw a0, 0(t0)
    la t0, MARIO_Y
    lw a1, 0(t0)
    call SEPARA_PLAYER_CAIXA
SPI_MARIO_COPIA:
    la t0, MARIO_COPIA_ATIVA
    lw t1, 0(t0)
    beqz t1, SPI_FIM
    la t0, MARIO_COPIA_X
    lw a0, 0(t0)
    la t0, MARIO_Y
    lw a1, 0(t0)
    call SEPARA_PLAYER_CAIXA
SPI_FIM:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# a0 = x do sprite inimigo, a1 = y do sprite inimigo
SEPARA_PLAYER_CAIXA:
	addi sp, sp, -16
	sw ra, 12(sp)
	addi a0, a0, INIMIGO_HITBOX_X
	addi a1, a1, INIMIGO_HITBOX_Y
	sw a0, 0(sp)
	sw a1, 4(sp)
	la t0, PLAYER_X
	lw t1, 0(t0)
	la t0, PLAYER_Y
	lw t2, 0(t0)
	addi t3, t1, LARG_PERSONAGEM
	lw t4, 0(sp)
	ble t3, t4, SPC_FIM
	addi t3, t4, INIMIGO_HITBOX_LARGURA
	ble t3, t1, SPC_FIM
	addi t3, t2, LARG_PERSONAGEM
	lw t5, 4(sp)
	ble t3, t5, SPC_FIM
	addi t3, t5, INIMIGO_HITBOX_ALTURA
	ble t3, t2, SPC_FIM
	mv a0, t4                       # existe sobreposicao na hitbox util
	call MOVE_PLAYER_FORA_CAIXA
SPC_FIM:
	lw ra, 12(sp)
	addi sp, sp, 16
	ret

# a0 = x esquerdo da hitbox util do inimigo
MOVE_PLAYER_FORA_CAIXA:
	addi sp, sp, -20
	sw ra, 16(sp)
	sw a0, 0(sp)
	la t0, PLAYER_X
	lw t1, 0(t0)
	sw t1, 4(sp)
	addi t2, t1, 24
	addi t3, a0, 30
	bge t2, t3, MPFC_PREFERE_DIR
	addi t4, a0, -56               # 48 do jogador e 8 de espaco
	li t5, 1
	sw t4, 8(sp)
	sw t5, 12(sp)
	j MPFC_TESTA_PRIMEIRO
MPFC_PREFERE_DIR:
	addi t4, a0, 68                # 60 da hitbox e 8 de espaco
	li t5, -1
	sw t4, 8(sp)
	sw t5, 12(sp)
MPFC_TESTA_PRIMEIRO:
	lw a0, 8(sp)
	call POSICAO_PLAYER_LIVRE
	bnez a0, MPFC_SALVA_PRIMEIRO
	lw t0, 0(sp)
	lw t1, 12(sp)
	bgtz t1, MPFC_TENTA_DIR
	addi t0, t0, -56
	j MPFC_TENTA_OUTRO
MPFC_TENTA_DIR:
	addi t0, t0, 68
MPFC_TENTA_OUTRO:
	sw t0, 8(sp)
	mv a0, t0
	call POSICAO_PLAYER_LIVRE
	beqz a0, MPFC_FIM
MPFC_SALVA_PRIMEIRO:
	lw t1, 8(sp)
	bgez t1, MPFC_MAX
	li t1, 0
MPFC_MAX:
	li t2, PLAYER_X_MAX
	ble t1, t2, MPFC_GRAVA
	mv t1, t2
MPFC_GRAVA:
	la t0, PLAYER_X
	sw t1, 0(t0)
MPFC_FIM:
	lw ra, 16(sp)
	addi sp, sp, 20
	ret

# a0 = x candidato; retorna a0 = 1 quando mapa e plantas estao livres
POSICAO_PLAYER_LIVRE:
	addi sp, sp, -12
	sw ra, 8(sp)
	sw a0, 0(sp)
	bltz a0, PPL_OCUPADA
	li t0, PLAYER_X_MAX
	bgt a0, t0, PPL_OCUPADA
	la t0, PLAYER_Y
	lw a1, 0(t0)
	call CHECA_SOLIDO
	bnez a0, PPL_OCUPADA
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 1
	bne t1, t2, PPL_LIVRE
	lw a0, 0(sp)
	la t0, PLAYER_Y
	lw a1, 0(t0)
	li a2, LARG_PERSONAGEM
	li a3, LARG_PERSONAGEM
	call CAIXA_COLIDE_PLANTAS
	bnez a0, PPL_OCUPADA
PPL_LIVRE:
	li a0, 1
	j PPL_FIM
PPL_OCUPADA:
	li a0, 0
PPL_FIM:
	lw ra, 8(sp)
	addi sp, sp, 12
	ret

#---------------------------------------------------------------------------
#                     funcoes usadas pelos inimigos
#---------------------------------------------------------------------------
# a0 = x1, a1 = y1, a2 = largura1, a3 = altura1
# a4 = x2, a5 = y2, a6 = largura2, a7 = altura2
# retorna a0 = 1 quando existe colisao
COLIDE_CAIXAS:
	add t0, a0, a2
	ble t0, a4, CC_SEM_COLISAO
	add t0, a4, a6
	ble t0, a0, CC_SEM_COLISAO
	add t0, a1, a3
	ble t0, a5, CC_SEM_COLISAO
	add t0, a5, a7
	ble t0, a1, CC_SEM_COLISAO
	li a0, 1
	ret
CC_SEM_COLISAO:
	li a0, 0
	ret

# a0 = posicao horizontal da origem do dano
APLICA_DANO_PLAYER:
	addi sp, sp, -16                                    # reserva espaco para retorno e valores temporarios
	sw ra, 12(sp)                                       # salva o endereco de retorno
	sw a0, 0(sp)                                        # guarda a origem do dano
	la t0, INVENCIVEL_TIMER
	lw t1, 0(t0)
	bnez t1, ADP_FIM

	la t0, VIDAS
	lw t1, 0(t0)
	beqz t1, ADP_FIM
	addi t1, t1, -1
	bgez t1, ADP_SALVA_VIDA
	li t1, 0
ADP_SALVA_VIDA:
	sw t1, 0(t0)
	call CHECA_GAME_OVER
	call REINICIA_MUSICA

	la t0, INVENCIVEL_TIMER
	li t1, TEMPO_INVENCIVEL
	sw t1, 0(t0)

	la t0, PLAYER_X
	lw t1, 0(t0)
	sw t1, 4(sp)                                        # guarda a posicao anterior
	lw t2, 0(sp)
	blt t1, t2, ADP_RECUA_ESQUERDA
	addi t1, t1, RECUO_DANO
	li t2, PLAYER_X_MAX
	ble t1, t2, ADP_TESTA_RECUO
	mv t1, t2
	j ADP_TESTA_RECUO
ADP_RECUA_ESQUERDA:
	addi t1, t1, -32
	bgez t1, ADP_TESTA_RECUO
	li t1, 0
ADP_TESTA_RECUO:
	sw t1, 8(sp)
	mv a0, t1
	call POSICAO_PLAYER_LIVRE                         # evita recuo para dentro do cenario
	bnez a0, ADP_GRAVA_RECUO

	lw t1, 4(sp)                                      # tenta um recuo menor quando o espaco esta fechado
	lw t2, 0(sp)
	blt t1, t2, ADP_RECUO_MENOR_ESQ
	addi t1, t1, 16
	li t2, PLAYER_X_MAX
	ble t1, t2, ADP_TESTA_RECUO_MENOR
	mv t1, t2
	j ADP_TESTA_RECUO_MENOR
ADP_RECUO_MENOR_ESQ:
	addi t1, t1, -16
	bgez t1, ADP_TESTA_RECUO_MENOR
	li t1, 0
ADP_TESTA_RECUO_MENOR:
	sw t1, 8(sp)
	mv a0, t1
	call POSICAO_PLAYER_LIVRE
	beqz a0, ADP_FIM                                  # sem espaco livre, conserva a posicao anterior
ADP_GRAVA_RECUO:
	lw t1, 8(sp)
	la t0, PLAYER_X
	sw t1, 0(t0)
ADP_FIM:
	lw ra, 12(sp)                                      # recupera o endereco de retorno
	addi sp, sp, 16                                    # libera o espaco da pilha
	ret

APLICA_CURA_PLAYER:
	la t0, VIDAS
	lw t1, 0(t0)
	la t2, VIDAS_MAX
	lw t2, 0(t2)
	bge t1, t2, ACP_FIM
	addi t1, t1, 1
	sw t1, 0(t0)
ACP_FIM:
	ret

# a0 = x, a1 = y, a2 = largura, a3 = altura, a4 = cor, a5 = frame
DESENHA_RETANGULO:
	add t0, a0, a2
	add t1, a1, a3
	blez t0, DR_FIM
	blez t1, DR_FIM
	li t2, 320
	bge a0, t2, DR_FIM
	li t2, 240
	bge a1, t2, DR_FIM
	bgez a0, DR_X_INICIO_OK
	li a0, 0
DR_X_INICIO_OK:
	bgez a1, DR_Y_INICIO_OK
	li a1, 0
DR_Y_INICIO_OK:
	li t2, 320
	ble t0, t2, DR_X_FIM_OK
	mv t0, t2
DR_X_FIM_OK:
	li t2, 240
	ble t1, t2, DR_Y_FIM_OK
	mv t1, t2
DR_Y_FIM_OK:
	bge a0, t0, DR_FIM
	bge a1, t1, DR_FIM
	sub a2, t0, a0
	sub a3, t1, a1

	li t2, 0xFF0
	add t2, t2, a5
	slli t2, t2, 20
	li t3, 320
	mul t4, t3, a1
	add t2, t2, t4
	add t2, t2, a0
	mv t4, a3
DR_LINHA:
	mv t5, a2
DR_PIXEL:
	sb a4, 0(t2)
	addi t2, t2, 1
	addi t5, t5, -1
	bnez t5, DR_PIXEL
	sub t6, t3, a2
	add t2, t2, t6
	addi t4, t4, -1
	bnez t4, DR_LINHA
DR_FIM:
	ret

# a0 = x no mundo, a1 = y, a2 = largura, a3 = altura, a4 = cor, a5 = frame
DESENHA_RETANGULO_MUNDO:
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, CAMERA_X
	lw t0, 0(t0)
	sub a0, a0, t0
	call DESENHA_RETANGULO
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

# a0 = sprite, a1 = x na tela, a2 = y, a3 = frame, a4 = fundo
PRINT_PERSONAGEM_RECORTADO:
	addi sp, sp, -40
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw s2, 8(sp)
	sw s3, 12(sp)
	sw s4, 16(sp)
	sw s5, 20(sp)
	sw s6, 24(sp)
	sw s7, 28(sp)
	sw s8, 32(sp)
	sw ra, 36(sp)

	mv s0, a0
	mv s1, a1
	mv s2, a2
	mv s3, a3
	mv s4, a4
	lw s5, 0(s0)
	lw s6, 4(s0)
	addi s0, s0, 8

	li s7, 0
	bgez s1, PPR_X_OK
	neg s7, s1
	li s1, 0
PPR_X_OK:
	li s8, 0
	bgez s2, PPR_Y_OK
	neg s8, s2
	li s2, 0
PPR_Y_OK:
	bge s7, s5, PPR_FIM
	bge s8, s6, PPR_FIM
	li t0, 320
	bge s1, t0, PPR_FIM
	li t0, 240
	bge s2, t0, PPR_FIM

	mul t0, s8, s5
	add t0, t0, s7
	add s0, s0, t0

	sub s7, s5, s7
	li t0, 320
	sub t0, t0, s1
	ble s7, t0, PPR_LARGURA_OK
	mv s7, t0
PPR_LARGURA_OK:
	sub s8, s6, s8
	li t0, 240
	sub t0, t0, s2
	ble s8, t0, PPR_ALTURA_OK
	mv s8, t0
PPR_ALTURA_OK:
	blez s7, PPR_FIM
	blez s8, PPR_FIM

	li t0, 0xFF0
	add t0, t0, s3
	slli t0, t0, 20
	li t1, 320
	mul t2, t1, s2
	add t0, t0, t2
	add t0, t0, s1

PPR_LINHA:
	mv t2, s7
PPR_PIXEL:
	lbu t3, 0(s0)                                       # le um pixel do sprite
	beq t3, s4, PPR_PULA_PIXEL
	sb t3, 0(t0)
PPR_PULA_PIXEL:
	addi s0, s0, 1
	addi t0, t0, 1
	addi t2, t2, -1
	bnez t2, PPR_PIXEL

	sub t2, s5, s7
	add s0, s0, t2
	li t2, 320
	sub t2, t2, s7
	add t0, t0, t2
	addi s8, s8, -1
	bnez s8, PPR_LINHA

PPR_FIM:
	lw s0, 0(sp)
	lw s1, 4(sp)
	lw s2, 8(sp)
	lw s3, 12(sp)
	lw s4, 16(sp)
	lw s5, 20(sp)
	lw s6, 24(sp)
	lw s7, 28(sp)
	lw s8, 32(sp)
	lw ra, 36(sp)
	addi sp, sp, 40
	ret

# a0 = sprite, a1 = x no mundo, a2 = y, a3 = frame, a4 = fundo
DESENHA_SPRITE_MUNDO:
	la t0, CAMERA_X
	lw t0, 0(t0)
	sub a1, a1, t0
	j PRINT_PERSONAGEM_RECORTADO

#---------------------------------------------------------------------------
#                     rosalina
#---------------------------------------------------------------------------
ATUALIZA_ROSALINA:
	addi sp, sp, -4                                     # reserva espaco para o retorno
	sw ra, 0(sp)                                        # salva o endereco de retorno

	la t0, ROSALINA_ATIVA                               # verifica se a rosalina ainda esta ativa
	lw t1, 0(t0)                                        # le o estado ativo
	beqz t1, AR_FIM                                     # encerra quando ja foi derrotada

	la t0, FASE_ATUAL                                   # verifica a fase atual
	lw t1, 0(t0)                                        # le o numero da fase
	li t2, 2                                            # rosalina pertence a fase 2
	bne t1, t2, AR_FORA_AREA                            # limpa o ataque fora da fase

	la t0, ROSALINA_LIBERADA                            # verifica se a luta ja comecou
	lw t1, 0(t0)                                        # le o controle da entrada
	bnez t1, AR_ATIVA                                   # continua quando ja entrou na tela

	la t0, ROSALINA_X                                   # calcula a posicao da rosalina na tela
	lw t1, 0(t0)                                        # le a posicao no mundo
	la t0, CAMERA_X                                     # carrega a posicao da camera
	lw t2, 0(t0)                                        # le o deslocamento da camera
	sub t1, t1, t2                                      # converte a posicao para a tela
	li t2, ROSALINA_ENTRADA_TELA                        # margem usada para iniciar o combate
	bgt t1, t2, AR_ESPERA_ENTRADA                       # espera enquanto ela ainda esta fora da tela
	li t2, -70                                          # permite a entrada parcial pela esquerda
	blt t1, t2, AR_ESPERA_ENTRADA                       # evita iniciar quando ela ja saiu da tela

	la t0, ROSALINA_LIBERADA                            # marca o inicio do combate
	li t1, 1                                            # valor de combate ativo
	sw t1, 0(t0)                                        # salva o controle
	la t0, ROSALINA_TIMER                               # reinicia o tempo do primeiro estado
	sw zero, 0(t0)                                      # zera o contador
	la t0, ROSALINA_ESTADO                              # garante o inicio pelo movimento
	li t1, ROS_ESTADO_MOVE                              # estado inicial da rosalina
	sw t1, 0(t0)                                        # salva o estado
	j AR_ATIVA                                          # inicia a atualizacao normal

AR_ESPERA_ENTRADA:
	la t0, ESTRELA_ROSALINA_ATIVA                       # impede ataques antes da entrada
	sw zero, 0(t0)                                      # remove qualquer estrela ativa
	la t0, ESTRELA_ROSALINA_AVISO                       # remove a marca da estrela vertical
	sw zero, 0(t0)                                      # desliga o aviso
	j AR_FIM                                            # termina a atualizacao deste quadro

AR_ATIVA:
	la t0, ROSALINA_X                 # confere se o corpo ainda esta na tela
	lw t1, 0(t0)
	la t0, CAMERA_X
	lw t2, 0(t0)
	sub t1, t1, t2
	li t2, -80
	ble t1, t2, AR_FORA_TELA
	li t2, TELA_LARGURA
	bge t1, t2, AR_FORA_TELA
	call ATUALIZA_ESTRELA_ROSALINA                      # move a estrela somente durante o combate
	call MOVE_ROSALINA_INTELIGENTE                      # ajusta altura e distancia do jogador

	la t0, ROSALINA_ESTADO                              # escolhe a rotina do estado atual
	lw t1, 0(t0)                                        # le o estado da ia
	li t2, ROS_ESTADO_MOVE                              # codigo do movimento
	beq t1, t2, AR_MOVE                                 # executa o movimento livre
	li t2, ROS_ESTADO_PREPARA_HORIZONTAL                # codigo da estrela horizontal
	beq t1, t2, AR_PREPARA_HORIZONTAL                   # prepara o disparo horizontal
	li t2, ROS_ESTADO_PREPARA_VERTICAL                  # codigo da estrela vertical
	beq t1, t2, AR_PREPARA_VERTICAL                     # prepara a queda marcada
	li t2, ROS_ESTADO_PULSO                             # codigo do pulso
	beq t1, t2, AR_PULSO                                # executa o afastamento
	li t2, ROS_ESTADO_RECUPERA                          # codigo da recuperacao
	beq t1, t2, AR_RECUPERA                             # aguarda depois do ataque
	j AR_VULNERAVEL                                     # usa a pausa vulneravel

# ajusta a posicao sem perseguir o jogador de forma direta
MOVE_ROSALINA_INTELIGENTE:
	la t0, ROSALINA_ESTADO
	lw t1, 0(t0)
	li t2, ROS_ESTADO_VULNERAVEL
	beq t1, t2, MRI_VERTICAL             # durante a vulnerabilidade ela fica parada
	li t2, ROS_ESTADO_PREPARA_HORIZONTAL
	beq t1, t2, MRI_VERTICAL             # a preparacao mantem o ataque legivel
	li t2, ROS_ESTADO_PREPARA_VERTICAL
	beq t1, t2, MRI_VERTICAL

	la t0, PLAYER_X
	lw t2, 0(t0)
	addi t2, t2, 24                      # centro do personagem
	la t0, ROSALINA_X
	lw t3, 0(t0)
	addi t4, t3, 40                      # centro da rosalina
	sub t5, t4, t2
	bgez t5, MRI_DISTANCIA_OK
	neg t5, t5
MRI_DISTANCIA_OK:
	li t6, ROSALINA_DISTANCIA_MIN
	blt t5, t6, MRI_AFASTA               # foge quando o personagem chega perto
	li t6, ROSALINA_DISTANCIA_MAX
	bgt t5, t6, MRI_APROXIMA             # volta quando ficou longe demais
	j MRI_PATRULHA

MRI_AFASTA:
	bge t4, t2, MRI_AFASTA_DIREITA
	addi t3, t3, -2
	li t4, -1
	j MRI_SALVA_DIRECAO
MRI_AFASTA_DIREITA:
	addi t3, t3, 2
	li t4, 1
	j MRI_SALVA_DIRECAO

MRI_APROXIMA:
	bge t4, t2, MRI_APROXIMA_ESQUERDA
	addi t3, t3, 1
	li t4, 1
	j MRI_SALVA_DIRECAO
MRI_APROXIMA_ESQUERDA:
	addi t3, t3, -1
	li t4, -1
	j MRI_SALVA_DIRECAO

MRI_PATRULHA:
	la t5, ROSALINA_MOVIMENTO_TIMER
	lw t6, 0(t5)
	andi t6, t6, 3
	bnez t6, MRI_LIMITA_X                 # patrulha somente a cada quatro quadros
	la t5, ROSALINA_DIRECAO_X
	lw t4, 0(t5)
	add t3, t3, t4
	j MRI_LIMITA_X

MRI_SALVA_DIRECAO:
	la t5, ROSALINA_DIRECAO_X
	sw t4, 0(t5)

MRI_LIMITA_X:
	li t4, ROSALINA_X_MIN
	bge t3, t4, MRI_CHECA_X_MAX
	mv t3, t4
	li t4, 1
	la t5, ROSALINA_DIRECAO_X
	sw t4, 0(t5)
MRI_CHECA_X_MAX:
	li t4, ROSALINA_X_MAX
	ble t3, t4, MRI_SALVA_X
	mv t3, t4
	li t4, -1
	la t5, ROSALINA_DIRECAO_X
	sw t4, 0(t5)
MRI_SALVA_X:
	la t0, ROSALINA_X
	sw t3, 0(t0)

MRI_VERTICAL:
	la t0, ROSALINA_ESTADO
	lw t1, 0(t0)
	li t2, 102                            # altura normal, perto da linha de tiro
	li t3, ROS_ESTADO_PREPARA_VERTICAL
	beq t1, t3, MRI_ALVO_ALTO
	li t3, ROS_ESTADO_VULNERAVEL
	beq t1, t3, MRI_ALVO_BAIXO
	li t3, ROS_ESTADO_PULSO
	beq t1, t3, MRI_ALVO_BAIXO
	j MRI_MOVE_Y
MRI_ALVO_ALTO:
	li t2, ROSALINA_Y_MIN
	j MRI_MOVE_Y
MRI_ALVO_BAIXO:
	li t2, ROSALINA_Y_MAX
MRI_MOVE_Y:
	la t0, ROSALINA_Y
	lw t3, 0(t0)
	beq t3, t2, MRI_FIM
	blt t3, t2, MRI_DESCE
	addi t3, t3, -1
	j MRI_SALVA_Y
MRI_DESCE:
	addi t3, t3, 1
MRI_SALVA_Y:
	sw t3, 0(t0)
MRI_FIM:
	ret

AR_MOVE:
	# um jogador proximo sempre provoca um ataque visivel
	la t0, PLAYER_X
	lw t2, 0(t0)
	addi t2, t2, 24
	la t0, ROSALINA_X
	lw t3, 0(t0)
	addi t3, t3, 40
	sub t4, t3, t2
	bgez t4, AR_MOVE_DISTANCIA_OK
	neg t4, t4
AR_MOVE_DISTANCIA_OK:
	li t5, 108
	blt t4, t5, AR_ESCOLHE_PULSO_IMEDIATO

	la t0, ROSALINA_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	la t2, ROSALINA_VIDA
	lw t2, 0(t2)
	li t3, 28                          # intervalo normal entre ataques
	li t4, 2
	bgt t2, t4, AR_COMPARA_TIMER
	li t3, 22                          # intervalo com pouca vida
AR_COMPARA_TIMER:
	blt t1, t3, AR_SALVA_TIMER_MOVE
	sw zero, 0(t0)

	la t2, ROSALINA_ALTERNANCIA
	lw t3, 0(t2)
	beqz t3, AR_ESCOLHE_HORIZONTAL
	sw zero, 0(t2)
	la t2, ROSALINA_ESTADO
	li t3, ROS_ESTADO_PREPARA_VERTICAL
	sw t3, 0(t2)
	j AR_FIM

AR_ESCOLHE_HORIZONTAL:
	li t3, 1
	sw t3, 0(t2)
	la t2, ROSALINA_ESTADO
	li t3, ROS_ESTADO_PREPARA_HORIZONTAL
	sw t3, 0(t2)
	j AR_FIM

AR_ESCOLHE_PULSO_IMEDIATO:
	la t0, ESTRELA_ROSALINA_ATIVA
	lw t1, 0(t0)
	bnez t1, AR_MOVE_TIMER_CURTO           # nao cria dois poderes no mesmo instante
	la t2, ROSALINA_ESTADO
	li t3, ROS_ESTADO_PULSO
	sw t3, 0(t2)
	la t2, ROSALINA_TIMER
	sw zero, 0(t2)
	j AR_FIM
AR_MOVE_TIMER_CURTO:
	la t0, ROSALINA_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
AR_SALVA_TIMER_MOVE:
	sw t1, 0(t0)
	j AR_FIM

AR_PREPARA_HORIZONTAL:
	la t0, ROSALINA_TIMER                               # controla o aviso antes do disparo
	lw t1, 0(t0)                                        # le o contador
	addi t1, t1, 1                                      # avanca um quadro
	li t2, 12                                           # preparacao curta e legivel
	blt t1, t2, AR_SALVA_TIMER                          # espera antes de criar a estrela
	sw zero, 0(t0)                                      # reinicia o contador

	la t2, ROSALINA_X                                   # o poder nasce no corpo da rosalina
	lw t3, 0(t2)
	la t2, PLAYER_X
	lw t4, 0(t2)
	blt t4, t3, AR_HORIZONTAL_LADO_ESQ
	addi t3, t3, 70                                     # lado direito do sprite
	j AR_HORIZONTAL_SALVA_X
AR_HORIZONTAL_LADO_ESQ:
	addi t3, t3, -8                                     # lado esquerdo do sprite
AR_HORIZONTAL_SALVA_X:
	la t2, ESTRELA_ROSALINA_X
	sw t3, 0(t2)
	la t2, ROSALINA_Y                                   # le a altura atual da rosalina
	lw t3, 0(t2)                                        # guarda o y do sprite
	addi t3, t3, 34                                     # centraliza o projetil
	la t2, ESTRELA_ROSALINA_Y                           # carrega o y da estrela
	sw t3, 0(t2)                                        # salva a altura inicial

	la t2, PLAYER_X                                     # escolhe a direcao do disparo
	lw t3, 0(t2)                                        # le o x do jogador
	la t2, ROSALINA_X                                   # compara com o x da rosalina
	lw t4, 0(t2)                                        # le o x da inimiga
	li t5, 6                                            # velocidade horizontal do projetil
	bge t3, t4, AR_SALVA_VX_ESTRELA                     # mantem o sinal positivo
	li t5, -6                                           # velocidade horizontal do projetil
AR_SALVA_VX_ESTRELA:
	la t2, ESTRELA_ROSALINA_VX                          # salva a velocidade horizontal
	sw t5, 0(t2)                                        # grava a velocidade
	la t2, ESTRELA_ROSALINA_VY                          # zera o movimento vertical
	sw zero, 0(t2)                                      # mantem a mesma altura
	la t2, ESTRELA_ROSALINA_TIPO                        # define o tipo do projetil
	li t3, 1                                            # tipo horizontal
	sw t3, 0(t2)                                        # salva o tipo
	la t2, ESTRELA_ROSALINA_ATIVA                       # ativa a estrela
	sw t3, 0(t2)                                        # salva o controle
	la t2, ROSALINA_POSE_ATAQUE
	li t3, TEMPO_POSE_ATAQUE
	sw t3, 0(t2)                                        # conserva a pose durante o disparo
	
	la t0, ESTRELA_ROSALINA_SPRITE
   	lw t1, 0(t0)
    	addi t1, t1, 1
    	andi t1, t1, 3
    	sw t1, 0(t0)
	
	j AR_FINALIZA_ATAQUE                                # inicia a recuperacao

AR_PREPARA_VERTICAL:
	la t0, ROSALINA_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, 14                              # preparacao curta e legivel
	blt t1, t2, AR_SALVA_TIMER
	sw zero, 0(t0)

	# o segundo ataque tambem parte da rosalina, mas segue na diagonal
	la t2, ROSALINA_X
	lw t3, 0(t2)
	la t2, PLAYER_X
	lw t4, 0(t2)
	li t5, 5
	blt t4, t3, AR_DIAGONAL_ESQUERDA
	addi t3, t3, 70
	j AR_DIAGONAL_POSICAO
AR_DIAGONAL_ESQUERDA:
	addi t3, t3, -8
	li t5, -5
AR_DIAGONAL_POSICAO:
	la t2, ESTRELA_ROSALINA_X
	sw t3, 0(t2)
	la t2, ROSALINA_Y
	lw t3, 0(t2)
	addi t3, t3, 30
	la t2, ESTRELA_ROSALINA_Y
	sw t3, 0(t2)
	la t2, ESTRELA_ROSALINA_VX
	sw t5, 0(t2)
	la t2, ESTRELA_ROSALINA_VY
	li t3, 3
	sw t3, 0(t2)
	la t2, ESTRELA_ROSALINA_TIPO
	li t3, 2
	sw t3, 0(t2)
	la t2, ESTRELA_ROSALINA_ATIVA
	li t3, 1
	sw t3, 0(t2)
	la t2, ROSALINA_POSE_ATAQUE
	li t3, TEMPO_POSE_ATAQUE
	sw t3, 0(t2)
	
	la t0, ESTRELA_ROSALINA_SPRITE
	lw t1, 0(t0)
	addi t1, t1, 1
	andi t1, t1, 3
	sw t1, 0(t0)
	
	la t2, ESTRELA_ROSALINA_AVISO
	sw zero, 0(t2)
	j AR_FINALIZA_ATAQUE

AR_PULSO:
	la t0, ROSALINA_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1

	li t2, 8
	bne t1, t2, AR_PULSO_EMPURRA
	la t2, ESTRELA_ROSALINA_ATIVA
	lw t3, 0(t2)
	bnez t3, AR_PULSO_EMPURRA
	la t2, ROSALINA_X
	lw t3, 0(t2)
	la t4, PLAYER_X
	lw t4, 0(t4)
	li t5, 6
	blt t4, t3, AR_PULSO_ESTRELA_ESQ
	addi t3, t3, 68
	j AR_PULSO_ESTRELA_X
AR_PULSO_ESTRELA_ESQ:
	addi t3, t3, -6
	li t5, -6
AR_PULSO_ESTRELA_X:
	la t2, ESTRELA_ROSALINA_X
	sw t3, 0(t2)
	la t2, ROSALINA_Y
	lw t3, 0(t2)
	addi t3, t3, 32
	la t2, ESTRELA_ROSALINA_Y
	sw t3, 0(t2)
	la t2, ESTRELA_ROSALINA_VX
	sw t5, 0(t2)
	la t2, ESTRELA_ROSALINA_VY
	sw zero, 0(t2)
	la t2, ESTRELA_ROSALINA_ATIVA
	li t3, 1
	sw t3, 0(t2)
	la t2, ROSALINA_POSE_ATAQUE
	li t3, TEMPO_POSE_ATAQUE
	sw t3, 0(t2)
	
	la t0, ESTRELA_ROSALINA_SPRITE
	lw t1, 0(t0)
	addi t1, t1, 1
	andi t1, t1, 3
	sw t1, 0(t0)

AR_PULSO_EMPURRA:
	li t2, 14
	bne t1, t2, AR_PULSO_FIM
	la t2, PLAYER_X
	lw t3, 0(t2)
	la t4, ROSALINA_X
	lw t4, 0(t4)
	blt t3, t4, AR_PULSO_ESQUERDA
	addi t3, t3, 12
	la t4, PLAYER_X_MAX_ATUAL
	lw t4, 0(t4)
	ble t3, t4, AR_PULSO_TESTA
	mv t3, t4
	j AR_PULSO_TESTA
AR_PULSO_ESQUERDA:
	addi t3, t3, -12
	bgez t3, AR_PULSO_TESTA
	li t3, 0
AR_PULSO_TESTA:
	mv a0, t3
	call POSICAO_PLAYER_LIVRE
	beqz a0, AR_PULSO_FIM                # nao empurra para dentro do cenario
	la t2, PLAYER_X
	sw t3, 0(t2)
AR_PULSO_FIM:
	la t0, ROSALINA_TIMER                 # recarrega o contador depois da checagem de espaco
	li t2, 20
	blt t1, t2, AR_SALVA_TIMER
	sw zero, 0(t0)
	j AR_FINALIZA_ATAQUE

AR_FINALIZA_ATAQUE:
	la t0, ROSALINA_ATAQUES                             # conta os ataques executados
	lw t1, 0(t0)                                        # le a quantidade atual
	addi t1, t1, 1                                      # soma o ataque concluido
	sw t1, 0(t0)                                        # salva o contador
	la t0, ROSALINA_ESTADO                              # troca para a recuperacao
	li t1, ROS_ESTADO_RECUPERA                          # codigo da recuperacao
	sw t1, 0(t0)                                        # salva o estado
	j AR_FIM                                            # termina este quadro

AR_RECUPERA:
	la t0, ROSALINA_TIMER                               # controla a pausa depois do ataque
	lw t1, 0(t0)                                        # le o contador
	addi t1, t1, 1                                      # avanca um quadro
	li t2, 10                                           # recuperacao curta entre ataques
	blt t1, t2, AR_SALVA_TIMER                          # espera o fim da pausa
	sw zero, 0(t0)                                      # reinicia o contador
	la t2, ROSALINA_ATAQUES                             # verifica quantos ataques foram feitos
	lw t3, 0(t2)                                        # le o contador de ataques
	li t4, 2                                            # quantidade antes da vulnerabilidade
	blt t3, t4, AR_VOLTA_MOVE                           # volta ao movimento depois de um ataque
	sw zero, 0(t2)                                      # reinicia a sequencia
	la t2, ROSALINA_ESTADO                              # entra na janela vulneravel
	li t3, ROS_ESTADO_VULNERAVEL                        # codigo da vulnerabilidade
	sw t3, 0(t2)                                        # salva o estado
	j AR_FIM                                            # termina este quadro
AR_VOLTA_MOVE:
	la t2, ROSALINA_ESTADO                              # volta ao movimento livre
	li t3, ROS_ESTADO_MOVE                              # codigo do movimento
	sw t3, 0(t2)                                        # salva o estado
	j AR_FIM                                            # termina este quadro

AR_VULNERAVEL:
	la t0, ROSALINA_TIMER                               # controla a janela de ataque do jogador
	lw t1, 0(t0)                                        # le o contador
	addi t1, t1, 1                                      # avanca um quadro
	li t2, 28                                           # janela de vulnerabilidade controlada
	blt t1, t2, AR_SALVA_TIMER                          # mantem a vulnerabilidade
	sw zero, 0(t0)                                      # reinicia o contador
	la t2, ROSALINA_ESTADO                              # volta ao movimento
	li t3, ROS_ESTADO_MOVE                              # codigo do movimento livre
	sw t3, 0(t2)                                        # salva o estado
	j AR_FIM                                            # termina este quadro

AR_SALVA_TIMER:
	sw t1, 0(t0)                                        # salva o contador do estado
	j AR_FIM                                            # termina este quadro

AR_FORA_TELA:
	la t0, ESTRELA_ROSALINA_ATIVA
	sw zero, 0(t0)
	la t0, ESTRELA_ROSALINA_AVISO
	sw zero, 0(t0)
	j AR_FIM
AR_FORA_AREA:
	la t0, ROSALINA_LIBERADA                            # reinicia o combate fora da fase
	sw zero, 0(t0)                                      # desliga a entrada
	la t0, ESTRELA_ROSALINA_ATIVA                       # remove a estrela ativa
	sw zero, 0(t0)                                      # desliga o projetil
	la t0, ESTRELA_ROSALINA_AVISO                       # remove o aviso vertical
	sw zero, 0(t0)                                      # desliga a marca
	la t0, ROSALINA_CONTATO                             # libera a colisao de contato
	sw zero, 0(t0)                                      # zera a trava
AR_FIM:
	lw ra, 0(sp)                                        # recupera o endereco de retorno
	addi sp, sp, 4                                      # libera o espaco da pilha
	ret                                                 # retorna para o loop

ATUALIZA_ESTRELA_ROSALINA:
	la t0, ESTRELA_ROSALINA_ATIVA                       # verifica se existe uma estrela ativa
	lw t1, 0(t0)                                        # le o controle do projetil
	beqz t1, AER_FIM                                    # encerra quando nao existe estrela

	la t2, ESTRELA_ROSALINA_X                           # atualiza a posicao horizontal
	lw t3, 0(t2)                                        # le o x atual
	la t4, ESTRELA_ROSALINA_VX                          # carrega a velocidade horizontal
	lw t4, 0(t4)                                        # le a velocidade
	add t3, t3, t4                                      # aplica o movimento
	sw t3, 0(t2)                                        # salva o novo x

	la t2, ESTRELA_ROSALINA_Y                           # atualiza a posicao vertical
	lw t4, 0(t2)                                        # le o y atual
	la t5, ESTRELA_ROSALINA_VY                          # carrega a velocidade vertical
	lw t5, 0(t5)                                        # le a velocidade
	add t4, t4, t5                                      # aplica o movimento
	sw t4, 0(t2)                                        # salva o novo y

	bltz t3, AER_REMOVE                                 # remove se saiu pelo inicio do mapa
	la t5, PLAYER_X_MAX_ATUAL
	lw t5, 0(t5)
	addi t5, t5, LARG_PERSONAGEM                        # limite final da fase atual
	bgt t3, t5, AER_REMOVE                              # remove se saiu pelo fim do mapa
	li t5, 202                                          # altura do chao usada pela estrela vertical
	bgt t4, t5, AER_REMOVE                              # remove quando passa do chao
	j AER_FIM                                           # mantem o projetil ativo
AER_REMOVE:
	sw zero, 0(t0)                                      # desliga a estrela
AER_FIM:
	ret                                                 # retorna para a ia principal

CHECA_COLISOES_ROSALINA:
	addi sp, sp, -4                                     # reserva espaco para o retorno
	sw ra, 0(sp)                                        # salva o endereco de retorno
	la t0, ROSALINA_ATIVA                               # verifica se a rosalina esta viva
	lw t1, 0(t0)                                        # le o controle ativo
	beqz t1, CCR_FIM                                    # encerra quando foi derrotada
	la t0, FASE_ATUAL                                   # verifica a fase atual
	lw t1, 0(t0)                                        # le o numero da fase
	li t2, 2                                            # rosalina pertence a fase 2
	bne t1, t2, CCR_FIM                                 # encerra fora da fase
	la t0, ROSALINA_LIBERADA                            # verifica se o combate ja iniciou
	lw t1, 0(t0)                                        # le o controle da entrada
	beqz t1, CCR_FIM                                    # nao colide antes de aparecer

	la t0, PLAYER_X                                     # monta a caixa do jogador
	lw a0, 0(t0)                                        # x do jogador
	la t0, PLAYER_Y                                     # carrega o y do jogador
	lw a1, 0(t0)                                        # y do jogador
	li a2, LARG_PERSONAGEM                              # largura do jogador
	li a3, LARG_PERSONAGEM                              # altura do jogador
	la t0, ROSALINA_X                                   # monta a caixa da rosalina
	lw a4, 0(t0)                                        # x da inimiga
	addi a4, a4, INIMIGO_HITBOX_X
	la t0, ROSALINA_Y                                   # carrega o y da inimiga
	lw a5, 0(t0)                                        # y da inimiga
	addi a5, a5, INIMIGO_HITBOX_Y
	li a6, INIMIGO_HITBOX_LARGURA
	li a7, INIMIGO_HITBOX_ALTURA
	call COLIDE_CAIXAS                                  # verifica contato entre os sprites
	beqz a0, CCR_SEPAROU                                # libera a trava quando se afastam
	la t0, ROSALINA_CONTATO                             # verifica se o contato ja causou dano
	lw t1, 0(t0)                                        # le a trava
	bnez t1, CCR_PROJETIL                               # nao repete o dano no mesmo contato
	li t1, 1                                            # marca o contato atual
	sw t1, 0(t0)                                        # salva a trava
	la t0, ROSALINA_X                                   # usa a origem da rosalina para o recuo
	lw a0, 0(t0)                                        # passa o x da origem
	call APLICA_DANO_PLAYER                             # retira uma vida e aplica invencibilidade
	j CCR_PROJETIL                                      # verifica o projetil
CCR_SEPAROU:
	la t0, ROSALINA_CONTATO                             # libera a colisao depois da separacao
	sw zero, 0(t0)                                      # zera a trava

CCR_PROJETIL:
	la t0, ESTRELA_ROSALINA_ATIVA                       # verifica se existe uma estrela ativa
	lw t1, 0(t0)                                        # le o controle do projetil
	beqz t1, CCR_FIM                                    # encerra sem estrela
	la t0, PLAYER_X                                     # monta a caixa do jogador
	lw a0, 0(t0)                                        # x do jogador
	la t0, PLAYER_Y                                     # carrega o y do jogador
	lw a1, 0(t0)                                        # y do jogador
	li a2, LARG_PERSONAGEM                              # largura do jogador
	li a3, LARG_PERSONAGEM                              # altura do jogador
	la t0, ESTRELA_ROSALINA_X                           # monta a caixa da estrela
	lw a4, 0(t0)                                        # x da estrela
	la t0, ESTRELA_ROSALINA_Y                           # carrega o y da estrela
	lw a5, 0(t0)                                        # y da estrela
	li a6, ESTRELA_ROSALINA_TAMANHO                     # largura do projetil
	li a7, ESTRELA_ROSALINA_TAMANHO                     # altura do projetil
	call COLIDE_CAIXAS                                  # verifica o contato com a estrela
	beqz a0, CCR_FIM                                    # termina quando nao houve colisao
	la t0, ESTRELA_ROSALINA_ATIVA                       # remove a estrela depois do acerto
	sw zero, 0(t0)                                      # desliga o projetil
	la t0, ESTRELA_ROSALINA_X                           # usa o x da estrela como origem do dano
	lw a0, 0(t0)                                        # passa o x da origem
	call APLICA_DANO_PLAYER                             # aplica o dano no jogador
CCR_FIM:
	lw ra, 0(sp)                                        # recupera o endereco de retorno
	addi sp, sp, 4                                      # libera o espaco da pilha
	ret                                                 # retorna para o loop

DANO_ROSALINA:
	la t0, ROSALINA_ATIVA                               # verifica se a rosalina esta viva
	lw t1, 0(t0)                                        # le o controle ativo
	beqz t1, DR_FIM_DANO                                # encerra quando ja foi derrotada
	la t0, ROSALINA_LIBERADA                            # impede dano antes do combate
	lw t1, 0(t0)                                        # le o controle da entrada
	beqz t1, DR_FIM_DANO                                # encerra antes da aparicao
	la t0, ROSALINA_INVENCIVEL                          # verifica o intervalo entre tiros
	lw t1, 0(t0)                                        # le o contador
	bnez t1, DR_FIM_DANO                                # ignora tiros durante a protecao
	li t1, TEMPO_INVENCIVEL_INIMIGO                     # define o intervalo de dano
	sw t1, 0(t0)                                        # salva a protecao
	la t0, ROSALINA_VIDA                                # reduz a vida da rosalina
	lw t1, 0(t0)                                        # le a vida atual
	addi t1, t1, -1                                     # retira um ponto
	bgtz t1, DR_ROS_SALVA                               # mantem a luta se ainda tem vida
	li t1, 0                                            # impede vida negativa
	sw t1, 0(t0)                                        # salva a vida zerada
	la t0, ROSALINA_ATIVA                               # desativa a rosalina
	sw zero, 0(t0)                                      # marca a derrota
	la t0, ESTRELA_ROSALINA_ATIVA                       # remove o projetil ativo
	sw zero, 0(t0)                                      # desliga a estrela
	la t0, ESTRELA_ROSALINA_AVISO                       # remove o aviso vertical
	sw zero, 0(t0)                                      # desliga a marca
	ret                                                 # retorna para a colisao do tiro
DR_ROS_SALVA:
	sw t1, 0(t0)                                        # salva a vida restante
	la t0, ROSALINA_ESTADO                              # abre uma janela depois do acerto
	li t1, ROS_ESTADO_VULNERAVEL                        # estado de vulnerabilidade
	sw t1, 0(t0)                                        # salva o estado
	la t0, ROSALINA_TIMER                               # reinicia o contador da pausa
	sw zero, 0(t0)                                      # zera o tempo
DR_FIM_DANO:
	ret                                                 # retorna para a colisao do tiro

DESENHA_ROSALINA:
	# Seleciona o sprite normal ou ofensivo da Rosalina
	addi sp, sp, -4                                     # reserva espaco para o retorno
	sw ra, 0(sp)                                        # salva o endereco de retorno
	la t0, ROSALINA_ATIVA                               # verifica se a rosalina esta ativa
	lw t1, 0(t0)                                        # le o controle
	beqz t1, DER_FIM                                    # encerra quando foi derrotada
	la t0, FASE_ATUAL                                   # verifica a fase atual
	lw t1, 0(t0)                                        # le o numero da fase
	li t2, 2                                            # rosalina pertence a fase 2
	bne t1, t2, DER_FIM                                 # encerra fora da fase
	la t0, ROSALINA_LIBERADA                            # le o controle da entrada na arena
	lw t1, 0(t0)                                        # o sprite pode aparecer antes do primeiro ataque

	la t0, ROSALINA_INVENCIVEL                          # faz o sprite piscar depois de um tiro
	lw t1, 0(t0)                                        # le o contador de protecao
	andi t2, t1, 1                                      # usa os quadros pares e impares
	bnez t2, DER_EFEITOS                                # pula o sprite em metade dos quadros

	la t0, ROSALINA_ESTADO                              # escolhe entre os dois sprites disponiveis
	lw t1, 0(t0)                                        # le o estado atual
	la a0, rosalina                                     # sprite normal
	li a4, 135                                          # cor transparente do sprite normal
	la t0, ROSALINA_POSE_ATAQUE
	lw t2, 0(t0)
	bnez t2, DER_POWER                                  # mantem a pose na liberacao do ataque
	li t2, ROS_ESTADO_PREPARA_HORIZONTAL                # preparacao horizontal usa o poder
	beq t1, t2, DER_POWER                               # troca o sprite
	li t2, ROS_ESTADO_PREPARA_VERTICAL                  # preparacao vertical usa o poder
	beq t1, t2, DER_POWER                               # troca o sprite
	li t2, ROS_ESTADO_PULSO                             # pulso usa o sprite de poder
	beq t1, t2, DER_POWER                               # troca o sprite
	j DER_SPRITE_OK                                     # mantem o sprite normal
DER_POWER:
	la a0, rosalina_power                               # sprite de ataque
	li a4, 143                                          # cor transparente do sprite de poder
DER_SPRITE_OK:
	la t0, ROSALINA_X                                   # passa a posicao horizontal no mundo
	lw a1, 0(t0)                                        # x da rosalina
	la t0, ROSALINA_Y                                   # passa a altura atual
	lw a2, 0(t0)                                        # y da rosalina
	mv a3, s1                                           # usa o frame oculto
	call DESENHA_SPRITE_MUNDO                           # desenha com recorte nas bordas

DER_EFEITOS:
	la t0, ROSALINA_LIBERADA                            # efeitos so existem depois da entrada completa
	lw t1, 0(t0)                                        # le o controle do combate
	beqz t1, DER_FIM                                    # nao mostra poder antes de ver a rosalina
	call DESENHA_EFEITOS_ROSALINA                       # desenha aviso e estrela ativa
DER_FIM:
	lw ra, 0(sp)                                        # recupera o endereco de retorno
	addi sp, sp, 4                                      # libera o espaco da pilha
	ret                                                 # retorna para o loop

DESENHA_EFEITOS_ROSALINA:
	# Desenha os efeitos ativos da Rosalina
	addi sp, sp, -4
	sw ra, 0(sp)

DER_DESENHA_ESTRELA:
    la t0, ESTRELA_ROSALINA_ATIVA
    lw t1, 0(t0)
    beqz t1, DER_EFEITOS_FIM


    # desenha sprite do projetil
    la t0, ESTRELA_ROSALINA_SPRITE
    lw t1, 0(t0)
	
    beqz t1, DER_PROJ0
	
    li t2, 1
    beq t1, t2, DER_PROJ1
	
    li t2, 2
    beq t1, t2, DER_PROJ2
	
    # sprite 3
    la a0, luma_amarela
    j DER_PROJ_OK
	
    DER_PROJ0:
    la a0, luma_azul
    j DER_PROJ_OK
	
    DER_PROJ1:
    la a0, luma_rosa
    j DER_PROJ_OK
	
    DER_PROJ2:
    la a0, luma_verde
	
    DER_PROJ_OK:
    
    la t0, ESTRELA_ROSALINA_X
    lw a1, 0(t0)                   # x no mundo

    la t0, ESTRELA_ROSALINA_Y
    lw a2, 0(t0)                   # y no mundo

    mv a3, s1                      # frame
    li a4, 255                     # cor transparente

    call DESENHA_SPRITE_MUNDO
DER_EFEITOS_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

#---------------------------------------------------------------------------
#                     bowser
#---------------------------------------------------------------------------
ATUALIZA_BOWSER:
	addi sp, sp, -4
	sw ra, 0(sp)
	call ATUALIZA_FOGO_BOWSER
	call ATUALIZA_IMPACTO_BOWSER

	la t0, BOWSER_ATIVO
	lw t1, 0(t0)
	beqz t1, AB_FIM
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 1
	bne t1, t2, AB_FORA_AREA
	la t0, BOWSER_LIBERADO
	lw t2, 0(t0)
	bnez t2, AB_COMBATE_ATIVO
	la t0, PLAYER_X
	lw t1, 0(t0)
	li t2, 1300
	blt t1, t2, AB_FORA_AREA
	la t0, BOWSER_LIBERADO
	li t2, 1
	sw t2, 0(t0)
AB_COMBATE_ATIVO:

	la t0, BOWSER_ESTADO
	lw t1, 0(t0)
	li t2, BOW_ESTADO_ANDA
	beq t1, t2, AB_ANDA
	li t2, BOW_ESTADO_PREPARA_FOGO
	beq t1, t2, AB_PREPARA_FOGO
	li t2, BOW_ESTADO_PREPARA_INVESTIDA
	beq t1, t2, AB_PREPARA_INVESTIDA
	li t2, BOW_ESTADO_INVESTIDA
	beq t1, t2, AB_INVESTIDA
	li t2, BOW_ESTADO_ATORDOADO
	beq t1, t2, AB_ATORDOADO
	li t2, BOW_ESTADO_PREPARA_SALTO
	beq t1, t2, AB_PREPARA_SALTO
	li t2, BOW_ESTADO_SALTO
	beq t1, t2, AB_SALTO
	j AB_RECUPERA

AB_ANDA:
	# bowser avanca ate uma distancia de ataque sem atravessar o personagem
	la t0, BOWSER_X
	lw t1, 0(t0)
	la t2, PLAYER_X
	lw t3, 0(t2)
	addi t4, t1, 40
	addi t5, t3, 24
	sub t6, t5, t4
	bgez t6, AB_ALVO_DIREITA
	neg a6, t6
	li a5, 150
	blt a6, a5, AB_SALVA_X_ANDA
	addi t1, t1, -2
	la t2, BOWSER_DIRECAO
	li t3, -1
	sw t3, 0(t2)
	j AB_SALVA_X_ANDA
AB_ALVO_DIREITA:
	li a5, 72
	blt t6, a5, AB_SALVA_X_ANDA
	addi t1, t1, 2
	la t2, BOWSER_DIRECAO
	li t3, 1
	sw t3, 0(t2)
AB_SALVA_X_ANDA:
	la t0, BOWSER_X
	sw t1, 0(t0)

	la t0, BOWSER_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, 26
	blt t1, t2, AB_SALVA_TIMER
	sw zero, 0(t0)
	la t2, PLAYER_X
	lw t3, 0(t2)
	la t2, BOWSER_X
	lw t4, 0(t2)
	sub t5, t3, t4
	bgez t5, AB_DISTANCIA_OK
	neg t5, t5
AB_DISTANCIA_OK:
	li t6, 90
	blt t5, t6, AB_ESCOLHE_SALTO
	li t6, 100
	bgt t5, t6, AB_ESCOLHE_FOGO
	la t2, BOWSER_ESTADO
	li t3, BOW_ESTADO_PREPARA_INVESTIDA
	sw t3, 0(t2)
	j AB_FIM
AB_ESCOLHE_SALTO:
	la t2, BOWSER_ESTADO
	li t3, BOW_ESTADO_PREPARA_SALTO
	sw t3, 0(t2)
	j AB_FIM
AB_ESCOLHE_FOGO:
	la t2, BOWSER_ESTADO
	li t3, BOW_ESTADO_PREPARA_FOGO
	sw t3, 0(t2)
	j AB_FIM

AB_PREPARA_FOGO:
	la t0, BOWSER_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, 8
	blt t1, t2, AB_SALVA_TIMER
	sw zero, 0(t0)
	la t2, BOWSER_X
	lw t3, 0(t2)
	la t4, PLAYER_X
	lw t4, 0(t4)
	li t5, 7
	bge t4, t3, AB_FOGO_DIREITA
	addi t3, t3, -20
	li t5, -7
	j AB_FOGO_POSICAO
AB_FOGO_DIREITA:
	addi t3, t3, 80
AB_FOGO_POSICAO:
	la t2, FOGO_BOWSER_X
	sw t3, 0(t2)
	la t2, FOGO_BOWSER_Y
	li t3, 151
	sw t3, 0(t2)
	la t2, FOGO_BOWSER_VX
	sw t5, 0(t2)
	la t2, FOGO_BOWSER_ATIVO
	li t3, 1
	sw t3, 0(t2)
	la t2, BOWSER_POSE_ATAQUE
	li t3, TEMPO_POSE_ATAQUE
	sw t3, 0(t2)
	la t2, BOWSER_ESTADO
	li t3, BOW_ESTADO_RECUPERA
	sw t3, 0(t2)
	j AB_FIM

AB_PREPARA_INVESTIDA:
	la t0, BOWSER_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, 8
	blt t1, t2, AB_SALVA_TIMER
	sw zero, 0(t0)
	la t2, PULANDO
	lw t3, 0(t2)
	beqz t3, AB_INICIA_INVESTIDA
	la t2, BOWSER_ESTADO
	li t3, BOW_ESTADO_PREPARA_FOGO
	sw t3, 0(t2)
	la t2, BOWSER_TIMER
	li t3, 8
	sw t3, 0(t2)
	j AB_FIM
AB_INICIA_INVESTIDA:
	la t2, PLAYER_X
	lw t3, 0(t2)
	la t2, BOWSER_X
	lw t4, 0(t2)
	li t5, 1
	bge t3, t4, AB_SALVA_DIR_INVESTIDA
	li t5, -1
AB_SALVA_DIR_INVESTIDA:
	la t2, BOWSER_DIRECAO
	sw t5, 0(t2)
	la t2, BOWSER_ESTADO
	li t3, BOW_ESTADO_INVESTIDA
	sw t3, 0(t2)
	j AB_FIM

AB_INVESTIDA:
	la t0, BOWSER_X
	lw t1, 0(t0)
	la t2, BOWSER_DIRECAO
	lw t3, 0(t2)
	slli t4, t3, 3
	add t1, t1, t4
	la t2, BOWSER_TIMER
	lw t4, 0(t2)
	addi t4, t4, 1
	sw t4, 0(t2)
	li t5, BOWSER_X_MIN
	ble t1, t5, AB_FIM_INVESTIDA_ESQ
	li t5, BOWSER_X_MAX
	bge t1, t5, AB_FIM_INVESTIDA_DIR
	li t5, 24
	bge t4, t5, AB_FIM_INVESTIDA
	sw t1, 0(t0)
	j AB_FIM
AB_FIM_INVESTIDA_ESQ:
	li t1, BOWSER_X_MIN
	j AB_FIM_INVESTIDA_SALVA
AB_FIM_INVESTIDA_DIR:
	li t1, BOWSER_X_MAX
	j AB_FIM_INVESTIDA_SALVA
AB_FIM_INVESTIDA:
AB_FIM_INVESTIDA_SALVA:
	sw t1, 0(t0)
	la t2, BOWSER_TIMER
	sw zero, 0(t2)
	la t2, BOWSER_ESTADO
	li t3, BOW_ESTADO_ATORDOADO
	sw t3, 0(t2)
	j AB_FIM

AB_ATORDOADO:
	la t0, BOWSER_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, 20
	blt t1, t2, AB_SALVA_TIMER
	sw zero, 0(t0)
	la t2, BOWSER_ESTADO
	li t3, BOW_ESTADO_ANDA
	sw t3, 0(t2)
	j AB_FIM

AB_PREPARA_SALTO:
	la t0, BOWSER_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, 7
	blt t1, t2, AB_SALVA_TIMER
	sw zero, 0(t0)
	la t2, BOWSER_VEL_Y
	li t3, -10
	sw t3, 0(t2)
	la t2, PLAYER_X
	lw t3, 0(t2)
	la t2, BOWSER_X
	lw t4, 0(t2)
	li t5, 1
	bge t3, t4, AB_SALVA_DIR_SALTO
	li t5, -1
AB_SALVA_DIR_SALTO:
	la t2, BOWSER_DIRECAO
	sw t5, 0(t2)
	la t2, BOWSER_ESTADO
	li t3, BOW_ESTADO_SALTO
	sw t3, 0(t2)
	j AB_FIM

AB_SALTO:
	la t0, BOWSER_Y
	lw t1, 0(t0)
	la t2, BOWSER_VEL_Y
	lw t3, 0(t2)
	add t1, t1, t3
	addi t3, t3, 1
	sw t3, 0(t2)
	la t2, BOWSER_X
	lw t4, 0(t2)
	la t5, BOWSER_DIRECAO
	lw t5, 0(t5)
	slli t6, t5, 1
	add t6, t6, t5
	add t4, t4, t6
	li t5, BOWSER_X_MIN
	bge t4, t5, AB_SALTO_CHECA_MAX
	mv t4, t5
AB_SALTO_CHECA_MAX:
	li t5, BOWSER_X_MAX
	ble t4, t5, AB_SALTO_SALVA_X
	mv t4, t5
AB_SALTO_SALVA_X:
	sw t4, 0(t2)
	li t5, 113
	blt t1, t5, AB_SALTO_SALVA_Y
	mv t1, t5
	la t2, IMPACTO_BOWSER_X
	addi t4, t4, -24
	sw t4, 0(t2)
	la t2, IMPACTO_BOWSER_TIMER
	li t3, 14
	sw t3, 0(t2)
	la t2, IMPACTO_BOWSER_ATIVO
	li t3, 1
	sw t3, 0(t2)
	la t2, BOWSER_POSE_ATAQUE
	li t3, TEMPO_POSE_ATAQUE
	sw t3, 0(t2)
	la t2, BOWSER_TIMER
	sw zero, 0(t2)
	la t2, BOWSER_ESTADO
	li t3, BOW_ESTADO_ATORDOADO
	sw t3, 0(t2)
AB_SALTO_SALVA_Y:
	sw t1, 0(t0)
	j AB_FIM

AB_RECUPERA:
	la t0, BOWSER_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, 10
	blt t1, t2, AB_SALVA_TIMER
	sw zero, 0(t0)
	la t2, BOWSER_ESTADO
	li t3, BOW_ESTADO_ANDA
	sw t3, 0(t2)
	j AB_FIM

AB_SALVA_TIMER:
	sw t1, 0(t0)
	j AB_FIM
AB_FORA_AREA:
	la t0, FOGO_BOWSER_ATIVO
	sw zero, 0(t0)
	la t0, IMPACTO_BOWSER_ATIVO
	sw zero, 0(t0)
	la t0, BOWSER_CONTATO
	sw zero, 0(t0)
AB_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

ATUALIZA_FOGO_BOWSER:
	la t0, FOGO_BOWSER_ATIVO
	lw t1, 0(t0)
	beqz t1, AFB_FIM
	la t2, FOGO_BOWSER_X
	lw t3, 0(t2)
	la t4, FOGO_BOWSER_VX
	lw t4, 0(t4)
	add t3, t3, t4
	sw t3, 0(t2)
	bltz t3, AFB_REMOVE
	li t4, MAP_LARGURA
	ble t3, t4, AFB_FIM
AFB_REMOVE:
	sw zero, 0(t0)
AFB_FIM:
	ret

ATUALIZA_IMPACTO_BOWSER:
	la t0, IMPACTO_BOWSER_ATIVO
	lw t1, 0(t0)
	beqz t1, AIB_FIM
	la t2, IMPACTO_BOWSER_TIMER
	lw t3, 0(t2)
	addi t3, t3, -1
	bgtz t3, AIB_SALVA                                  # verifica se o valor e positivo
	sw zero, 0(t0)
	sw zero, 0(t2)
	ret
AIB_SALVA:
	sw t3, 0(t2)
AIB_FIM:
	ret

CHECA_COLISOES_BOWSER:
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, BOWSER_ATIVO
	lw t1, 0(t0)
	beqz t1, CCB_FIM
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 1
	bne t1, t2, CCB_FIM
	la t0, BOWSER_LIBERADO
	lw t1, 0(t0)
	beqz t1, CCB_FIM

	la t0, PLAYER_X
	lw a0, 0(t0)
	la t0, PLAYER_Y
	lw a1, 0(t0)
	li a2, LARG_PERSONAGEM
	li a3, LARG_PERSONAGEM
	la t0, BOWSER_X
	lw a4, 0(t0)
	addi a4, a4, INIMIGO_HITBOX_X
	la t0, BOWSER_Y
	lw a5, 0(t0)
	addi a5, a5, INIMIGO_HITBOX_Y
	li a6, INIMIGO_HITBOX_LARGURA
	li a7, INIMIGO_HITBOX_ALTURA
	call COLIDE_CAIXAS
	beqz a0, CCB_SEPAROU
	la t0, BOWSER_CONTATO
	lw t1, 0(t0)
	bnez t1, CCB_FOGO
	li t1, 1
	sw t1, 0(t0)
	la t0, BOWSER_X
	lw a0, 0(t0)
	call APLICA_DANO_PLAYER
	j CCB_FOGO
CCB_SEPAROU:
	la t0, BOWSER_CONTATO
	sw zero, 0(t0)

CCB_FOGO:
	la t0, FOGO_BOWSER_ATIVO
	lw t1, 0(t0)
	beqz t1, CCB_IMPACTO
	la t0, PLAYER_X
	lw a0, 0(t0)
	la t0, PLAYER_Y
	lw a1, 0(t0)
	li a2, LARG_PERSONAGEM
	li a3, LARG_PERSONAGEM
	la t0, FOGO_BOWSER_X
	lw a4, 0(t0)
	la t0, FOGO_BOWSER_Y
	lw a5, 0(t0)
	li a6, 20
	li a7, 12
	call COLIDE_CAIXAS
	beqz a0, CCB_IMPACTO
	la t0, FOGO_BOWSER_ATIVO
	sw zero, 0(t0)
	la t0, FOGO_BOWSER_X
	lw a0, 0(t0)
	call APLICA_DANO_PLAYER

CCB_IMPACTO:
	la t0, IMPACTO_BOWSER_ATIVO
	lw t1, 0(t0)
	beqz t1, CCB_FIM
	la t0, PLAYER_X
	lw a0, 0(t0)
	la t0, PLAYER_Y
	lw a1, 0(t0)
	li a2, LARG_PERSONAGEM
	li a3, LARG_PERSONAGEM
	la t0, IMPACTO_BOWSER_X
	lw a4, 0(t0)
	li a5, 185
	li a6, 128
	li a7, 10
	call COLIDE_CAIXAS
	beqz a0, CCB_FIM
	la t0, IMPACTO_BOWSER_ATIVO
	sw zero, 0(t0)
	la t0, BOWSER_X
	lw a0, 0(t0)
	call APLICA_DANO_PLAYER
CCB_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

DANO_BOWSER:
	la t0, BOWSER_ATIVO
	lw t1, 0(t0)
	beqz t1, DB_FIM
	la t0, BOWSER_INVENCIVEL
	lw t1, 0(t0)
	bnez t1, DB_FIM
	li t1, TEMPO_INVENCIVEL_INIMIGO
	sw t1, 0(t0)
	la t0, BOWSER_VIDA
	lw t1, 0(t0)
	addi t1, t1, -1
	bgtz t1, DB_SALVA                                   # verifica se o valor e positivo
	li t1, 0
	sw t1, 0(t0)
	la t0, BOWSER_ATIVO
	sw zero, 0(t0)
	la t0, FOGO_BOWSER_ATIVO
	sw zero, 0(t0)
	la t0, IMPACTO_BOWSER_ATIVO
	sw zero, 0(t0)
	ret
DB_SALVA:
	sw t1, 0(t0)
	la t0, BOWSER_ESTADO
	li t1, BOW_ESTADO_ATORDOADO
	sw t1, 0(t0)
	la t0, BOWSER_TIMER
	sw zero, 0(t0)
DB_FIM:
	ret

DESENHA_BOWSER:
	# Seleciona o sprite normal ou ofensivo do Bowser
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, BOWSER_ATIVO
	lw t1, 0(t0)
	beqz t1, DEB_PROJETEIS
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 1
	bne t1, t2, DEB_FIM
	la t0, BOWSER_LIBERADO
	lw t1, 0(t0)
	beqz t1, DEB_FIM
	la t0, BOWSER_INVENCIVEL
	lw t1, 0(t0)
	andi t2, t1, 1
	bnez t2, DEB_PROJETEIS
	la t0, BOWSER_ESTADO
	lw t1, 0(t0)
	la a0, bowser80
	li a4, 146
	la t0, BOWSER_POSE_ATAQUE
	lw t2, 0(t0)
	bnez t2, DEB_POWER                  # mantem a pose na liberacao do ataque
	li t2, BOW_ESTADO_PREPARA_FOGO
	beq t1, t2, DEB_POWER
	li t2, BOW_ESTADO_PREPARA_INVESTIDA
	beq t1, t2, DEB_POWER
	li t2, BOW_ESTADO_INVESTIDA
	beq t1, t2, DEB_POWER
	li t2, BOW_ESTADO_PREPARA_SALTO
	beq t1, t2, DEB_POWER
	li t2, BOW_ESTADO_SALTO
	beq t1, t2, DEB_POWER
	j DEB_SPRITE_OK
DEB_POWER:
	la a0, bowser_power
DEB_SPRITE_OK:
	la t0, BOWSER_X
	lw a1, 0(t0)
	la t0, BOWSER_Y
	lw a2, 0(t0)
	mv a3, s1
	call DESENHA_SPRITE_MUNDO
DEB_PROJETEIS:
	la t0, FOGO_BOWSER_ATIVO
	lw t1, 0(t0)
	beqz t1, DEB_IMPACTO

	# Desenha fogo do Bowser como sprite
	la a0, bowser_fogo2

	la t0, FOGO_BOWSER_X
	lw a1, 0(t0)

	la t0, FOGO_BOWSER_Y
	lw a2, 0(t0)

	li a4, 16       # largura/altura da sprite
	mv a3, s1       # câmera

	call DESENHA_SPRITE_MUNDO
DEB_IMPACTO:
	la t0, IMPACTO_BOWSER_ATIVO
	lw t1, 0(t0)
	beqz t1, DEB_FIM
	la t0, IMPACTO_BOWSER_X
	lw a0, 0(t0)
	li a1, 185
	li a2, 128
	li a3, 10
	li a4, 94
	mv a5, s1
	call DESENHA_RETANGULO_MUNDO
DEB_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

#---------------------------------------------------------------------------
#                     mario
#---------------------------------------------------------------------------
ATUALIZA_MARIO:
	addi sp, sp, -4
	sw ra, 0(sp)
	call ATUALIZA_PROJETIL_MARIO
	call ATUALIZA_IMPACTO_MARIO

	la t0, MARIO_ATIVO
	lw t1, 0(t0)
	beqz t1, AM_FIM
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 2
	bne t1, t2, AM_FORA_AREA
	la t0, ROSALINA_ATIVA
	lw t1, 0(t0)
	bnez t1, AM_FORA_AREA              # sequência: Rosalina antes do Mario
	la t0, MARIO_LIBERADO
	lw t2, 0(t0)
	bnez t2, AM_JA_LIBERADO
	la t0, PLAYER_X
	lw t1, 0(t0)
	li t2, 1150
	blt t1, t2, AM_FORA_AREA
	la t0, MARIO_LIBERADO
	li t2, 1
	sw t2, 0(t0)
AM_JA_LIBERADO:
	call ATUALIZA_ALVO_MARIO
	call ATUALIZA_FASE_MARIO
	la t0, MARIO_ESTADO
	lw t1, 0(t0)
	li t2, MARIO_ESTADO_ESPERA
	beq t1, t2, AM_ESPERA
	li t2, MARIO_ESTADO_PREPARA_FOGO
	beq t1, t2, AM_PREPARA_FOGO
	li t2, MARIO_ESTADO_PULO
	beq t1, t2, AM_PULO
	li t2, MARIO_ESTADO_RECUPERA
	beq t1, t2, AM_RECUPERA
	li t2, MARIO_ESTADO_PREPARA_ESTRELA
	beq t1, t2, AM_PREPARA_ESTRELA
	li t2, MARIO_ESTADO_PREPARA_INVESTIDA
	beq t1, t2, AM_PREPARA_INVESTIDA
	li t2, MARIO_ESTADO_INVESTIDA
	beq t1, t2, AM_INVESTIDA
	j AM_COPIA

ATUALIZA_ALVO_MARIO:
	la t2, PLAYER_X
	lw t3, 0(t2)
	addi t3, t3, 24
	la t2, MARIO_X
	lw t4, 0(t2)
	addi t4, t4, 40
	sub t5, t3, t4
	beqz t5, AAM_FIM
	li t6, 1
	bgtz t5, AAM_SALVA
	li t6, -1
AAM_SALVA:
	la t2, MARIO_DIRECAO
	sw t6, 0(t2)
AAM_FIM:
	ret

# movimento leve durante preparacao/recuperacao para nao perder o jogador
MOVE_MARIO_RASTREIO_LENTO:
	la t0, MARIO_X
	lw t1, 0(t0)
	la t2, PLAYER_X
	lw t3, 0(t2)
	addi t3, t3, 24
	addi t4, t1, 40
	sub t5, t3, t4
	mv t6, t5
	bgez t6, MMRL_DIST_OK
	neg t6, t6
MMRL_DIST_OK:
	li a0, 72
	ble t6, a0, MMRL_FIM
	la t2, MARIO_DIRECAO
	lw t3, 0(t2)
	slli t3, t3, 1
	add t1, t1, t3
	sw t1, 0(t0)
MMRL_FIM:
	ret

AM_ESPERA:
	la t0, MARIO_X
	lw t1, 0(t0)
	la t2, PLAYER_X
	lw t3, 0(t2)
	addi t3, t3, 24                       # centro atual do jogador
	addi t4, t1, 40                       # centro atual do mario
	sub t5, t3, t4
	li t6, 1
	bgtz t5, AM_DIRECAO_ATUAL_OK
	li t6, -1
AM_DIRECAO_ATUAL_OK:
	la t2, MARIO_DIRECAO
	sw t6, 0(t2)                          # mantem o alvo atualizado
	mv a0, t5
	bgez a0, AM_DISTANCIA_ATUAL_OK
	neg a0, a0
AM_DISTANCIA_ATUAL_OK:
	li a1, 72
	ble a0, a1, AM_SALVA_MOVIMENTO       # para antes de sobrepor o jogador
	slli t6, t6, 1
	add t1, t1, t6                       # aproxima em vez de fugir
AM_LIMITA_X:
	li t6, MARIO_X_MIN
	bge t1, t6, AM_CHECA_X_MAX
	mv t1, t6
AM_CHECA_X_MAX:
	li t6, MARIO_X_MAX
	ble t1, t6, AM_SALVA_MOVIMENTO
	mv t1, t6
AM_SALVA_MOVIMENTO:
	sw t1, 0(t0)
	la t0, MARIO_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, 18
	blt t1, t2, AM_SALVA_TIMER
	sw zero, 0(t0)
	call ESCOLHE_ATAQUE_MARIO
	j AM_FIM

AM_PREPARA_FOGO:
	call MOVE_MARIO_RASTREIO_LENTO
	la t0, MARIO_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, 7
	blt t1, t2, AM_SALVA_TIMER
	sw zero, 0(t0)
	li a0, 1
	call CRIA_PROJETIL_MARIO
	j AM_ENTRA_RECUPERA

AM_PREPARA_ESTRELA:
	call MOVE_MARIO_RASTREIO_LENTO
	la t0, MARIO_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, 8
	blt t1, t2, AM_SALVA_TIMER
	sw zero, 0(t0)
	li a0, 2
	call CRIA_PROJETIL_MARIO
	j AM_ENTRA_RECUPERA

AM_PREPARA_INVESTIDA:
	call MOVE_MARIO_RASTREIO_LENTO
	la t0, MARIO_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, 8
	blt t1, t2, AM_SALVA_TIMER
	sw zero, 0(t0)
	la t2, PLAYER_X
	lw t3, 0(t2)
	la t2, MARIO_X
	lw t4, 0(t2)
	li t5, 1
	bge t3, t4, AM_SALVA_DIR_INVESTIDA
	li t5, -1
AM_SALVA_DIR_INVESTIDA:
	la t2, MARIO_DIRECAO
	sw t5, 0(t2)
	la t2, MARIO_COMBINACAO
	lw t3, 0(t2)
	li t4, 1
	bne t3, t4, AM_INICIA_INVESTIDA
	li a0, 2
	call CRIA_PROJETIL_MARIO
AM_INICIA_INVESTIDA:
	la t2, MARIO_ESTADO
	li t3, MARIO_ESTADO_INVESTIDA
	sw t3, 0(t2)
	j AM_FIM

AM_INVESTIDA:
	la t0, MARIO_X
	lw t1, 0(t0)
	la t2, MARIO_DIRECAO
	lw t5, 0(t2)                         # mantem a direcao definida na preparacao
	slli t4, t5, 3
	sub t4, t4, t5
	add t1, t1, t4
	la t2, MARIO_TIMER
	lw t4, 0(t2)
	addi t4, t4, 1
	sw t4, 0(t2)
	li t5, MARIO_X_MIN
	ble t1, t5, AM_INV_FIM_ESQ
	li t5, MARIO_X_MAX
	bge t1, t5, AM_INV_FIM_DIR
	li t5, 18
	bge t4, t5, AM_INV_FIM
	sw t1, 0(t0)
	j AM_FIM
AM_INV_FIM_ESQ:
	li t1, MARIO_X_MIN
	j AM_INV_SALVA
AM_INV_FIM_DIR:
	li t1, MARIO_X_MAX
	j AM_INV_SALVA
AM_INV_FIM:
AM_INV_SALVA:
	sw t1, 0(t0)
	la t2, MARIO_TIMER
	sw zero, 0(t2)
	j AM_ENTRA_RECUPERA

AM_PULO:
	la t0, MARIO_Y
	lw t1, 0(t0)
	la t2, MARIO_VEL_Y
	lw t3, 0(t2)
	la t4, MARIO_COMBINACAO
	lw t4, 0(t4)
	li t5, 2
	bne t4, t5, AM_PULO_MOVE
	bnez t3, AM_PULO_MOVE
	la t4, MARIO_PROJETIL_ATIVO
	lw t5, 0(t4)
	bnez t5, AM_PULO_MOVE
	li a0, 3
	call CRIA_PROJETIL_MARIO
	la t0, MARIO_Y
	lw t1, 0(t0)
	la t2, MARIO_VEL_Y
	lw t3, 0(t2)
AM_PULO_MOVE:
	add t1, t1, t3
	addi t3, t3, 1
	sw t3, 0(t2)
	la t2, MARIO_X
	lw t4, 0(t2)
	la t5, PLAYER_X
	lw t6, 0(t5)
	addi t6, t6, 24                       # corrige a direcao durante o salto
	addi t5, t4, 40
	li a0, 1
	bge t6, t5, AM_PULO_DIRECAO_OK
	li a0, -1
AM_PULO_DIRECAO_OK:
	la t5, MARIO_DIRECAO
	sw a0, 0(t5)
	slli t6, a0, 1
	add t6, t6, a0
	add t4, t4, t6
	li t5, MARIO_X_MIN
	bge t4, t5, AM_PULO_CHECA_MAX
	mv t4, t5
AM_PULO_CHECA_MAX:
	li t5, MARIO_X_MAX
	ble t4, t5, AM_PULO_SALVA_X
	mv t4, t5
AM_PULO_SALVA_X:
	sw t4, 0(t2)
	li t5, MARIO_Y_MAX
	blt t1, t5, AM_PULO_SALVA_Y
	mv t1, t5
	la t2, IMPACTO_MARIO_X
	addi t4, t4, -24
	sw t4, 0(t2)
	la t2, IMPACTO_MARIO_TIMER
	li t3, 14
	sw t3, 0(t2)
	la t2, IMPACTO_MARIO_ATIVO
	li t3, 1
	sw t3, 0(t2)
	la t2, MARIO_POSE_ATAQUE
	li t3, TEMPO_POSE_ATAQUE
	sw t3, 0(t2)
	la t2, MARIO_TIMER
	sw zero, 0(t2)
	la t2, MARIO_Y
	sw t1, 0(t2)
	j AM_ENTRA_RECUPERA
AM_PULO_SALVA_Y:
	sw t1, 0(t0)
	j AM_FIM

AM_COPIA:
	call MOVE_MARIO_RASTREIO_LENTO
	la t0, MARIO_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, 7
	bne t1, t2, AM_COPIA_CHECA_FIM
	li a0, 1
	call CRIA_PROJETIL_MARIO
AM_COPIA_CHECA_FIM:
	li t2, 24
	blt t1, t2, AM_SALVA_TIMER
	sw zero, 0(t0)
	la t2, MARIO_COPIA_ATIVA
	sw zero, 0(t2)
	j AM_ENTRA_RECUPERA

AM_ENTRA_RECUPERA:
	la t0, MARIO_ESTADO
	li t1, MARIO_ESTADO_RECUPERA
	sw t1, 0(t0)
	la t0, MARIO_TIMER
	sw zero, 0(t0)
	j AM_FIM

AM_RECUPERA:
	call MOVE_MARIO_RASTREIO_LENTO
	la t0, MARIO_TIMER
	lw t1, 0(t0)
	addi t1, t1, 1
	li t2, 10
	blt t1, t2, AM_SALVA_TIMER
	sw zero, 0(t0)
	la t2, MARIO_COMBINACAO
	sw zero, 0(t2)
	la t2, MARIO_ESTADO
	li t3, MARIO_ESTADO_ESPERA
	sw t3, 0(t2)
	j AM_FIM

AM_SALVA_TIMER:
	sw t1, 0(t0)
	j AM_FIM
AM_FORA_AREA:
	la t0, MARIO_PROJETIL_ATIVO
	sw zero, 0(t0)
	la t0, IMPACTO_MARIO_ATIVO
	sw zero, 0(t0)
	la t0, MARIO_COPIA_ATIVA
	sw zero, 0(t0)
	la t0, MARIO_CONTATO
	sw zero, 0(t0)
AM_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

ATUALIZA_FASE_MARIO:
	la t0, MARIO_VIDA
	lw t1, 0(t0)
	li t2, 9
	bge t1, t2, AFM_FASE_1
	li t2, 5
	bge t1, t2, AFM_FASE_2
	li t3, 3
	j AFM_SALVA
AFM_FASE_1:
	li t3, 1
	j AFM_SALVA
AFM_FASE_2:
	li t3, 2
AFM_SALVA:
	la t0, MARIO_FASE
	sw t3, 0(t0)
	ret

ESCOLHE_ATAQUE_MARIO:
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, MARIO_ATAQUE_INDICE
	lw t1, 0(t0)
	la t2, MARIO_FASE
	lw t2, 0(t2)
	li t3, 1
	beq t2, t3, EAM_FASE_1
	li t3, 2
	beq t2, t3, EAM_FASE_2
	j EAM_FASE_3

EAM_FASE_1:
	li t3, 3
	rem t4, t1, t3
	beqz t4, EAM_FOGO
	li t3, 1
	beq t4, t3, EAM_PULO
	j EAM_FOGO

EAM_FASE_2:
	li t3, 4
	rem t4, t1, t3
	beqz t4, EAM_FOGO
	li t3, 1
	beq t4, t3, EAM_ESTRELA
	li t3, 2
	beq t4, t3, EAM_INVESTIDA
	j EAM_COPIA

EAM_FASE_3:
	li t3, 3
	rem t4, t1, t3
	beqz t4, EAM_INVESTIDA_COM_ESTRELA
	li t3, 1
	beq t4, t3, EAM_COPIA
	j EAM_PULO_COM_ESTRELA

EAM_FOGO:
	la t2, MARIO_ESTADO
	li t3, MARIO_ESTADO_PREPARA_FOGO
	sw t3, 0(t2)
	j EAM_AVANCA
EAM_ESTRELA:
	la t2, MARIO_ESTADO
	li t3, MARIO_ESTADO_PREPARA_ESTRELA
	sw t3, 0(t2)
	j EAM_AVANCA
EAM_INVESTIDA:
	la t2, MARIO_ESTADO
	li t3, MARIO_ESTADO_PREPARA_INVESTIDA
	sw t3, 0(t2)
	j EAM_AVANCA
EAM_INVESTIDA_COM_ESTRELA:
	la t2, MARIO_COMBINACAO
	li t3, 1
	sw t3, 0(t2)
	j EAM_INVESTIDA
EAM_PULO:
	la t2, MARIO_COMBINACAO
	sw zero, 0(t2)
	j EAM_INICIA_PULO
EAM_PULO_COM_ESTRELA:
	la t2, MARIO_COMBINACAO
	li t3, 2
	sw t3, 0(t2)
EAM_INICIA_PULO:
	la t2, MARIO_VEL_Y
	li t3, -11
	sw t3, 0(t2)
	la t2, PLAYER_X
	lw t3, 0(t2)
	la t2, MARIO_X
	lw t4, 0(t2)
	li t5, 1
	bge t3, t4, EAM_SALVA_DIR_PULO
	li t5, -1
EAM_SALVA_DIR_PULO:
	la t2, MARIO_DIRECAO
	sw t5, 0(t2)
	la t2, MARIO_ESTADO
	li t3, MARIO_ESTADO_PULO
	sw t3, 0(t2)
	j EAM_AVANCA
EAM_COPIA:
	la t2, MARIO_X
	lw t3, 0(t2)
	li t4, 1465
	blt t3, t4, EAM_COPIA_DIREITA
	li t5, MARIO_X_MIN
	j EAM_SALVA_COPIA
EAM_COPIA_DIREITA:
	li t5, MARIO_X_MAX
EAM_SALVA_COPIA:
	la t2, MARIO_COPIA_X
	sw t5, 0(t2)
	la t2, MARIO_COPIA_ATIVA
	li t3, 1
	sw t3, 0(t2)
	la t2, MARIO_ESTADO
	li t3, MARIO_ESTADO_COPIA
	sw t3, 0(t2)

EAM_AVANCA:
	la t0, MARIO_ATAQUE_INDICE
	lw t1, 0(t0)
	addi t1, t1, 1
	sw t1, 0(t0)
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

# a0 = 1 fogo, 2 estrela vertical, 3 estrela horizontal
CRIA_PROJETIL_MARIO:
	la t0, MARIO_PROJETIL_ATIVO
	lw t1, 0(t0)
	bnez t1, CPM_FIM
	la t2, MARIO_PROJETIL_TIPO
	sw a0, 0(t2)
	li t1, 1
	sw t1, 0(t0)
	la t2, MARIO_POSE_ATAQUE
	li t1, TEMPO_POSE_ATAQUE
	sw t1, 0(t2)
	li t1, 2
	beq a0, t1, CPM_VERTICAL

	la t2, MARIO_X
	lw t3, 0(t2)
	la t4, PLAYER_X
	lw t4, 0(t4)
	li t5, 7
	bge t4, t3, CPM_HORIZONTAL_DIREITA
	addi t3, t3, -20
	li t5, -7
	j CPM_HORIZONTAL_POSICAO
CPM_HORIZONTAL_DIREITA:
	addi t3, t3, 80
CPM_HORIZONTAL_POSICAO:
	la t2, MARIO_PROJETIL_X
	sw t3, 0(t2)
	la t2, MARIO_Y
	lw t3, 0(t2)
	addi t3, t3, 30
	la t2, MARIO_PROJETIL_Y
	sw t3, 0(t2)
	la t2, MARIO_PROJETIL_VX
	sw t5, 0(t2)
	la t2, MARIO_PROJETIL_VY
	sw zero, 0(t2)
	ret
CPM_VERTICAL:
	# o projetil diagonal sempre sai do corpo do mario
	la t2, MARIO_X
	lw t3, 0(t2)
	la t4, PLAYER_X
	lw t4, 0(t4)
	li t5, 5
	bge t4, t3, CPM_VERTICAL_DIREITA
	addi t3, t3, -18
	li t5, -5
	j CPM_VERTICAL_POSICAO
CPM_VERTICAL_DIREITA:
	addi t3, t3, 78
CPM_VERTICAL_POSICAO:
	la t2, MARIO_PROJETIL_X
	sw t3, 0(t2)
	la t2, MARIO_Y
	lw t3, 0(t2)
	addi t3, t3, 24
	la t2, MARIO_PROJETIL_Y
	sw t3, 0(t2)
	la t2, MARIO_PROJETIL_VX
	sw t5, 0(t2)
	la t2, MARIO_PROJETIL_VY
	li t3, 2
	sw t3, 0(t2)
CPM_FIM:
	ret

ATUALIZA_PROJETIL_MARIO:
	la t0, MARIO_PROJETIL_ATIVO
	lw t1, 0(t0)
	beqz t1, APM_FIM
	la t2, MARIO_PROJETIL_X
	lw t3, 0(t2)
	la t4, MARIO_PROJETIL_VX
	lw t4, 0(t4)
	add t3, t3, t4
	sw t3, 0(t2)
	la t2, MARIO_PROJETIL_Y
	lw t4, 0(t2)
	la t5, MARIO_PROJETIL_VY
	lw t5, 0(t5)
	add t4, t4, t5
	sw t4, 0(t2)
	bltz t3, APM_REMOVE
	la t5, PLAYER_X_MAX_ATUAL
	lw t5, 0(t5)
	addi t5, t5, LARG_PERSONAGEM
	bgt t3, t5, APM_REMOVE
	li t5, 240
	bgt t4, t5, APM_REMOVE
	j APM_FIM
APM_REMOVE:
	sw zero, 0(t0)
APM_FIM:
	ret

ATUALIZA_IMPACTO_MARIO:
	la t0, IMPACTO_MARIO_ATIVO
	lw t1, 0(t0)
	beqz t1, AIM_FIM
	la t2, IMPACTO_MARIO_TIMER
	lw t3, 0(t2)
	addi t3, t3, -1
	bgtz t3, AIM_SALVA                                  # verifica se o valor e positivo
	sw zero, 0(t0)
	sw zero, 0(t2)
	ret
AIM_SALVA:
	sw t3, 0(t2)
AIM_FIM:
	ret

CHECA_COLISOES_MARIO:
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, MARIO_ATIVO
	lw t1, 0(t0)
	beqz t1, CCM_FIM
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 2
	bne t1, t2, CCM_FIM
	la t0, MARIO_LIBERADO
	lw t1, 0(t0)
	beqz t1, CCM_FIM
	la t0, PLAYER_X
	lw t1, 0(t0)

	mv a0, t1
	la t0, PLAYER_Y
	lw a1, 0(t0)
	li a2, LARG_PERSONAGEM
	li a3, LARG_PERSONAGEM
	la t0, MARIO_X
	lw a4, 0(t0)
	addi a4, a4, INIMIGO_HITBOX_X
	la t0, MARIO_Y
	lw a5, 0(t0)
	addi a5, a5, INIMIGO_HITBOX_Y
	li a6, INIMIGO_HITBOX_LARGURA
	li a7, INIMIGO_HITBOX_ALTURA
	call COLIDE_CAIXAS
	beqz a0, CCM_SEPAROU
	la t0, MARIO_CONTATO
	lw t1, 0(t0)
	bnez t1, CCM_PROJETIL
	li t1, 1
	sw t1, 0(t0)
	la t0, MARIO_X
	lw a0, 0(t0)
	call APLICA_DANO_PLAYER
	j CCM_PROJETIL
CCM_SEPAROU:
	la t0, MARIO_CONTATO
	sw zero, 0(t0)

CCM_PROJETIL:
	la t0, MARIO_PROJETIL_ATIVO
	lw t1, 0(t0)
	beqz t1, CCM_IMPACTO
	la t0, PLAYER_X
	lw a0, 0(t0)
	la t0, PLAYER_Y
	lw a1, 0(t0)
	li a2, LARG_PERSONAGEM
	li a3, LARG_PERSONAGEM
	la t0, MARIO_PROJETIL_X
	lw a4, 0(t0)
	la t0, MARIO_PROJETIL_Y
	lw a5, 0(t0)
	li a6, PROJETIL_PEQUENO
	li a7, PROJETIL_PEQUENO
	call COLIDE_CAIXAS
	beqz a0, CCM_IMPACTO
	la t0, MARIO_PROJETIL_ATIVO
	sw zero, 0(t0)
	la t0, MARIO_PROJETIL_X
	lw a0, 0(t0)
	call APLICA_DANO_PLAYER

CCM_IMPACTO:
	la t0, IMPACTO_MARIO_ATIVO
	lw t1, 0(t0)
	beqz t1, CCM_FIM
	la t0, PLAYER_X
	lw a0, 0(t0)
	la t0, PLAYER_Y
	lw a1, 0(t0)
	li a2, LARG_PERSONAGEM
	li a3, LARG_PERSONAGEM
	la t0, IMPACTO_MARIO_X
	lw a4, 0(t0)
	li a5, 185
	li a6, 128
	li a7, 10
	call COLIDE_CAIXAS
	beqz a0, CCM_FIM
	la t0, IMPACTO_MARIO_ATIVO
	sw zero, 0(t0)
	la t0, MARIO_X
	lw a0, 0(t0)
	call APLICA_DANO_PLAYER
CCM_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

DANO_MARIO:
	addi sp, sp, -4                                     # reserva espaco para o retorno
	sw ra, 0(sp)                                        # salva o endereco de retorno
	la t0, MARIO_ATIVO
	lw t1, 0(t0)
	beqz t1, DM_FIM
	la t0, MARIO_INVENCIVEL
	lw t1, 0(t0)
	bnez t1, DM_FIM
	li t1, TEMPO_INVENCIVEL_INIMIGO
	sw t1, 0(t0)
	la t0, MARIO_VIDA
	lw t1, 0(t0)
	addi t1, t1, -1
	bgtz t1, DM_SALVA                                   # verifica se o valor e positivo
	li t1, 0
	sw t1, 0(t0)
	la t0, MARIO_ATIVO
	sw zero, 0(t0)
	la t0, MARIO_PROJETIL_ATIVO
	sw zero, 0(t0)
	la t0, IMPACTO_MARIO_ATIVO
	sw zero, 0(t0)
	la t0, MARIO_COPIA_ATIVA
	sw zero, 0(t0)
	j DM_FIM                                            # finaliza a rotina de dano
DM_SALVA:
	sw t1, 0(t0)
	call ATUALIZA_FASE_MARIO
	la t0, MARIO_PROJETIL_ATIVO
	lw t1, 0(t0)
	bnez t1, DM_FIM
	la t0, MARIO_ESTADO
	lw t1, 0(t0)
	li t2, MARIO_ESTADO_ESPERA
	beq t1, t2, DM_REAGE
	li t2, MARIO_ESTADO_RECUPERA
	bne t1, t2, DM_FIM
DM_REAGE:
	li t1, MARIO_ESTADO_PREPARA_FOGO
	sw t1, 0(t0)
	la t0, MARIO_TIMER
	li t1, 3
	sw t1, 0(t0)
	la t0, MARIO_COMBINACAO
	sw zero, 0(t0)
DM_FIM:
	lw ra, 0(sp)                                        # recupera o endereco de retorno
	addi sp, sp, 4                                      # libera o espaco da pilha
	ret

DESENHA_MARIO:
	# Seleciona o sprite normal ou ofensivo do Mario
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, MARIO_ATIVO
	lw t1, 0(t0)
	beqz t1, DEM_FIM
	la t0, FASE_ATUAL
	lw t1, 0(t0)
	li t2, 2
	bne t1, t2, DEM_FIM
	la t0, MARIO_LIBERADO
	lw t1, 0(t0)
	beqz t1, DEM_FIM
	la t0, MARIO_INVENCIVEL
	lw t1, 0(t0)
	andi t2, t1, 1
	bnez t2, DEM_PROJETIL
	la t0, MARIO_ESTADO
	lw t1, 0(t0)
	la a0, mario
	li a4, 105
	la t0, MARIO_POSE_ATAQUE
	lw t2, 0(t0)
	bnez t2, DEM_ESCOLHE_POWER       # mantem a pose na liberacao do ataque
	li t2, MARIO_ESTADO_ESPERA
	beq t1, t2, DEM_SPRITE_PRONTO
	li t2, MARIO_ESTADO_RECUPERA
	beq t1, t2, DEM_SPRITE_PRONTO
DEM_ESCOLHE_POWER:
	la a0, mario_power
DEM_SPRITE_PRONTO:
	la t0, MARIO_X
	lw a1, 0(t0)
	la t0, MARIO_Y
	lw a2, 0(t0)
	mv a3, s1
	call DESENHA_SPRITE_MUNDO
	la t0, MARIO_COPIA_ATIVA
	lw t1, 0(t0)
	beqz t1, DEM_PROJETIL
	la a0, mario_power              # sprite de ataque da copia
DEM_COPIA_SPRITE_OK:
	la t0, MARIO_COPIA_X
	lw a1, 0(t0)
	la t0, MARIO_Y
	lw a2, 0(t0)
	mv a3, s1
	li a4, 105
	call DESENHA_SPRITE_MUNDO
DEM_PROJETIL:
    la t0, MARIO_PROJETIL_ATIVO
    lw t1, 0(t0)
    beqz t1, DEM_IMPACTO

    la a0, mario_fogo      # sprite do projétil

    la t0, MARIO_PROJETIL_X
    lw a1, 0(t0)

    la t0, MARIO_PROJETIL_Y
    lw a2, 0(t0)

    mv a3, s1

    li a4, 18                  # largura da sprite

    call DESENHA_SPRITE_MUNDO
DEM_IMPACTO:
	la t0, IMPACTO_MARIO_ATIVO
	lw t1, 0(t0)
	beqz t1, DEM_VIDA
	la t0, IMPACTO_MARIO_X
	lw a0, 0(t0)
	li a1, 172
	li a2, 128
	li a3, 10
	li a4, 180
	mv a5, s1
	call DESENHA_RETANGULO_MUNDO
DEM_VIDA:
	# Ponto de desenho da barra de vida do Mario
DEM_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

DESENHA_VIDA_MARIO:
	addi sp, sp, -16
	sw ra, 12(sp)
	la t0, MARIO_VIDA
	lw t1, 0(t0)
	sw t1, 0(sp)
	li t1, 244
	sw t1, 4(sp)
	sw zero, 8(sp)
DVM_LOOP:
	lw t0, 8(sp)
	lw t1, 0(sp)
	bge t0, t1, DVM_FIM
	lw a0, 4(sp)
	li a1, 4
	li a2, 5
	li a3, 6
	li a4, 180
	mv a5, s1
	call DESENHA_RETANGULO
	lw t0, 4(sp)
	addi t0, t0, 6
	sw t0, 4(sp)
	lw t0, 8(sp)
	addi t0, t0, 1
	sw t0, 8(sp)
	j DVM_LOOP
DVM_FIM:
	lw ra, 12(sp)
	addi sp, sp, 16
	ret

#---------------------------------------------------------------------------
#                     ataque do personagem contra inimigos
#---------------------------------------------------------------------------
CHECA_ATAQUE_PLAYER_INIMIGOS:
	addi sp, sp, -4
	sw ra, 0(sp)
	call CHECA_TIRO_CENARIO
	call CHECA_TIRO_PLANTAS
	call CHECA_TIRO_ANDADORES
	call CHECA_TIRO_VILOES
	call CHECA_SOCO_INIMIGOS
	call CHECA_SOCO_ANDADORES
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

CHECA_TIRO_CENARIO:
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, TIRO_ATIVO
	lw t1, 0(t0)
	beqz t1, CTC_FIM
	la t0, TIRO_X
	lw a0, 0(t0)
	addi a0, a0, 16
	la t0, TIRO_Y
	lw a1, 0(t0)
	addi a1, a1, 16
	call GET_TILE
	call EH_SOLIDO_AUX
	beqz a0, CTC_FIM
	call REMOVE_TIRO_PLAYER
CTC_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

REMOVE_TIRO_PLAYER:
	la t0, TIRO_ATIVO
	sw zero, 0(t0)
	la t0, TIRO_DIST
	sw zero, 0(t0)
	ret

CHECA_TIRO_PLANTAS:
	addi sp, sp, -20
	sw ra, 16(sp)
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw s2, 8(sp)
	sw s3, 12(sp)
	la t0, TIRO_ATIVO
	lw t1, 0(t0)
	beqz t1, CTP_FIM
	la t0, NUM_PLANTAS
	lw s0, 0(t0)
	la s1, PLANTAS
	li s2, 0
CTP_LOOP:
	beq s2, s0, CTP_FIM
	lw t0, 8(s1)
	beqz t0, CTP_PROXIMA
	la t0, TIRO_X
	lw a0, 0(t0)
	la t0, TIRO_Y
	lw a1, 0(t0)
	li a2, TIRO_LARGURA_REAL
	li a3, TIRO_ALTURA_REAL
	lw a4, 0(s1)
	lw a5, 4(s1)
	li a6, PLANTA_LARGURA_REAL
	li a7, PLANTA_ALTURA_REAL
	call COLIDE_CAIXAS
	beqz a0, CTP_PROXIMA
	lw t0, 8(s1)
	addi t0, t0, -1
	bgez t0, CTP_SALVA_VIDA
	li t0, 0
CTP_SALVA_VIDA:
	sw t0, 8(s1)
	call REMOVE_TIRO_PLAYER
	j CTP_FIM
CTP_PROXIMA:
	addi s1, s1, TAM_INIMIGO_PLANTA
	addi s2, s2, 1
	j CTP_LOOP
CTP_FIM:
	lw s0, 0(sp)
	lw s1, 4(sp)
	lw s2, 8(sp)
	lw s3, 12(sp)
	lw ra, 16(sp)
	addi sp, sp, 20
	ret

CHECA_TIRO_VILOES:
    addi sp, sp, -4
    sw ra, 0(sp)
    la t0, TIRO_ATIVO
    lw t1, 0(t0)
    beqz t1, CTV_FIM
    la t0, FASE_ATUAL
    lw t1, 0(t0)
    li t2, 1
    beq t1, t2, CTV_BOWSER
    li t2, 2
    beq t1, t2, CTV_ROSALINA
    j CTV_FIM
CTV_BOWSER:
    la t0, BOWSER_ATIVO
    lw t1, 0(t0)
    beqz t1, CTV_FIM
    la t0, BOWSER_LIBERADO
    lw t1, 0(t0)
    beqz t1, CTV_FIM
    la t0, BOWSER_X
    lw a4, 0(t0)
    addi a4, a4, INIMIGO_HITBOX_X
    la t0, BOWSER_Y
    lw a5, 0(t0)
    addi a5, a5, INIMIGO_HITBOX_Y
    call MONTA_CAIXA_TIRO
    call COLIDE_CAIXAS
    beqz a0, CTV_FIM
    call REMOVE_TIRO_PLAYER
    call DANO_BOWSER
    j CTV_FIM
CTV_ROSALINA:
    la t0, ROSALINA_ATIVA
    lw t1, 0(t0)
    beqz t1, CTV_MARIO
    la t0, ROSALINA_LIBERADA
    lw t1, 0(t0)
    beqz t1, CTV_MARIO
    la t0, ROSALINA_X
    lw a4, 0(t0)
    addi a4, a4, INIMIGO_HITBOX_X
    la t0, ROSALINA_Y
    lw a5, 0(t0)
    addi a5, a5, INIMIGO_HITBOX_Y
    call MONTA_CAIXA_TIRO
    call COLIDE_CAIXAS
    beqz a0, CTV_MARIO
    call REMOVE_TIRO_PLAYER
    call DANO_ROSALINA
    j CTV_FIM
CTV_MARIO:
    la t0, MARIO_ATIVO
    lw t1, 0(t0)
    beqz t1, CTV_FIM
    la t0, MARIO_LIBERADO
    lw t1, 0(t0)
    beqz t1, CTV_FIM
    la t0, MARIO_X
    lw a4, 0(t0)
    addi a4, a4, INIMIGO_HITBOX_X
    la t0, MARIO_Y
    lw a5, 0(t0)
    addi a5, a5, INIMIGO_HITBOX_Y
    call MONTA_CAIXA_TIRO
    call COLIDE_CAIXAS
    beqz a0, CTV_FIM
    call REMOVE_TIRO_PLAYER
    call DANO_MARIO
CTV_FIM:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

# preserva a caixa do inimigo em a4/a5 e monta a caixa do tiro em a0-a3
MONTA_CAIXA_TIRO:
	la t0, TIRO_X
	lw a0, 0(t0)
	la t0, TIRO_Y
	lw a1, 0(t0)
	li a2, TIRO_LARGURA_REAL
	li a3, TIRO_ALTURA_REAL
	li a6, INIMIGO_HITBOX_LARGURA
	li a7, INIMIGO_HITBOX_ALTURA
	ret

CHECA_SOCO_INIMIGOS:
	addi sp, sp, -28
	sw ra, 24(sp)
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw s2, 8(sp)
	sw s3, 12(sp)
	sw s4, 16(sp)
	sw s5, 20(sp)
	la t0, ATACANDO
	lw t1, 0(t0)
	beqz t1, CSI_FIM
	la t0, ARMA_ATUAL
	lw t1, 0(t0)
	beqz t1, CSI_FIM
	la t0, ATAQUE_TIMER
	lw t1, 0(t0)
	li t2, ATAQUE_DURACAO
	addi t2, t2, -1
	bne t1, t2, CSI_FIM                  # o soco acerta somente uma vez

	la t0, PLAYER_X
	lw s0, 0(t0)
	la t0, PLAYER_Y
	lw s1, 0(t0)
	addi s1, s1, 4
	la t0, FACING
	lw t1, 0(t0)
	bgtz t1, CSI_SOCO_DIREITA
	addi s0, s0, -22
	j CSI_CAIXA_PRONTA
CSI_SOCO_DIREITA:
	addi s0, s0, 44
CSI_CAIXA_PRONTA:
	call CHECA_SOCO_PLANTAS
	call CHECA_SOCO_VILOES
CSI_FIM:
	lw s0, 0(sp)
	lw s1, 4(sp)
	lw s2, 8(sp)
	lw s3, 12(sp)
	lw s4, 16(sp)
	lw s5, 20(sp)
	lw ra, 24(sp)
	addi sp, sp, 28
	ret

CHECA_SOCO_PLANTAS:
	addi sp, sp, -4
	sw ra, 0(sp)
	la t0, NUM_PLANTAS
	lw s2, 0(t0)
	la s3, PLANTAS
	li s4, 0
CSP_LOOP:
	beq s4, s2, CSP_FIM
	lw t0, 8(s3)
	beqz t0, CSP_PROXIMA
	mv a0, s0
	mv a1, s1
	li a2, SOCO_LARGURA_REAL
	li a3, SOCO_ALTURA_REAL
	lw a4, 0(s3)
	lw a5, 4(s3)
	li a6, PLANTA_LARGURA_REAL
	li a7, PLANTA_ALTURA_REAL
	call COLIDE_CAIXAS
	beqz a0, CSP_PROXIMA
	lw t0, 8(s3)
	addi t0, t0, -1
	bgez t0, CSP_SALVA
	li t0, 0
CSP_SALVA:
	sw t0, 8(s3)
	j CSP_FIM
CSP_PROXIMA:
	addi s3, s3, TAM_INIMIGO_PLANTA
	addi s4, s4, 1
	j CSP_LOOP
CSP_FIM:
	lw ra, 0(sp)
	addi sp, sp, 4
	ret

CHECA_SOCO_VILOES:
    addi sp, sp, -4
    sw ra, 0(sp)
    la t0, FASE_ATUAL
    lw t1, 0(t0)
    li t2, 1
    beq t1, t2, CSV_BOWSER
    li t2, 2
    beq t1, t2, CSV_ROSALINA
    j CSV_FIM
CSV_BOWSER:
    la t0, BOWSER_ATIVO
    lw t1, 0(t0)
    beqz t1, CSV_FIM
    la t0, BOWSER_LIBERADO
    lw t1, 0(t0)
    beqz t1, CSV_FIM
    la t0, BOWSER_X
    lw a4, 0(t0)
    addi a4, a4, INIMIGO_HITBOX_X
    la t0, BOWSER_Y
    lw a5, 0(t0)
    addi a5, a5, INIMIGO_HITBOX_Y
    call MONTA_CAIXA_SOCO
    call COLIDE_CAIXAS
    beqz a0, CSV_FIM
    call DANO_BOWSER
    j CSV_FIM
CSV_ROSALINA:
    la t0, ROSALINA_ATIVA
    lw t1, 0(t0)
    beqz t1, CSV_MARIO
    la t0, ROSALINA_LIBERADA
    lw t1, 0(t0)
    beqz t1, CSV_MARIO
    la t0, ROSALINA_X
    lw a4, 0(t0)
    addi a4, a4, INIMIGO_HITBOX_X
    la t0, ROSALINA_Y
    lw a5, 0(t0)
    addi a5, a5, INIMIGO_HITBOX_Y
    call MONTA_CAIXA_SOCO
    call COLIDE_CAIXAS
    beqz a0, CSV_MARIO
    call DANO_ROSALINA
    j CSV_FIM
CSV_MARIO:
    la t0, MARIO_ATIVO
    lw t1, 0(t0)
    beqz t1, CSV_FIM
    la t0, MARIO_LIBERADO
    lw t1, 0(t0)
    beqz t1, CSV_FIM
    la t0, MARIO_X
    lw a4, 0(t0)
    addi a4, a4, INIMIGO_HITBOX_X
    la t0, MARIO_Y
    lw a5, 0(t0)
    addi a5, a5, INIMIGO_HITBOX_Y
    call MONTA_CAIXA_SOCO
    call COLIDE_CAIXAS
    beqz a0, CSV_FIM
    call DANO_MARIO
CSV_FIM:
    lw ra, 0(sp)
    addi sp, sp, 4
    ret

MONTA_CAIXA_SOCO:
	mv a0, s0
	mv a1, s1
	li a2, SOCO_LARGURA_REAL
	li a3, SOCO_ALTURA_REAL
	li a6, INIMIGO_HITBOX_LARGURA
	li a7, INIMIGO_HITBOX_ALTURA
	ret
	ret

#-----------------------------------------------------------
# CHECA COLISAO COM PLANTAS PIRANHAS
#-----------------------------------------------------------
CHECA_COLISAO_PLANTAS:
    addi sp,sp,-12
    sw ra,0(sp)
    sw s2,4(sp)
    sw s3,8(sp)
    
    # verifica invencibilidade
    la t0,INVENCIVEL_TIMER
    lw t1,0(t0)

    beqz t1, CCP_CONTINUA

    # ainda invencivel
    addi t1,t1,-1
    sw t1,0(t0)
    j CCP_FIM

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
    # som de perca de vida
    li a0, 45              # Tom grave
    li a1, 300             # Duração média
    li a2, 80              # Instrumento: Square Wave 
    li a3, 127             # Volume máximo
    li a7, 31
    ecall
    
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
    li t2,PLAYER_X_MAX
    ble t1,t2,CCP_TESTA_RECUO
    mv t1,t2
CCP_TESTA_RECUO:
    la t2,PLAYER_X_CANDIDATO
    sw t1,0(t2)
    mv a0,t1
    call POSICAO_PLAYER_LIVRE       # evita recuo dentro de parede, planta ou limite
    beqz a0,CCP_FIM
    la t2,PLAYER_X_CANDIDATO
    lw t1,0(t2)
    la t0,PLAYER_X
    sw t1,0(t0)
    j CCP_FIM

CCP_PROXIMA:
    addi s3,s3,TAM_INIMIGO_PLANTA
    addi t3,t3,1
    j CCP_LOOP

CCP_FIM:
    lw ra,0(sp)
    lw s2,4(sp)
    lw s3,8(sp)
    addi sp,sp,12
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
    lw s2,4(sp)
    lw s3,8(sp)
    addi sp,sp,12
    ret
    lw s2,4(sp)
    lw s3,8(sp)
    addi sp,sp,12
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
    # logica musica derrota
    la t0, FAIXA_ATUAL
    li t1, 5
    sw t1, 0(t0)           
    la t0, NOTAS_TOCADAS
    sw zero, 0(t0)         
    la t0, NOTA_ATUAL_PTR
    la t1, NOTAS_5
    sw t1, 0(t0)           
    la t0, PROX_NOTA_TEMPO
    sw zero, 0(t0)

GAME_OVER_LOOP:
    call TOCA_MUSICA
    li a0, 10               # Pausa de 10 milissegundos
    li a7, 32
    ecall
    j GAME_OVER_LOOP

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
    # som de acertar tiro
    li a0, 80              # Tom agudo (blip)
    li a1, 100             # Duração muito curta
    li a2, 118             # Instrumento: Synth Drum 
    li a3, 127             # Volume
    li a7, 31
    ecall

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
    # som de tomar dano
    li a0, 45              # Tom grave
    li a1, 300             # Duração média
    li a2, 80              # Instrumento: Square Wave
    li a3, 127             # Volume máximo
    li a7, 31
    ecall

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