HandleRubyEvoModeCollision: ; 0x20581
	ld a, [wSpecialModeCollisionID]
	cp SPECIAL_COLLISION_VOLTORB
	jp z, HandleVoltorbCollision_EvolutionMode_RubyField ;voltorb
	cp SPECIAL_COLLISION_STARYU_ALLEY_TRIGGER
	jp z, HandleStaryuAlleyTriggerCollision_EvolutionMode_RubyField
	cp SPECIAL_COLLISION_BELLSPROUT
	jp z, HandleBellsproutCollision_EvolutionMode_RubyField ;bellsprout
	cp SPECIAL_COLLISION_STARYU
	jp z, HandleStaryuCollision_EvolutionMode_RubyField ;staryu
	cp SPECIAL_COLLISION_LEFT_DIGLETT
	jp z, HandleLeftDiglettCollision_EvolutionMode_RubyField ;diglett
	cp SPECIAL_COLLISION_RIGHT_DIGLETT
	jp z, HandleRightDiglettCollision_EvolutionMode_RubyField ;diglett
	cp SPECIAL_COLLISION_LEFT_BONUS_MULTIPLIER
	jp z, HandleLeftBonusMultiplierCollision_EvolutionMode_RubyField ;right rail?
	cp SPECIAL_COLLISION_RIGHT_BONUS_MULTIPLIER
	jp z, HandleRightBonusMultiplierCollision_EvolutionMode_RubyField ;right rail?
	cp SPECIAL_COLLISION_BALL_UPGRADE
	jp z, HandleBallUpgradeCollision_EvolutionMode_RubyField
	cp SPECIAL_COLLISION_SPINNER
	jp z, HandleSpinnerCollision_EvolutionMode_RubyField
	cp SPECIAL_COLLISION_SLOT_HOLE
	jp z, HandleSlotCaveCollision_EvolutionMode_RubyField
	cp SPECIAL_COLLISION_RIGHT_TRIGGER
	jp z, HandleRightTriggerCollision_EvolutionMode_RubyField
	cp SPECIAL_COLLISION_LEFT_TRIGGER
	jp z, HandleLeftTriggerCollision_EvolutionMode_RubyField
	cp SPECIAL_COLLISION_NOTHING
	jr z, .noCollision
	scf
	ret

.noCollision
	call CheckIfEvolutionModeTimerExpired_RubyField
	ld a, [wSpecialModeState]
	call CallInFollowingTable
EvolutionModeCallTable_RubyField: ; 0x205d4
	padded_dab HandleEvolutionMode_RubyField
	padded_dab CompleteEvolutionMode_RubyField
	padded_dab FailEvolutionMode_RubyField

HandleEvolutionMode_RubyField: ; 0x205e0
	ld a, [wCurrentStage]
	ld b, a
	ld a, [wCollidedPointIndex]
	and a
	ret z
	dec a
	bit 0, b
	jr z, .asm_205f0
	add $c
.asm_205f0
	ld c, a
	ld b, $0
	ld hl, wd566
	add hl, bc
	ld a, [hl]
	and a
	ret z
	xor a
	ld [hl], a
	ld [wEvolutionObjectsDisabled], a
	call Func_20651_RubyField
	ld a, [wd558]
	ld [wIndicatorStates + 2], a
	ld a, [wd559]
	ld [wIndicatorStates + 3], a
	ld [wIndicatorStates + 10], a
	ld a, [wCurrentStage]
	bit 0, a
	callba nz, ClearAllRubyIndicators
	ld bc, OneMillionPoints
	callba AddBigBCD6FromQueue
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld de, YeahYouGotItText
	ld hl, wScrollingText1
	call LoadScrollingText
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_2064f
	ld a, BANK(StageRubyFieldBottomOBJPalette6)
	ld hl, StageRubyFieldBottomOBJPalette6
	ld de, $0070
	ld bc, $0008
	call Func_7dc
.asm_2064f
	scf
	ret

