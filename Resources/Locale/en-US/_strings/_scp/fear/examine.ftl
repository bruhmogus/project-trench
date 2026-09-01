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
examine-fear-state-none-dead = [color=lightblue]{ CAPITALIZE(gender-based-third-form) } выглядит спокойно, словно смерть пришла неожиданно[/color]
examine-fear-state-anxiety-dead = [color=lightblue]В { gender-based-third-form-case } потухших глазах застыл последний встревоженный взгляд, смотрящий в вашу, еще живую, душу[/color]
examine-fear-state-fear-dead = [color=lightblue]В { gender-based-third-form-case } широко открытых глазах впечаталось осознанное мгновение, ставшее для него последним[/color]
examine-fear-state-terror-dead = [color=lightblue]{ CAPITALIZE(gender-based-third-form-case) } рот застыл в беззвучном вопле, а глаза смотрят в пустоту, которую никто не должен был увидеть[/color]
