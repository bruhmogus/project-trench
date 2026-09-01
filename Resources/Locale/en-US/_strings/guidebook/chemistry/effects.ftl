reagent-effect-guidebook-cause-flesh-cultist-infection =
    { $chance ->
        [1] Causes
       *[other] cause
    } flesh cultist infection
# [AUTO_EN]
second = { $count ->
    [one] second
    [few] seconds
    [many] seconds
    *[other] seconds
    }
# [AUTO_EN]
dead = { $count ->
    [one] dead
    [few] dead
    [many] dead
    *[other] dead
    }
# [AUTO_EN]
reagent-effect-guidebook-create-entity-reaction-effect =
    { $chance ->
        [1] Creates
       *[other] create
    } { $amount ->
        [1] { $entname }
       *[other] { $amount } { $entname }
    }
# [AUTO_EN]
reagent-effect-guidebook-explosion-reaction-effect =
    { $chance ->
        [1] Causes
       *[other] cause
    } an explosion
# [AUTO_EN]
reagent-effect-guidebook-emp-reaction-effect =
    { $chance ->
        [1] Causes
       *[other] cause
    } an electromagnetic pulse
# [AUTO_EN]
reagent-effect-guidebook-flash-reaction-effect =
    { $chance ->
        [1] Causes
       *[other] caused
    } a blinding flash
    </text>
# [AUTO_EN]
reagent-effect-guidebook-foam-area-reaction-effect =
    { $chance ->
        [1] Creates
       *[other] create
    } a large amount of foam
# [AUTO_EN]
reagent-effect-guidebook-smoke-area-reaction-effect =
    { $chance ->
        [1] Creates
       *[other] create
    } a large amount of smoke
# [AUTO_EN]
reagent-effect-guidebook-satiate-thirst =
    { $chance ->
        [1] Quenches
       *[other] quench
    } { $relative ->
        [1] thirst moderately
       *[other] thirst by { NATURALFIXED($relative, 3) }x of normal
    }
# [AUTO_EN]
reagent-effect-guidebook-satiate-hunger =
    { $chance ->
        [1] Satiates
       *[other] Satiates
    } { $relative ->
        [1] hunger moderate
       *[other] hunger at { NATURALFIXED($relative, 3) }x of normal
    }
# [AUTO_EN]
reagent-effect-guidebook-health-change =
    { $chance ->
        [1]
            { $healsordeals ->
                [heals] Heals
                [deals] Deals
               *[both] Changes health to
            }
       *[other]
            { $healsordeals ->
                [heals] heal
                [deals] deal
               *[both] change health to
            }
    } { $changes }
# [AUTO_EN]
reagent-effect-guidebook-status-effect =
    { $type ->
        [add]
            { $chance ->
                [1] Causes
               *[other] cause
            } { LOC($key) } for at least { NATURALFIXED($time, 3) }, the effect stacks
       *[set]
            { $chance ->
                [1] Causes
               *[other] cause
            } { LOC($key) } for at least { NATURALFIXED($time, 3) }, the effect does not stack
        [remove]
            { $chance ->
                [1] Removes
               *[other] remove
            } { NATURALFIXED($time, 3) } from { LOC($key) }
    }
# [AUTO_EN]
reagent-effect-guidebook-activate-artifact =
    { $chance ->
        [1] Attempts
       *[other] Attempt
    } to activate an artifact
# [AUTO_EN]
reagent-effect-guidebook-set-solution-temperature-effect =
    { $chance ->
        [1] Sets
       *[other] set
    } the solution temperature precisely { NATURALFIXED($temperature, 2) }k
# [AUTO_EN]
reagent-effect-guidebook-adjust-solution-temperature-effect =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Adds
               *[-1] Removes
            }
       *[other]
            { $deltasign ->
                [1] add
               *[-1] remove
            }
    } heat from the solution until the temperature reaches { $deltasign ->
        [1] no more than { NATURALFIXED($maxtemp, 2) }k
       *[-1] no less than { NATURALFIXED($mintemp, 2) }k
    }