Func_20651_RubyField: ; 0x20651
	ld a, [wCurrentStage]
	bit 0, a
	jr z, .asm_20681
	ld a, [wCurrentEvolutionType]
	dec a
	ld c, a
	ld b, $0
	swap c
	ld hl, EvolutionProgressIconsGfx
	add hl, bc
	add hl, bc
	ld a, [wd554]
	ld c, a
	ld b, $0
	swap c
	sla c
	push hl
	ld hl, vTilesSH tile $2e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, $0020
	ld a, BANK(EvolutionProgressIconsGfx)
	call LoadVRAMData
.asm_20681
	ld a, [wd554]
	inc a
	ld [wd554], a
	cp $1
	jr nz, .asm_20693
	lb de, $07, $28
	call PlaySoundEffect
	ret

.asm_20693
	cp $2
	jr nz, .asm_2069e
	lb de, $07, $44
	call PlaySoundEffect
	ret

.asm_2069e
	cp $3
	ret nz
	lb de, $07, $45
	call PlaySoundEffect
	ld a, $1
	ld [wSlotIsOpen], a
	ld a, $80
	ld [wIndicatorStates + 4], a
	xor a
	ld [wIndicatorStates + 9], a
	ld [wIndicatorStates + 2], a
	ld [wIndicatorStates + 3], a
	ld [wIndicatorStates + 10], a
	ld [wIndicatorStates + 8], a
	ld [wIndicatorStates + 13], a
	ld [wIndicatorStates + 14], a
	ld [wIndicatorStates + 11], a
	ld [wIndicatorStates + 12], a
	ld [wIndicatorStates + 6], a
	ld [wIndicatorStates + 7], a
	ld [wd558], a
	ld [wd559], a
	ld a, [wCurrentStage]
	bit 0, a
	ret z
	ld a, BANK(StageSharedBonusSlotGlowGfx)
	ld hl, StageSharedBonusSlotGlowGfx + $60
	ld de, vTilesOB tile $20
	ld bc, $00e0
	call LoadVRAMData
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_20700
	ld a, BANK(StageRubyFieldBottomOBJPalette7)
	ld hl, StageRubyFieldBottomOBJPalette7
	ld de, $0078
	ld bc, $0008
	call Func_7dc
.asm_20700
	callba LoadSlotCaveCoverGraphics_RubyField
	ret

CompleteEvolutionMode_RubyField: ; 0x2070b
	callba RestoreBallSaverAfterCatchEmMode
	callba PlaceEvolutionInParty
	callba ConcludeEvolutionMode
	ld de, MUSIC_RED_FIELD
	call PlaySong
	ld hl, wNumPokemonEvolvedInBallBonus
	call Increment_Max100
	callba SetPokemonOwnedFlag
	ld a, [wPreviousNumPokeballs]
	cp $3
	ret z
	add $2
	cp $3
	jr c, .asm_2074d
	ld a, $3
.asm_2074d
	ld [wNumPokeballs], a
	ld a, $80
	ld [wPokeballBlinkingCounter], a
	scf
	ret

FailEvolutionMode_RubyField: ; 0x20757
	ld a, [wBottomTextEnabled]
	and a
	ret nz
	call FillBottomMessageBufferWithBlackTile
	callba RestoreBallSaverAfterCatchEmMode
	callba ConcludeEvolutionMode
	ld de, MUSIC_RED_FIELD
	call PlaySong
	scf
	ret

CheckIfEvolutionModeTimerExpired_RubyField: ; 0x2077b
	ld hl, wEvolutionTrinketCooldownFrames
	ld a, [hli]
	ld c, a
	ld b, [hl]
	or b
	jr z, .asm_2078e
	dec bc
	ld a, b
	ld [hld], a
	ld [hl], c
	or c
	jr nz, .asm_2078e
	call EndEvolutionTrinketCooldown_RubyField
