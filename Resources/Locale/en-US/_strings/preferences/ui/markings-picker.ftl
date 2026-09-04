markings-search = Search
-markings-selection = { $selectable ->
    [0] You have no markings remaining.
    [one] You can select one more marking.
   *[other] You can select { $selectable } more markings.
}
markings-limits = { $required ->
    [true] { $count ->
        [-1] Select at least one marking.
        [0] You cannot select any markings, but somehow, you have to? This is a bug.
        [one] Select one marking.
       *[other] Select at least one marking and up to {$count} markings. { -markings-selection(selectable: $selectable) }
    }
   *[false] { $count ->
        [-1] Select any number of markings.
        [0] You cannot select any markings.
        [one] Select up to one marking.
       *[other] Select up to {$count} markings. { -markings-selection(selectable: $selectable) }
    }
}
markings-reorder = Reorder markings

humanoid-marking-modifier-respect-limits = Respect limits
humanoid-marking-modifier-respect-group-sex = Respect group & sex restrictions
humanoid-marking-modifier-base-layers = Base layers
humanoid-marking-modifier-enable = Enable
humanoid-marking-modifier-prototype-id = Prototype id:

# Categories

markings-organ-Torso = Torso
markings-organ-Head = Head
markings-organ-ArmLeft = Left Arm
markings-organ-ArmRight = Right Arm
markings-organ-HandRight = Right Hand
markings-organ-HandLeft = Left Hand
markings-organ-LegLeft = Left Leg
markings-organ-LegRight = Right Leg
markings-organ-FootLeft = Left Foot
markings-organ-FootRight = Right Foot
markings-organ-Eyes = Eyes

markings-layer-Special = Special
markings-layer-Tail = Tail
markings-layer-Tail-Moth = Wings
markings-layer-Hair = Hair
markings-layer-FacialHair = Facial Hair
markings-layer-UndergarmentTop = Undershirt
markings-layer-UndergarmentBottom = Underpants
markings-layer-Chest = Chest
markings-layer-Head = Head
markings-layer-Snout = Snout
markings-layer-SnoutCover = Snout (Cover)
markings-layer-HeadSide = Head (Side)
markings-layer-HeadTop = Head (Top)
markings-layer-Eyes = Eyes
markings-layer-RArm = Right Arm
markings-layer-LArm = Left Arm
markings-layer-RHand = Right Hand
markings-layer-LHand = Left Hand
markings-layer-RLeg = Right Leg
markings-layer-LLeg = Left Leg
markings-layer-RFoot = Right Foot
markings-layer-LFoot = Left Foot
markings-layer-Overlay = Overlay
markings-layer-TailOverlay = Overlay
# [AUTO_EN]
markings-used = Used markings
# [AUTO_EN]
markings-unused = Unused markings
# [AUTO_EN]
markings-add = Add a line
# [AUTO_EN]
markings-remove = Remove line
# [AUTO_EN]
markings-rank-up = Up
# [AUTO_EN]
markings-rank-down = Down
# [AUTO_EN]
marking-points-remaining = Points remaining: { $points }
marking-used = { $marking-name }
# [AUTO_EN]
marking-used-forced = { $marking-name } (Forced)
# [AUTO_EN]
marking-slot-add = Add
# [AUTO_EN]
marking-slot-remove = Remove
# [AUTO_EN]
marking-slot = Slot { $number }
# [AUTO_EN]
markings-category-Special = Special
# [AUTO_EN]
markings-category-Hair = Hairstyle
# [AUTO_EN]
markings-category-FacialHair = Facial Hair
# [AUTO_EN]
markings-category-Head = Head
# [AUTO_EN]
markings-category-HeadTop = Head (top)
# [AUTO_EN]
markings-category-HeadSide = Head (side)
# [AUTO_EN]
markings-category-Snout = Snout
# [AUTO_EN]
markings-category-UndergarmentTop = Undergarment Tops
# [AUTO_EN]
markings-category-UndergarmentBottom = Undergarment Bottom
# [AUTO_EN]
markings-category-Chest = Chest
# [AUTO_EN]
markings-category-Arms = Hands
# [AUTO_EN]
markings-category-Legs = Legs
# [AUTO_EN]
markings-category-Tail = Tail
# [AUTO_EN]
markings-category-Overlay = Overlay
# [AUTO_EN]
markings-category-Back = Back
