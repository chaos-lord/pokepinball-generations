_LoadStageDataSilverFieldTop: ; 0x1c165
	call LoadPinballUpgradeTriggersGraphics_SilverField
	call UpdateSpinnerChargeGraphics_SilverField
	call Func_1c3ee_SilverField
	call LoadSlotCaveCoverGraphics_SilverField
	callba Func_142fc
	ld a, $1
	ld [wBlueStageForceFieldGfxNeedsLoading], a
	call UpdateForceFieldGraphics_SilverField
	callba LoadTimerGraphics
	call Func_1c203_SilverField
	ret

_LoadStageDataSilverFieldBottom: ; 0x1c191
	call Func_1c1db_SilverField
	call Func_1c4b6_SilverField
	call Func_1c2cb_SilverField
	call LoadCAVELightsGraphics_SilverField
	call Func_1c43c_SilverField
	call Func_1c305_SilverField
	call Func_1c3ee_SilverField
	callba LoadAgainTextGraphics
	callba DrawBallSaverIcon
	call Func_1c235_SilverField
	call Func_1c21e_SilverField
	call LoadSlotCaveCoverGraphics_SilverField
	callba Func_142fc
	callba LoadTimerGraphics
	call Func_1c203_SilverField
	ret

Func_1c1db_SilverField: ; 0x1c1db
	ld a, [wBlueStageForceFieldFlippedDown]
	cp $0
	ret z
	ld a, $1
	ld [wBlueStageForceFieldGfxNeedsLoading], a
	ld a, $0
	ld [wBlueStageForceFieldFlippedDown], a
	ld a, [wBlueStageForceFieldDirection]
	cp $2  ; down direction
	ret nz
	ld a, $0
	ld [wBlueStageForceFieldDirection], a
	ld a, $1  ; right direction
	ld [wd64a], a
	xor a
	ld [wd649], a
	ld [wd648], a
	ret

Func_1c203_SilverField: ; 0x1c203
	ld a, $ff
	ld [wWhichAnimatedShellder], a
	ld [wd4db], a
	ld a, [wBallXPos + 1]
	ld [wd4c5], a
	ld a, [wBallYPos + 1]
	ld [wd4c6], a
	ld a, [wBallRotation]
	ld [wd4c7], a
	ret

Func_1c21e_SilverField: ; 0x1c21e
	ld a, $ff
	ld [wd60e], a
	ld [wd60f], a
	ld a, [wBonusMultiplierTensDigit]
	call LoadBonusMultiplierRailingGraphics_SilverField
	ld a, [wBonusMultiplierOnesDigit]
	add $14
	call LoadBonusMultiplierRailingGraphics_SilverField
	ret

Func_1c235_SilverField: ; 0x1c235
	ld a, [wLeftMapMoveDiglettAnimationCounter]
	and a
	jr z, .asm_1c249
	ld a, $54
	ld [wStageCollisionMap + $e3], a
	ld a, $55
	ld [wStageCollisionMap + $103], a
	ld a, $1
	jr .asm_1c24a

.asm_1c249
	xor a
.asm_1c24a
	call LoadPsyduckOrPoliwagGraphics_SilverField
	ld a, [wLeftMapMoveCounter]
	call LoadPsyduckOrPoliwagNumberGraphics_SilverField
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_1c267
	ld a, [wLeftMapMoveCounter]
	cp $0
	jr z, .asm_1c264
	ld b, $7
	add b
	jr .asm_1c269

.asm_1c264
	xor a
	jr .asm_1c269

.asm_1c267
	ld a, $8
.asm_1c269
	call LoadPsyduckOrPoliwagNumberGraphics_SilverField
	ld a, [wRightMapMoveDiglettFrame]
	and a
	jr z, .asm_1c295
	ld a, $52
	ld [wStageCollisionMap + $f0], a
	ld a, $53
	ld [wStageCollisionMap + $110], a
	ld a, [wd644]
	and a
	jr z, .asm_1c28a
	ld a, [wMapMoveDirection]
	and a
	jr nz, .asm_1c2bd
	jr .asm_1c291