# [AUTO_EN]
reagent-effect-guidebook-adjust-reagent-reagent =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Adds
               *[-1] Removes
            }
       *[other]
            { $deltasign ->
                [1] adds
               *[-1] removes
            }
    } { NATURALFIXED($amount, 2) } units from { $reagent } { $deltasign ->
        [1] to
       *[-1] from
    } solution
# [AUTO_EN]
reagent-effect-guidebook-adjust-reagent-group =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Adds
               *[-1] Removes
            }
       *[other]
            { $deltasign ->
                [1] add
               *[-1] remove
            }
    } { NATURALFIXED($amount, 2) } units of reagents in the group { $group } { $deltasign ->
        [1] to
       *[-1] from
    } solution
# [AUTO_EN]
reagent-effect-guidebook-adjust-temperature =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Add
               *[-1] Remove
            }
       *[other]
            { $deltasign ->
                [1] add
               *[-1] remove
            }
    } { POWERJOULES($amount) } of heat { $deltasign ->
        [1] to the body
       *[-1] from the body
    }, in which it is metabolized
# [AUTO_EN]
reagent-effect-guidebook-chem-cause-disease =
    { $chance ->
        [1] Causes
       *[other] cause
    } disease { $disease }
# [AUTO_EN]
reagent-effect-guidebook-chem-cause-random-disease =
    { $chance ->
        [1] Causes
       *[other] cause
    } disease { $diseases }
reagent-effect-guidebook-jittering =
    { $chance ->
        [1] Вызывает
       *[other] вызывают
    } тряску
# [AUTO_EN]
reagent-effect-guidebook-chem-clean-bloodstream =
    { $chance ->
        [1] Cleans
       *[other] clean
    } the bloodstream of other substances
# [AUTO_EN]
reagent-effect-guidebook-cure-disease =
    { $chance ->
        [1] Cures
       *[other] cure
    } disease
# [AUTO_EN]
reagent-effect-guidebook-cure-eye-damage =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Inflicts
               *[-1] Cures
            }
       *[other]
            { $deltasign ->
                [1] inflict
               *[-1] cure
            }
    } eye damage
# [AUTO_EN]
reagent-effect-guidebook-chem-vomit =
    { $chance ->
        [1] Causes
       *[other] cause
    } vomiting
# [AUTO_EN]
reagent-effect-guidebook-create-gas =
    { $chance ->
        [1] Creates
       *[other] create
    } { $moles } { $moles ->
        [1] mole
       *[other] moles
    } of gas { $gas }
# [AUTO_EN]
reagent-effect-guidebook-drunk =
    { $chance ->
        [1] Causes
       *[other] cause
    } intoxication
# [AUTO_EN]
reagent-effect-guidebook-electrocute =
    { $chance ->
        [1] Stuns
       *[other] stun
    } consumed within { NATURALFIXED($time, 3) }
# [AUTO_EN]
reagent-effect-guidebook-extinguish-reaction =
    { $chance ->
        [1] Extinguishes
       *[other] extinguish
    } fire
# [AUTO_EN]
reagent-effect-guidebook-flammable-reaction =
    { $chance ->
        [1] Increases
       *[other] increase
    } flammability
# [AUTO_EN]
reagent-effect-guidebook-ignite =
    { $chance ->
        [1] Ignites
       *[other] ignite
    } user
# [AUTO_EN]
reagent-effect-guidebook-make-sentient =
    { $chance ->
        [1] Makes
       *[other] make
    } the consumed one sentient
# [AUTO_EN]
reagent-effect-guidebook-make-polymorph =
    { $chance ->
        [1] Turns
       *[other] turn
    } the one who consumed { $entityname }
# [AUTO_EN]
reagent-effect-guidebook-modify-bleed-amount =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Increases
               *[-1] Decreases
            }
       *[other]
            { $deltasign ->
                [1] increase
               *[-1] decrease
            }
    } bleeding
