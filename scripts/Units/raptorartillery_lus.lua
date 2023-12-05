--
-- Creator: MaDDoX
-- Date: 11/11/22
-- Time: 11:38AM
--
include "constants.lua"

local Root = piece 'rig_Raptor_Artillery_Root'
local Thorax = piece 'rig_Raptor_Artillery_Thorax'
local Leg_Front1_L = piece 'rig_Raptor_Artillery_Leg_Front1_L'
local Leg_Front2_L = piece 'rig_Raptor_Artillery_Leg_Front2_L'
local Leg_Front3_L = piece 'rig_Raptor_Artillery_Leg_Front3_L'
local Leg_Middle1_L = piece 'rig_Raptor_Artillery_Leg_Middle1_L'
local Leg_Middle2_L = piece 'rig_Raptor_Artillery_Leg_Middle2_L'
local Leg_Middle3_L = piece 'rig_Raptor_Artillery_Leg_Middle3_L'
local Leg_Back1_L = piece 'rig_Raptor_Artillery_Leg_Back1_L'
local Leg_Back2_L = piece 'rig_Raptor_Artillery_Leg_Back2_L'
local Leg_Back3_L = piece 'rig_Raptor_Artillery_Leg_Back3_L'
local Tail1 = piece 'rig_Raptor_Artillery_Tail1'
local Tail2 = piece 'rig_Raptor_Artillery_Tail2'
local Tail3 = piece 'rig_Raptor_Artillery_Tail3'
local Tail4 = piece 'rig_Raptor_Artillery_Tail4'
local Tail5 = piece 'rig_Raptor_Artillery_Tail5'
local Leg_Front1_R = piece 'rig_Raptor_Artillery_Leg_Front1_R'
local Leg_Front2_R = piece 'rig_Raptor_Artillery_Leg_Front2_R'
local Leg_Front3_R = piece 'rig_Raptor_Artillery_Leg_Front3_R'
local Leg_Middle1_R = piece 'rig_Raptor_Artillery_Leg_Middle1_R'
local Leg_Middle2_R = piece 'rig_Raptor_Artillery_Leg_Middle2_R'
local Leg_Middle3_R = piece 'rig_Raptor_Artillery_Leg_Middle3_R'
local Leg_Back1_R = piece 'rig_Raptor_Artillery_Leg_Back1_R'
local Leg_Back2_R = piece 'rig_Raptor_Artillery_Leg_Back2_R'
local Leg_Back3_R = piece 'rig_Raptor_Artillery_Leg_Back3_R'
local Wing_L = piece 'rig_Raptor_Artillery_Wing_L'
local Wing_R = piece 'rig_Raptor_Artillery_Wing_R'

local smokePiece = {Root, Thorax}

VFS.Include("scripts/include/springtweener.lua")

local scriptEnv = { Root = Root,
					Thorax = Thorax,
					Leg_Front1_L = Leg_Front1_L,
					Leg_Front2_L = Leg_Front2_L,
					Leg_Front3_L = Leg_Front3_L,
					Leg_Middle1_L = Leg_Middle1_L,
					Leg_Middle2_L = Leg_Middle2_L,
					Leg_Middle3_L = Leg_Middle3_L,
					Leg_Back1_L = Leg_Back1_L,
					Leg_Back2_L = Leg_Back2_L,
					Leg_Back3_L = Leg_Back3_L,
					Tail1 = Tail1,
					Tail2 = Tail2,
					Tail3 = Tail3,
					Tail4 = Tail4,
					Tail5 = Tail5,
					Leg_Front1_R = Leg_Front1_R,
					Leg_Front2_R = Leg_Front2_R,
					Leg_Front3_R = Leg_Front3_R,
					Leg_Middle1_R = Leg_Middle1_R,
					Leg_Middle2_R = Leg_Middle2_R,
					Leg_Middle3_R = Leg_Middle3_R,
					Leg_Back1_R = Leg_Back1_R,
					Leg_Back2_R = Leg_Back2_R,
					Leg_Back3_R = Leg_Back3_R,
					Wing_L = Wing_L,
					Wing_R = Wing_R,
                    ---
					rad = math.rad,
					x_axis = x_axis,
					y_axis = y_axis,
					z_axis = z_axis,
					Turn = Turn,
					Move = Move,
					WaitForMove = WaitForMove,
					WaitForTurn = WaitForTurn,
					Sleep = Sleep,
					Show = Show,
					Hide = Hide,
					initTween = initTween,
					---
					Rand = math.random,
					Explode = Spring.UnitScript.Explode,
					sfxShatter = SFX.SHATTER,
					sfxFall = SFX.FALL,
					sfxFire = SFX.FIRE,
					sfxSmoke = SFX.SMOKE,
					sfxExplodeOnHit = SFX.EXPLODE_ON_HIT,
					---
					--stdNanoPieces = pointer,
					--advNanoPieces = advpointer,
					--standardOnlyPieces = { right_arm, left_arm, right_head, left_head },
					--upgradeOnlyPieces = { right_arm_advanced, left_arm_advanced, right_head_advanced, left_head_advanced,
					--					  left_pointer1, left_pointer2, right_pointer1, right_pointer2, antenna_upgrade,
					--					  upgradeR, upgradeL, upgradeR_door, upgradeL_door },
					--explodePartsDefault = { right_arm, left_arm },
					--explodePartsStandard = { left_head, right_head, antenna_axis },
					--explodePartsAdvanced = { upgradeR, upgradeL, upgradeR_door, upgradeL_door },
	--
					ipairs = ipairs,
					unitID = unitID,
					unitDefName = UnitDefs[unitDefID].name,
					UnitScript = UnitScript,
					Spring = Spring,
					COB = COB,
					SFX = SFX,
}

local SIG_WALK = 1
local SIG_AIM = 2

local PlayAnimation = VFS.Include("scripts/animations/raptorartillery_anim.lua", scriptEnv)
--scriptEnv.PlayAnimation = PlayAnimation
--script_create, script_activate, script_deactivate, script_killed, MorphUp, MorphUp2, MorphUp3 = VFS.Include("scripts/include/factory_base.lua", scriptEnv)

local function Walk()
	Signal(SIG_WALK)
	SetSignalMask(SIG_WALK)
	--while true do
		StartThread(PlayAnimation.walk)
	--end
end

local function RestoreLegs()
	Signal(SIG_WALK)
	SetSignalMask(SIG_WALK)
	StartThread(PlayAnimation.restorelegs)
end

local function create()
    --Signal(1) -- Kill any other copies of this thread
    --SetSignalMask(1) -- Allow this thread to be killed by fresh copies
	--StartThread(GG.Script.SmokeUnit, unitID, smokePiece)
    --PlayAnimation.create()
end

function script.Create()
    --StartThread(function ()
    --    initTween({veryLastFrame=36,
    --               [antenna_base]={
    --                   [1]={cmd="move", axis=z_axis, targetValue=15.000000, firstFrame=0, lastFrame=36,},
    --               }
    --    })
    --end)
	StartThread(GG.Script.SmokeUnit, unitID, smokePiece)
end

function script.Activate()
    --StartThread(create)
end

function script.Deactivate()
	--script_deactivate()
end

function script.StartMoving()
	StartThread(Walk)
end

function script.StopMoving()
	StartThread(RestoreLegs)
end

--function script.Killed(recentDamage, maxHealth)
--	script_killed(recentDamage, maxHealth)
--end

-- Assign the desired buildpiece to the variable above
--function script.QueryBuildInfo()
--	if buildPiece then
--		return buildPiece
--	else
--		return base
--	end
--end