.asm_1c28a
	ld a, [wRightMapMoveCounter]
	add $3
	jr .asm_1c297

.asm_1c291
	ld a, $3
	jr .asm_1c297

.asm_1c295
	ld a, $2
.asm_1c297
	call LoadPsyduckOrPoliwagGraphics_SilverField
	ld a, [wRightMapMoveCounter]
	add $4
	call LoadPsyduckOrPoliwagNumberGraphics_SilverField
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_1c2b7
	ld a, [wRightMapMoveCounter]
	cp $0
	jr z, .asm_1c2b3
	ld b, $a
	add b
	jr .asm_1c2b9

.asm_1c2b3
	ld a, $4
	jr .asm_1c2b9

.asm_1c2b7
	ld a, $9
.asm_1c2b9
	call LoadPsyduckOrPoliwagNumberGraphics_SilverField
	ret

.asm_1c2bd
	ld a, $6
	call LoadPsyduckOrPoliwagGraphics_SilverField
	ld a, [wRightMapMoveCounter]
	add $4
	call LoadPsyduckOrPoliwagNumberGraphics_SilverField
	ret

Func_1c2cb_SilverField: ; 0x1c2cb
	ld a, [wCurrentStage]
	bit 0, a
	ret z
	ld bc, $0000
.asm_1c2d4
	push bc
	ld hl, wIndicatorStates
	add hl, bc
	ld a, [hl]
	res 7, a
	call LoadArrowIndicatorGraphics_SilverStage
	pop bc
	inc c
	ld a, c
	cp $2
	jr nz, .asm_1c2d4
	ld bc, $0002
.asm_1c2e9
	push bc
	ld hl, wIndicatorStates
	add hl, bc
	ld a, [hl]
	push af
	ld hl, wd648
	add hl, bc
	dec hl
	dec hl
	ld a, [hl]
	ld d, a
	pop af
	add d
	call LoadArrowIndicatorGraphics_SilverStage
	pop bc
	inc c
	ld a, c
	cp $5
	jr nz, .asm_1c2e9
	ret

Func_1c305_SilverField: ; 0x1c305
	ld a, [wInSpecialMode]
	and a
	ret z
	ld a, [wSpecialMode]
	cp SPECIAL_MODE_EVOLUTION
	ret z
	ld a, [wd5c6]
	and a
	jr nz, .asm_1c31f
	ld a, [wCapturingMon]
	and a
	jr nz, .asm_1c31f
	jp Func_1c3ca_SilverField

.asm_1c31f
	callba Func_1c3ac_SilverField
	callba Func_10362
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, Func_10301
	ld a, [wCapturingMon]
	and a
	ret z
	ld a, BANK(PikachuSaverGfx)
	ld hl, PikachuSaverGfx + $c0
	ld de, vTilesOB tile $7e
	ld bc, $0020
	call FarCopyData
	ld a, BANK(StageSharedPikaBoltGfx)
	ld hl, BallCaptureSmokeGfx
	ld de, vTilesSH tile $10
	ld bc, $0180
	call FarCopyData
	callba LoadShakeBallGfx_DuringLoadStage
	ret

Func_1c3ac_SilverField: ; 0x1c3ac
	ld a, $80
	hlCoord 7, 4, vBGMap
	call Func_1c3c3_SilverField
	hlCoord 7, 5, vBGMap
	call Func_1c3c3_SilverField
	hlCoord 7, 6, vBGMap
	call Func_1c3c3_SilverField
	hlCoord 7, 7, vBGMap
	; fall through

Func_1c3c3_SilverField: ; 0x1c3c3
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

Func_1c3ca_SilverField: ; 0x1c3ca
	ld hl, wd586
	ld b, $18
.asm_1c3cf
	ld a, [hli]
	xor $1
	ld [hli], a
	dec b
	jr nz, .asm_1c3cf
	callba Func_10184
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, Func_102bc
	ret