# [AUTO_EN]
reagent-effect-guidebook-modify-blood-level =
    { $chance ->
        [1]
            { $deltasign ->
                [1] Increases
               *[-1] Decreases
            }
       *[other]
            { $deltasign ->
                [1] increase
               *[-1] decrease
            }
    } blood level in the body
# [AUTO_EN]
reagent-effect-guidebook-paralyze =
    { $chance ->
        [1] Paralyzes
       *[other] paralyze
    } consumed for a minimum of { NATURALFIXED($time, 3) }
# [AUTO_EN]
reagent-effect-guidebook-movespeed-modifier =
    { $chance ->
        [1] Makes
       *[other] make
    } movement speed { NATURALFIXED($walkspeed, 3) }x from standard, at least { NATURALFIXED($time, 3) }
# [AUTO_EN]
reagent-effect-guidebook-reset-narcolepsy =
    { $chance ->
        [1] Prevents
       *[other] prevent
    } narcolepsy attacks
# [AUTO_EN]
reagent-effect-guidebook-wash-cream-pie-reaction =
    { $chance ->
        [1] Washes off
       *[other] wash off
    } the cream pie from their face
# [AUTO_EN]
reagent-effect-guidebook-cure-zombie-infection =
    { $chance ->
        [1] Cures
       *[other] cure
    } zombie virus
# [AUTO_EN]
reagent-effect-guidebook-cause-zombie-infection =
    { $chance ->
        [1] Infects
       *[other] infects
    } person with zombie virus}
# [AUTO_EN]
reagent-effect-guidebook-reduce-rotting =
    { $chance ->
        [1] Regenerates
       *[other] regenerate
    } { NATURALFIXED($time, 3) } { MANY("second", $time) } of rotting
# [AUTO_EN]
reagent-effect-guidebook-innoculate-zombie-infection =
    { $chance ->
        [1] Cures
       *[other] cure
    } the zombie virus and provides immunity to it in the future
# [AUTO_EN]
reagent-effect-guidebook-area-reaction =
    { $chance ->
        [1] Causes
       *[other] cause
    } a smoke or foam reaction on { NATURALFIXED($duration, 3) } { MANY("second", $duration) }
# [AUTO_EN]
reagent-effect-guidebook-add-to-solution-reaction =
    { $chance ->
        [1] Forces
       *[other] force
    } chemicals applied to the object to be added to the object's internal solution container.
# [AUTO_EN]
reagent-effect-guidebook-plant-attribute =
    { $chance ->
        [1] Changes
       *[other] change
    } { $attribute } for [color={ $colorName }]{ $amount }[/color]
# [AUTO_EN]
reagent-effect-guidebook-plant-cryoxadone =
    { $chance ->
        [1] rejuvenates
       *[other] rejuvenate
    } the plant, depending on the age of the plant and the time of its growth.
# [AUTO_EN]
reagent-effect-guidebook-plant-phalanximine =
    { $chance ->
        [1] Restores
       *[other] restore
    } the viability of a plant that has become non-viable as a result of a mutation.
# [AUTO_EN]
reagent-effect-guidebook-plant-diethylamine =
    { $chance ->
        [1] Increases
       *[other] increase
    } the plant's lifespan and/or base health with a 10% chance per point.
# [AUTO_EN]
reagent-effect-guidebook-plant-robust-harvest =
    { $chance ->
        [1] Increases
       *[other] increase
    } plant potency by { $increase } to a maximum of { $limit }. This causes the plant to lose its seeds when potency reaches { $seedlesstreshold }. Attempting to increase potency beyond { $limit } may reduce yield with a 10% probability.
# [AUTO_EN]
reagent-effect-guidebook-plant-seeds-add =
    { $chance ->
        [1] Restores
       *[other] restores
    } plant seeds
# [AUTO_EN]
reagent-effect-guidebook-plant-seeds-remove =
    { $chance ->
        [1] Removes
       *[other] removes
    } plant seeds
