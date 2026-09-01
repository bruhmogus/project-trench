# [AUTO_EN]
reagent-effect-condition-guidebook-total-damage =
    { $max ->
        [2147483648] the body has at least { NATURALFIXED($min, 2) } total damage
       *[other]
            { $min ->
                [0] has no more than { NATURALFIXED($max, 2) } total damage
               *[other] has between { NATURALFIXED($min, 2) } and { NATURALFIXED($max, 2) } total damage
            }
    }
# [AUTO_EN]
reagent-effect-condition-guidebook-total-hunger =
    { $max ->
        [2147483648] the target has at least { NATURALFIXED($min, 2) } total hunger
       *[other]
            { $min ->
                [0] the target has no more than { NATURALFIXED($max, 2) } total hunger
               *[other] the target has between  { NATURALFIXED($min, 2) } and { NATURALFIXED($max, 2) } total hunger
            }
    }
# [AUTO_EN]
reagent-effect-condition-guidebook-reagent-threshold =
    { $max ->
        [2147483648] there is at least { NATURALFIXED($min, 2) } unit of { $reagent } in the circulatory system
       *[other]
            { $min ->
                [0] there is no more than { NATURALFIXED($max, 2) } unit of { $reagent }
               *[other] there is between { NATURALFIXED($min, 2) } unit of and { NATURALFIXED($max, 2) } unit of { $reagent }
            }
    }
# [AUTO_EN]
reagent-effect-condition-guidebook-mob-state-condition = patient in { $state }
# [AUTO_EN]
reagent-effect-condition-guidebook-job-condition = target job - { $job }
# [AUTO_EN]
reagent-effect-condition-guidebook-solution-temperature =
    the solution temperature is { $max ->
        [2147483648] at least { NATURALFIXED($min, 2) }K
       *[other]
            { $min ->
                [0] at most { NATURALFIXED($max, 2) }K
               *[other] between { NATURALFIXED($min, 2) }K and { NATURALFIXED($max, 2) }K
            }
    }
# [AUTO_EN]
reagent-effect-condition-guidebook-body-temperature =
    body temperature is { $max ->
        [2147483648] at least { NATURALFIXED($min, 2) }k
       *[other]
            { $min ->
                [0] at most { NATURALFIXED($max, 2) }k
               *[other] between { NATURALFIXED($min, 2) }k and { NATURALFIXED($max, 2) }k
            }
    }
# [AUTO_EN]
reagent-effect-condition-guidebook-organ-type =
    metabolizing organ { $shouldhave ->
        [true] is
       *[false] is not
    } { $name } organ
# [AUTO_EN]
reagent-effect-condition-guidebook-has-tag =
    goal { $invert ->
        [true] does not have
       *[false] has
    } tag { $tag }
# [AUTO_EN]
reagent-effect-condition-guidebook-this-reagent = this reagent
