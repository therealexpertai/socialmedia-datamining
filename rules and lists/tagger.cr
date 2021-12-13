//-----PUTIN-----//

SCOPE SENTENCE ON ATOM
{
    TAGGER()
    {
        !PATTERN("\#")
        >>
        @PUTIN[KEYWORD("Poutine", "POUTINE")]|[TEXT]
    }
}

//-----RETWEET-----//

SCOPE SENTENCE
{
    TAGGER()
    {
        @RETWEET[KEYWORD("retweeted")]|[TEXT]
    }
}

SCOPE SENTENCE
{
    TAGGER()
    {
        @RETWEET[KEYWORD("RT")]|[TEXT]
        >>
        KEYWORD("@")
    }
}

//-----FRENCHPOLITICALPARTIES-----//

SCOPE SENTENCE
{
    TAGGER()
    {
        !KEYWORD("@","_","#")
        >>
        @FRENCHPOLITICALPARTIES[KEYWORD(LOAD "french political parties.cl")]
    }
}

//------SNCF(COM)-----//

SCOPE SENTENCE
{
    TAGGER()
    {
        !KEYWORD("#")
        >>
        @sncf[KEYWORD("sncf")]
    }
}

//-----VERLAN-----//

SCOPE SENTENCE
{
    TAGGER()
    {
        @VERLAN[KEYWORD(LOAD "verlan.cl")]
    }
}

//-----COLLOQUIALISMS-----//

SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[KEYWORD(LOAD "colloquial language.cl")]
    }
}

//Example: vous serez heureux d'apprendre que bla bla bla...
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Bb][Ll][Aa][ BbLlaA]*")]
    }
}

//Example: Non franchement je le crois pas pffff
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[P][f]+")]
    }
}

//Example: Oh c'est étonnant!!!!
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Oo]+[Hh]")]
        >>
        !KEYWORD("la", "là", "lala")
    }
}

//Example: Ptdrrr waaaou | Whaou on s'y attendait tellement pas
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Ww][Hh]*[Aa]+[Oo]+[Uu]*")]
    }
}

//Example: Wouah, quelle surprise !!!
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Ww][Oo]+[Uu]+[Aa]+[Hh]+")]
    }
}

//Example: Naaan tkt
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Nn][Aa]+[Nn]")]
    }
}

//Example: Trop cool!
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Cc][Oo][Oo]+[Ll]")]
    }
}

//Example: Poutine réélu, je ne m'y attendais pas du tout c'est un choc lol
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Ll][Oo]+[Ll]")]
    }
}

//Example: Ta bien fait de pas venir mais yeah ca va
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Yy][Ee][Aa][Hh]+")]
    }
}

//Example: Go y aller | GO GO GO LES BLEUS
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("([Gg][Oo])+")]
        >>
        !KEYWORD("y aller")
        OR
        @COLLOQUIALISM[PATTERN("([Gg][Oo])+")]|[SEQUENCE]
        >>
        KEYWORD("y aller")
    }
}

//Example: Il fait ce qu'il veut et quand il veut ah ah
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Aa][Hh](\s[Aa][Hh])+")]
    }
}

//Example: Poutine «réélu». Ahah.
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Aa][Hh][AaHh]+")]
    }
}

//Example: Wahahahahahaha jsui en larme
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Ww][Aa][Hh][AaHh]+")]
    }
}

//Example: Hahaha les poutinolatres qui comparent avec #Macron. | Pouhahaha
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Mm]*[Pp]*[OoUu]*[Hh][Aa][HhAa]+")]
    }
}

//Example: jfai + confiance a ma mere huahuahua
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Hh][Uu][Aa][HhUuAa]+")]
    }
}

//Example: Ouah on est tous étonnés
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[PATTERN("[Oo][Uu][Aa]+[Hh]+")]
    }
}

//Example: eh oh les grèves de 2jours tout les 5jours de la sncf c'était une blague ou pas??? | Eh oui, pour moi, c'est Noël.
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[KEYWORD("eh")]
        >>
        !KEYWORD("oh", "ben")
        OR
        @COLLOQUIALISM[KEYWORD("eh")]|[#1]
        >>
        @COLLOQUIALISM[KEYWORD("oh")]|[#2]
    }
}

