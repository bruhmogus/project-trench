examine-fear-state-anxiety = [color=lightblue]{ CAPITALIZE(gender-based-third-form) } looks anxious[/color]
examine-fear-state-fear = [color=lightblue]{ CAPITALIZE(gender-based-third-form-case) }'s eyes look fearful[/color]
examine-fear-state-terror = [color=lightblue]{ CAPITALIZE(gender-based-third-form) } seems insane![/color]
gender-based-third-form =
    { GENDER($target) ->
        [male] he
        [female] she
        [epicene] they
       *[neuter] it
    }
gender-based-third-form-case =
    { GENDER($target) ->
        [male] his
        [female] her
        [epicene] their
       *[neuter] its
    }
# [AUTO_EN]
examine-fear-state-none-dead = [color=lightblue]{ CAPITALIZE(gender-based-third-form) } looks calm, as if death came unexpectedly[/color]
# [AUTO_EN]
examine-fear-state-anxiety-dead = [color=lightblue]In { gender-based-third-form-case } extinguished eyes, the last worried gaze froze, looking into your, still living, soul[/color]
# [AUTO_EN]
examine-fear-state-fear-dead = [color=lightblue]In { gender-based-third-form-case } wide-open eyes, a conscious moment slammed in, becoming his last[/color]
# [AUTO_EN]
examine-fear-state-terror-dead = [color=lightblue]{ CAPITALIZE(gender-based-third-form-case) } the mouth froze in a silent scream, and the eyes gazed into the void that no one should have seen[/color]