.asm_2078e
	callba PlayLowTimeSfx
	ld a, [wTimeRanOut]
	and a
	ret z
	xor a
	ld [wTimeRanOut], a
	ld a, $2
	ld [wSpecialModeState], a
	xor a
	ld [wSlotIsOpen], a
	ld hl, wIndicatorStates
	ld [wIndicatorStates + 4], a
	ld [wIndicatorStates + 9], a
	ld [wIndicatorStates + 2], a
	ld [wIndicatorStates + 3], a
	ld [wIndicatorStates + 10], a
	ld [wIndicatorStates + 8], a
	ld [wIndicatorStates + 13], a
	ld [wIndicatorStates + 14], a
	ld [wIndicatorStates + 11], a
	ld [wIndicatorStates + 12], a
	ld [wIndicatorStates + 6], a
	ld [wIndicatorStates + 7], a
	ld [wd558], a
	ld [wd559], a
	ld [wEvolutionObjectsDisabled], a
	ld a, [wCurrentStage]
	bit 0, a
	jr z, .asm_207f5
	callba ClearAllRubyIndicators
	callba LoadSlotCaveCoverGraphics_RubyField
.asm_207f5
	callba StopTimer
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld hl, wScrollingText1
	ld de, EvolutionFailedText
	ld a, [wCurrentEvolutionType]
	cp EVO_BREEDING
	jr nz, .ok
	ld de, BreedingFailedText
.ok
	call LoadScrollingText
	ret

HandleVoltorbCollision_EvolutionMode_RubyField: ; 0x2080f
	ld bc, $0001
	ld de, $5000
	call AddBCDEToJackpot
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .asm_20837
	ld a, [wIndicatorStates + 9]
	and a
	jr z, .asm_20837
	xor a
	ld [wIndicatorStates + 9], a
	ld a, [wd55c]
	and a
	ld a, $0
	ld [wd55c], a
	jp nz, CreateEvolutionTrinket_RubyField
	jp EvolutionTrinketNotFound_RubyField

.asm_20837
	scf
	ret

HandleStaryuAlleyTriggerCollision_EvolutionMode_RubyField: ; 0x20839
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .asm_20858
	ld a, [wIndicatorStates + 2]
	and a
	jr z, .asm_20858
	xor a
	ld [wIndicatorStates + 2], a
	ld a, [wd563]
	and a
	ld a, $0
	ld [wd563], a
	jp nz, CreateEvolutionTrinket_RubyField
	jp EvolutionTrinketNotFound_RubyField

.asm_20858
	scf
	ret

HandleBellsproutCollision_EvolutionMode_RubyField: ; 0x2085a
	ld bc, $0007
	ld de, $5000
	call AddBCDEToJackpot
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .asm_20885
	ld a, [wIndicatorStates + 3]
	and a
	jr z, .asm_20885
	xor a
	ld [wIndicatorStates + 3], a
	ld [wIndicatorStates + 10], a
	ld a, [wd562]
	and a
	ld a, $0
	ld [wd562], a
	jp nz, CreateEvolutionTrinket_RubyField
	jp EvolutionTrinketNotFound_RubyField

.asm_20885
	scf
	ret

HandleStaryuCollision_EvolutionMode_RubyField: ; 0x20887
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .asm_208a6
	ld a, [wIndicatorStates + 8]
	and a
	jr z, .asm_208a6
	xor a
	ld [wIndicatorStates + 8], a
	ld a, [wd561]
	and a
	ld a, $0
	ld [wd561], a
	jp nz, CreateEvolutionTrinket_RubyField
	jp EvolutionTrinketNotFound_RubyField

.asm_208a6
	scf
	ret

HandleLeftDiglettCollision_EvolutionMode_RubyField: ; 0x208a8
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .asm_208c7
	ld a, [wIndicatorStates + 13]
	and a
	jr z, .asm_208c7
	xor a
	ld [wIndicatorStates + 13], a
	ld a, [wd55d]
	and a
	ld a, $0
	ld [wd55d], a
	jp nz, CreateEvolutionTrinket_RubyField
	jp EvolutionTrinketNotFound_RubyField

.asm_208c7
	scf
	ret