Func_1c3ee_SilverField: ; 0x1c3ee
	ld a, [wInSpecialMode]
	and a
	ret z
	ld a, [wSpecialMode]
	cp SPECIAL_MODE_CATCHEM
	ret nz
	ld a, [wd554]
	cp $3
	ret z
	ld a, [wCurrentStage]
	bit 0, a
	jr nz, .asm_1c416
	ld a, BANK(EvolutionTrinketsGfx)
	ld hl, EvolutionTrinketsGfx
	ld de, vTilesOB tile $60
	ld bc, $00e0
	call FarCopyData
	jr .asm_1c424

.asm_1c416
	ld a, BANK(EvolutionTrinketsGfx)
	ld hl, EvolutionTrinketsGfx
	ld de, vTilesOB tile $20
	ld bc, $00e0
	call FarCopyData
.asm_1c424
	ld a, [wd551]
	and a
	ret z
	ld a, [hGameBoyColorFlag]
	and a
	ret z
	ld a, BANK(PaletteData_dd188)
	ld hl, PaletteData_dd188
	ld de, $0070
	ld bc, $0010
	call FarCopyCGBPals
	ret

Func_1c43c_SilverField: ; 0x1c43c
	ld a, [wInSpecialMode]
	and a
	jr z, .asm_1c458
	ld a, [wSpecialMode]
	and a
	jr nz, .asm_1c450
	ld a, [wNumMonHits]
	and a
	call nz, Func_1c46d_SilverField
	ret

.asm_1c450
	cp SPECIAL_MODE_CATCHEM
	jr nz, .asm_1c458
	call Func_1c47d_SilverField
	ret

.asm_1c458
	ld a, [wPreviousNumPokeballs]
	call LoadPokeballsGraphics_SilverField
	ld a, BANK(CaughtPokeballGfx)
	ld hl, CaughtPokeballGfx
	ld de, vTilesSH tile $2e
	ld bc, $0020
	call FarCopyData
	ret

Func_1c46d_SilverField: ; 0x1c46d
	push af
	callba Func_10611
	pop af
	dec a
	jr nz, Func_1c46d_SilverField
	ret

Func_1c47d_SilverField: ; 0x1c47d
	ld de, $0000
	ld a, [wd554]
	and a
	ret z
	ld b, a
.asm_1c486
	ld a, [wCurrentEvolutionType]
	call Func_1c491_SilverField
	inc de
	dec b
	jr nz, .asm_1c486
	ret

Func_1c491_SilverField: ; 0x1c491
	push bc
	push de
	dec a
	ld c, a
	ld b, $0
	swap c
	sla c
	ld hl, EvolutionProgressIconsGfx
	add hl, bc
	swap e
	sla e
	push hl
	ld hl, vTilesSH tile $2e
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld bc, $0020
	ld a, BANK(EvolutionProgressIconsGfx)
	call FarCopyData
	pop de
	pop bc
	ret

Func_1c4b6_SilverField: ; 0x1c4b6
	ld a, [wInSpecialMode]
	and a
	jr nz, .asm_1c4f0
	ld a, [wOpenedSlotByGetting3Pokeballs]
	and a
	jr z, .asm_1c4d2
	ld a, [wNextBonusStage]
	add $15
	callba LoadBillboardTileData
	ret

.asm_1c4d2
	ld a, [wOpenedSlotByGetting4CAVELights]
	and a
	jr z, .asm_1c4e5
	ld a, $1a
	callba LoadBillboardTileData
	ret

.asm_1c4e5
	callba LoadMapBillboardTileData
	ret

.asm_1c4f0
	ld a, [wSpecialMode]
	cp SPECIAL_MODE_MAP_MOVE
	ret nz
	ld a, [wd54d]
	cp $3
	jr nz, .asm_1c508
	callba LoadMapBillboardTileData
	ret

.asm_1c508
	ld a, [wSlotIsOpen]
	and a
	ld a, $14
	jr nz, .asm_1c515
	ld a, [wMapMoveDirection]
	add $12
.asm_1c515
	callba LoadBillboardTileData
	ret
