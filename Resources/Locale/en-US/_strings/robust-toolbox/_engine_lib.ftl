# Used internally by the THE() function.
zzzz-the =
    { PROPER($ent) ->
       *[false] the { $ent }
        [true] { $ent }
    }
# Used internally by the SUBJECT() function.
# [AUTO_EN]
zzzz-subject-pronoun =
    { GENDER($ent) ->
        [male] he
        [female] she
        [epicene] they
       *[neuter] it
    }
# Used internally by the OBJECT() function.
# [AUTO_EN]
zzzz-object-pronoun =
    { GENDER($ent) ->
        [male] his
        [female] her
        [epicene] their
       *[neuter] its
    }
# Used internally by the POSS-PRONOUN() function.
# [AUTO_EN]
zzzz-possessive-pronoun =
    { GENDER($ent) ->
        [male] his
        [female] her
        [epicene] their
       *[neuter] its
    }
# Used internally by the POSS-ADJ() function.
# [AUTO_EN]
zzzz-possessive-adjective =
    { GENDER($ent) ->
        [male] his
        [female] her
        [epicene] their
       *[neuter] its
    }
# Used internally by the REFLEXIVE() function.
# [AUTO_EN]
zzzz-reflexive-pronoun =
    { GENDER($ent) ->
        [male] self
        [female] herself
        [epicene] themselves
       *[neuter] self
    }
# Used internally by the CONJUGATE-BE() function.
zzzz-conjugate-be =
    { GENDER($ent) ->
        [epicene] are
       *[other] is
    }
# Used internally by the CONJUGATE-HAVE() function.
# [AUTO_EN]
zzzz-conjugate-have =
    { GENDER($ent) ->
        [epicene] have
       *[other] has
    }
# Used internally by the CONJUGATE-BASIC() function.
zzzz-conjugate-basic =
    { GENDER($ent) ->
        [epicene] { $first }
       *[other] { $second }
    }