HandleRightDiglettCollision_EvolutionMode_RubyField: ; 0x208c9
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .asm_208e8
	ld a, [wIndicatorStates + 14]
	and a
	jr z, .asm_208e8
	xor a
	ld [wIndicatorStates + 14], a
	ld a, [wd55e]
	and a
	ld a, $0
	ld [wd55e], a
	jp nz, CreateEvolutionTrinket_RubyField
	jp EvolutionTrinketNotFound_RubyField

.asm_208e8
	scf
	ret

HandleLeftBonusMultiplierCollision_EvolutionMode_RubyField: ; 0x208ea
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .asm_20909
	ld a, [wIndicatorStates + 11]
	and a
	jr z, .asm_20909
	xor a
	ld [wIndicatorStates + 11], a
	ld a, [wd55f]
	and a
	ld a, $0
	ld [wd55f], a
	jp nz, CreateEvolutionTrinket_RubyField
	jp EvolutionTrinketNotFound_RubyField

.asm_20909
	scf
	ret

HandleRightBonusMultiplierCollision_EvolutionMode_RubyField: ; 0x2090b
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .asm_2092a
	ld a, [wIndicatorStates + 12]
	and a
	jr z, .asm_2092a
	xor a
	ld [wIndicatorStates + 12], a
	ld a, [wd560]
	and a
	ld a, $0
	ld [wd560], a
	jp nz, CreateEvolutionTrinket_RubyField
	jp EvolutionTrinketNotFound_RubyField

.asm_2092a
	scf
	ret

HandleBallUpgradeCollision_EvolutionMode_RubyField: ; 0x2092c
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .asm_2094b
	ld a, [wIndicatorStates + 6]
	and a
	jr z, .asm_2094b
	xor a
	ld [wIndicatorStates + 6], a
	ld a, [wd565]
	and a
	ld a, $0
	ld [wd565], a
	jp nz, CreateEvolutionTrinket_RubyField
	jp EvolutionTrinketNotFound_RubyField

.asm_2094b
	scf
	ret

HandleSpinnerCollision_EvolutionMode_RubyField: ; 0x2094d
	ld bc, $0000
	ld de, $1500
	call AddBCDEToJackpot
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .asm_20975
	ld a, [wIndicatorStates + 7]
	and a
	jr z, .asm_20975
	xor a
	ld [wIndicatorStates + 7], a
	ld a, [wd564]
	and a
	ld a, $0
	ld [wd564], a
	jp nz, CreateEvolutionTrinket_RubyField
	jp EvolutionTrinketNotFound_RubyField

.asm_20975
	scf
	ret

EvolutionIconIds_RubyField:
	db $00
	db $01 ; EVO_THUNDER_STONE
	db $01 ; EVO_MOON_STONE
	db $01 ; EVO_FIRE_STONE
	db $02 ; EVO_LEAF_STONE
	db $02 ; EVO_WATER_STONE
	db $01 ; EVO_LINK_CABLE
	db $01 ; EVO_EXPERIENCE
	db $01 ; EVO_SUN_STONE
	db $01 ; EVO_BREEDING

CreateEvolutionTrinket_RubyField: ; 0x20977
	lb de, $07, $46
	call PlaySoundEffect
	call ChooseNextEvolutionTrinketLocation_RubyField
	ld a, [wCurrentEvolutionType]
	push hl
	ld hl, EvolutionIconIds_RubyField
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	pop hl
	ld [hl], a
	ld [wEvolutionObjectsDisabled], a
	ld a, [wIndicatorStates + 2]
	ld [wd558], a
	ld a, [wIndicatorStates + 3]
	ld [wd559], a
	xor a
	ld [wIndicatorStates + 2], a
	ld [wIndicatorStates + 3], a
	ld [wIndicatorStates + 10], a
	ld a, [wCurrentStage]
	bit 0, a
	callba nz, ClearAllRubyIndicators
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_209bf
	ld a, BANK(PaletteData_dd188)
	ld hl, PaletteData_dd188
	ld de, $0070
	ld bc, $0010
	call Func_7dc
