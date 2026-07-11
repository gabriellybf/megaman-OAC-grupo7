# Sessão de dados
# Todas os includes de DADOS ficam aqui.
# =========================================================
.data
# Numero de Notas a tocar
pulaL: .string "\n"
NUM: .word 125
# lista de nota,duração,nota,duração,nota,duração,...
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
    .byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
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
       	la s0,NUM		# define o endereço do numero de notas
	lw s1,0(s0)		# le o numero de notas
	la s0,NOTAS		# define o endereço das notas
	li t0,0			# zera o contador de notas
	li a2,68		# define o instrumento
	li a3,127		# define o volume

LOOP:	beq t0,s1, FIMmusic		# contador chegou no final? entao va para FIM
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
    	mv a0,a1		# passa a duração da nota para a pausa
	li a7,32		# define a chamada de syscal 
	ecall			# realiza uma pausa de a0 ms
	addi s0,s0,8		# incrementa para o endereço da proxima nota
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
	call CHECA_BATIDA_BLOCO  
	call CHECA_COLISAO_POWERUP
	call CHECA_PORTA   
	call CHECA_COLISAO_PLANTAS
	
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
	li t3, 'q'
	beq t2, t3, GL_TROCA_ARMA
	j MV_PARADO                # tecla lida não é d/a/w/e/q -> também é "parado"

GL_DIREITA:
	la t4, PLAYER_X
	lw t5, 0(t4)
	addi t5, t5, 4
	li t6, PLAYER_X_MAX
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
	li t5, PLAYER_Y_CHAO
	ble t3, t5, MV_AR_HORIZONTAL
	li t3, PLAYER_Y_CHAO
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

	# <-- AQUI A POSIÇÃO É ATUALIZADA: TIRO_X += TIRO_VELOCIDADE * TIRO_DIRECAO (roda a cada ciclo do GAME_LOOP)
	la t0, TIRO_DIRECAO
	lw t2, 0(t0)
	li t3, TIRO_VELOCIDADE
	mul t2, t2, t3
	la t0, TIRO_X
	lw t4, 0(t0)
	add t4, t4, t2
	sw t4, 0(t0)

	# <-- AQUI A DURAÇÃO/ALCANCE É CONTROLADA: soma a distância percorrida e compara com TIRO_ALCANCE
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
    div t1, a0, t0          # t1 = coluna (x / TILE_SIZE)
    div t2, a1, t0          # t2 = linha  (y / TILE_SIZE)
 
    li t3, TILES_LARGURA
    mul t2, t2, t3
    add t2, t2, t1           # t2 = índice = linha*TILES_LARGURA + coluna
 
    la t4, MAPA_COLISAO
    add t4, t4, t2
    lbu a0, 0(t4)            # lê 1 byte
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
    li t0, 4
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
    sw ra, 0(sp)              # salva o endereço de retorno ANTES do call
 
    la t0, PLAYER_X
    lw a0, 0(t0)
    addi a0, a0, LARG_PERSONAGEM2
    la t0, PLAYER_Y
    lw a1, 0(t0)
    addi a1, a1, LARG_PERSONAGEM2
    call GET_TILE
 
    lw ra, 0(sp)              # restaura o ra certo ANTES de decidir o que fazer
    addi sp, sp, 4
 
    li t1, 4
    beq a0, t1, CP_VAI_FASE2
    ret
CP_VAI_FASE2:
    ret
 
# ---------------------------------------------------------
# Marca uma Mystery Box como "usada" (valor 5)
# ---------------------------------------------------------
# a0 = x mundo, a1 = y tela (mesmo ponto passado pra GET_TILE)
MARCA_TILE_USADO:
    li t0, TILE_SIZE
    div t1, a0, t0
    div t2, a1, t0
    li t3, TILES_LARGURA
    mul t2, t2, t3
    add t2, t2, t1
    la t4, MAPA_COLISAO
    add t4, t4, t2
    li t5, 5
    sb t5, 0(t4)
    ret
	
    
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
    
    
.data
.include "SYSTEMv24.s"