//Example: Hahahahahahahaha pourquoi vous savez que danser de cette manière purée
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[KEYWORD("Puré", "Purée")]
    }
}

//Example: ouais la Russie est un pays démocratique !!!
SCOPE SENTENCE
{
    TAGGER()
    {
        !KEYWORD("bah", "ben")
        >>
        @COLLOQUIALISM[KEYWORD("ouais")]
    }
}

//Example: Bah heureusement qu'on a nos superbes observateurs
SCOPE SENTENCE
{
    TAGGER()
    {
        !KEYWORD("bon")
        >>
        @COLLOQUIALISM[KEYWORD("bah")]
        >>
        !KEYWORD("ouais")
    }
}

//Example: Bah ouais là ça taf dure
SCOPE SENTENCE
{
    TAGGER()
    {
        @COLLOQUIALISM[KEYWORD("bah", "ben")]|[#1]
        >>
        @COLLOQUIALISM[KEYWORD("ouais", "oui")]|[#2]
    }
}

//Example: AAAAaaahhhhhhh !!!
SCOPE SENTENCE
{
    TAGGER()
    {
        !KEYWORD("ah")
        >>
        @COLLOQUIALISM[PATTERN("[Aa]+[Hh]+")]
        >>
        !KEYWORD("la la", "lala", "là là", "bon", "ben", "ah", "bah")
    }
}

//Example: @France24_fr Ah bon???
SCOPE SENTENCE
{
    TAGGER()
    {
        !KEYWORD("ah")
        >>
        @COLLOQUIALISM[PATTERN("[Aa]+[Hh]+")]|[#1]
        >>
        @COLLOQUIALISM[KEYWORD("bon", "ben", "bah")]|[#2]
    }
}

//-----ABBREVIATIONS-----//

//Example: le we s'est bien passé ?
SCOPE SENTENCE
{
    TAGGER()
    {
        KEYWORD("mon", "ton", "son", "notre", "votre", "leur", "ce", "le", "bon")
        >>
        @ABBREVIATION[KEYWORD("we")]
    }
}

//Example: ça dérange personne mdrrr
SCOPE SENTENCE
{
    TAGGER()
    {
        @ABBREVIATION[PATTERN("[Mm][Dd]+[Rr]+")]
    }
}

//Example: non a la privatisation d la sncf // preposition "de" without "e" -> d
SCOPE SENTENCE
{
    TAGGER()
    {
        !KEYWORD("c", "t")
        >>
        @ABBREVIATION[KEYWORD("d")]
        >>
        !PATTERN("'", "r")
        >>
        PATTERN("[bcdfgjklmnpqrstvwxzBCDFGJKLMNPQRSTVWXZ]{1}\w+")
    }
}

SCOPE SENTENCE
{
    TAGGER()
    {
        !KEYWORD("@")
        >>
        @ABBREVIATION[KEYWORD(LOAD "abbreviations.cl")]
    }
}

//Example: xptdddddrr des scores de soviétiques dans un pays du g8
SCOPE SENTENCE
{
    TAGGER()
    {
        @ABBREVIATION[PATTERN("[Xx]*[Pp][Tt][Dd]+[Rr]+")]
    }
}

//Example: Oommmggg!!! Quelle surprise!
SCOPE SENTENCE
{
    TAGGER()
    {
        @ABBREVIATION[PATTERN("[Oo]+[Mm]+[Gg]+")]
    }
}

//Example: Hmm. Je vois.
SCOPE SENTENCE
{
    TAGGER()
    {
        @ABBREVIATION[PATTERN("[HhMm][HhMm]+")]
    }
}

//Example: Huuuummm, la Russie laisse faire vous ne trouvez pas ça bizarre ?
SCOPE SENTENCE
{
    TAGGER()
    {
        @ABBREVIATION[PATTERN("[HhUuMm][HhUuMm]+")]
    }
}

//Example: via @BFMTV
SCOPE SENTENCE
{
    TAGGER()
    {
        @USER[PATTERN("@\w+")]
    }
}