.asm_209bf
	ld bc, ThreeHundredThousandPoints
	callba AddBigBCD6FromQueue
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld a, [wCurrentEvolutionType]
	dec a
	ld c, a
	ld b, $0
	sla c
	ld hl, EvolutionTypeGetTextPointers
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld hl, wScrollingText1
	call LoadScrollingText
	scf
	ret

EvolutionTrinketNotFound_RubyField: ; 0x209eb
	lb de, $07, $47
	call PlaySoundEffect
	ld a, $1
	ld [wEvolutionObjectsDisabled], a
	ld a, $80
	ld [wIndicatorStates], a
	ld [wIndicatorStates + 1], a
	ld a, [wIndicatorStates + 2]
	ld [wd558], a
	ld a, [wIndicatorStates + 3]
	ld [wd559], a
	xor a
	ld [wIndicatorStates + 2], a
	ld [wIndicatorStates + 3], a
	ld [wIndicatorStates + 10], a
	ld a, [wCurrentStage]
	bit 0, a
	callba nz, ClearAllRubyIndicators
	ld a, $58
	ld [wEvolutionTrinketCooldownFrames], a
	ld a, $2
	ld [wEvolutionTrinketCooldownFrames + 1], a
	ld bc, ThreeHundredThousandPoints
	callba AddBigBCD6FromQueue
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld hl, wScrollingText1
	ld a, [wCurrentEvolutionType]
	cp EVO_EXPERIENCE
	ld de, PokemonIsTiredText
	jr z, .asm_20a50
	cp EVO_BREEDING
	ld de, KeepWalkingText
	jr z, .asm_20a50
	ld de, ItemNotFoundText
.asm_20a50
	call LoadScrollingText
	scf
	ret

EndEvolutionTrinketCooldown_RubyField: ; 0x20a55
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr z, .asm_20a63
	ld a, [wIndicatorStates + 1]
	and a
	jr z, .asm_20a63
	jr RecoverPokemon_RubyField

.asm_20a63
	scf
	ret

HandleRightTriggerCollision_EvolutionMode_RubyField: ; 0x20a65
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr z, .asm_20a80
	ld a, [wIndicatorStates + 1]
	and a
	jr z, .asm_20a80
	ld bc, TenThousandPoints
	callba AddBigBCD6FromQueue
	jr RecoverPokemon_RubyField

.asm_20a80
	scf
	ret

HandleLeftTriggerCollision_EvolutionMode_RubyField: ; 0x20a82
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr z, .asm_20a9d
	ld a, [wIndicatorStates]
	and a
	jr z, .asm_20a9d
	ld bc, TenThousandPoints
	callba AddBigBCD6FromQueue
	jr RecoverPokemon_RubyField

.asm_20a9d
	scf
	ret

RecoverPokemon_RubyField:
	xor a
	ld [wIndicatorStates], a
	ld [wIndicatorStates + 1], a
	ld [wEvolutionObjectsDisabled], a
	ld a, [wd558]
	ld [wIndicatorStates + 2], a
	ld a, [wd559]
	ld [wIndicatorStates + 3], a
	ld [wIndicatorStates + 10], a
	ld a, [wCurrentStage]
	bit 0, a
	callba nz, ClearAllRubyIndicators
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_20ada
	ld a, BANK(StageRubyFieldBottomOBJPalette6)
	ld hl, StageRubyFieldBottomOBJPalette6
	ld de, $0070
	ld bc, $0008
	call Func_7dc
.asm_20ada
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld a, [wCurrentEvolutionType]
	cp EVO_EXPERIENCE
	ld de, PokemonRecoveredText
	jr z, .asm_20aed
	ld de, TryNextPlaceText
.asm_20aed
	ld hl, wScrollingText1
	call LoadScrollingText
	scf
	ret

ChooseNextEvolutionTrinketLocation_RubyField: ; 0x20af5
	ld a, $11
	call RandomRange
	ld c, a
	ld b, $0
	ld hl, wd566
	add hl, bc
	ret

HandleSlotCaveCollision_EvolutionMode_RubyField:
	callba LoadFinalEvolutionMonBillboardPic
	ret
