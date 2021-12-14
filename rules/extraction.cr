//SCOPE SENTENCE
//{
//    IDENTIFY(TEST)
//    {
//        @FIELD1[TYPE(NPH, NPR)]
//    }
//}


//-----COLLOQUIALISMS-----//

//Example: elle est archi chill | Oulà! C'est peu!
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[TAG(COLLOQUIALISM) - TAG(USER)]|[TEXT]
    }
}

//Example: personne vous suce
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[SYNCON(89461)]//@SYN: #89461# [sucer]
    }
}

//Example: M. Myard se contrefiche de l'avis des Ukrainiens
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[TYPE(PRO)]|[SEQUENCE]
        <:2>
        LEMMA("ficher","contrefiche")
        >
        TYPE(PRE)
    }
}

//Example: Je m'en tape grave de ce match.
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[ROLE(SUBJECT) - KEYWORD("qui")]|[SEQUENCE]
        >>
        TYPE(PRO)
        <:2>
        LEMMA("foutre", "taper")
        <:2>
        TYPE(PRE)
    }
}

//Example: ils sont déjà limite en tout alors ça va là
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("à la","aucun","aucune","de","des","certains","certaines","une","telle")
        <:1>
        @COLLOQUIALISM[KEYWORD("limite","limites") - TYPE (VER,NOU)]
        OR
        LEMMA("être")
        >
        @COLLOQUIALISM[KEYWORD("limite","limites") + TYPE (NOU)]
        OR
        TYPE (VER) -LEMMA("être")
        >>
        @COLLOQUIALISM[KEYWORD("limite","limites") + TYPE (NOU)]
        OR
        @COLLOQUIALISM[KEYWORD("limite","limites") + TYPE (NOU) + POSITION(BEGIN SENTENCE)]
    }
}

//Example: L'Arabie-Saoudite massacre les civils au #Yemen, on s'en fout
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[ROLE(SUBJECT)]|[SEQUENCE]
        >>
        TYPE(PRO)
        <:2>
        LEMMA("foutre")
        >
        !TYPE(PRE)
    }
}

//Example: Rien à foutre de l'OM, fallait battre les russes
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("en")
        >>
        @COLLOQUIALISM[LEMMA("foutre")]
        <:3>
        !KEYWORD("de", "des", "trouille")
    }
}

//Example: la France d'en bas doit se taper les trajets en voiture à 80km/h
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("me", "te", "t'", "se", "s'", "nous", "vous")]|[#1]
        <:3>
        @COLLOQUIALISM[LEMMA("taper") - POSITION(END SENTENCE)]|[#2]
        >>
        !KEYWORD("dessus")
        >>
        !TYPE(PRE)
    }
}

//Example: Rien à foutre de l'OM
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[ROLE(SUBJECT)]|[SEQUENCE]
        >>
        !KEYWORD("me", "te", "se", "nous", "vous")
        <:2>
        LEMMA("foutre")
        <:2>
        TYPE(PRE)
    }
}

//Example: on s en bat les reins.
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("m","t","s","nous","vous")]|[SEQUENCE]
        >
        KEYWORD("en")
        <:3>
        LEMMA ("rein")
    }
}

//Example: Ptdr jcrois y'a rien de pire que les contrôleurs SNCF désagréables.
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("il")
        <:3>
        @COLLOQUIALISM[KEYWORD("y'a","y a", "ya")]
        <:4>
        !KEYWORD("il")
        >>
        !TYPE(VER)
    }
}

//Example: #Macron c'est le pompon
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("ce", "c", "c'", "ça")]|[SEQUENCE]
        >>
        LEMMA("être")
        <:2>
        KEYWORD("pompon")
    }
}

//Example: Il y'a élection et élection ...
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("il")]|[#1]
        >>
        @COLLOQUIALISM[KEYWORD("y'a", "ya")]|[#2]
    }
}

//Example: Coïncidence ? Je n'crois pas ??
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[PATTERN("n'[bcdfghjklmnpqrstvwxyz]\w+")]
    }
}

//Example: Ma mère elle parle russe moi aussi faut que je sois bilingue
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("il")
        <:2>
        @COLLOQUIALISM[KEYWORD("faut","fallait","faudrait","faudra")]|[#1]
        >>
        @COLLOQUIALISM[PATTERN("\w+")]|[TOKEN#2]
    }
}

//Example: vu les grèves sncf va falloir que jtrouve un logement d'urgence
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("il")
        >
        @COLLOQUIALISM[TYPE(VER)]|[#1]
        >
        @COLLOQUIALISM[KEYWORD("falloir", "fallu")]|[#2]
    }
}

//Example: je dois attendre Octobre du coup.
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("du coup")]
    }
}

//Example: Cette élection, c'est une vaste blague !
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("c'")]|[SEQUENCE]
        <:3>
        LEMMA("vaste")
        >>
        LEMMA("blague")
    }
}

//Example: vous faites crari
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[LEMMA("faire")]|[BASE#1]
        >>
        @COLLOQUIALISM[KEYWORD("crari")]|[#2]
    }
}

//Example: c'est un beau gosse
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[LEMMA("beau")]|[#1]
        >>
        @COLLOQUIALISM[LEMMA("gosse")]|[#2]
    }
}

//Example: @EmmanuelMacron C'est n'importe quoi.
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        LEMMA("être", "dire", "raconter", "devenir")
        <:2>
        @COLLOQUIALISM[KEYWORD("n'importe quoi")]
    }
}

//Example: Bah, n'importe quoi
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        TYPE(PNT) - KEYWORD(".")
        >>
        @COLLOQUIALISM[KEYWORD("n'importe quoi")]
    }
}

//Example: @leJDD N'importe quoi!
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("N'importe quoi")]
    }
}

//Example: on dirait des gosses de 5ans
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !LEMMA("beau")
        >>
        @COLLOQUIALISM[LEMMA("gosse")]
    }
}

//Example: Bon, on est reparti
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("bon") + POSITION (BEGIN SENTENCE)]
        >>
        !KEYWORD("ben","bah")
        >>
        !TYPE(NOU, ADJ) - PATTERN("[0-9]")
        OR
        TYPE (PNT) - KEYWORD(".")
        >>
        @COLLOQUIALISM[KEYWORD("bon")]
        >>
        !KEYWORD("ben","bah")
        >>
        !TYPE(NOU, ADJ)
    }
}

//Example: Ce serait un bon début. Mais bon, ce n'est pas prévu
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        KEYWORD("mais", "donc")
        >>
        @COLLOQUIALISM[KEYWORD("bon")]
        >>
        !KEYWORD("ben","bah")
        >>
        !TYPE(NOU, ADJ)
    }
}

//Example: bon bah je vais pas rentrer pendant 3mois
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("bon")]|[#1]
        >>
        @COLLOQUIALISM[KEYWORD("bah")]|[#2]
    }
}

//Example: Ben voyons...
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("bon", "ah", "eh", "et")
        >>
        @COLLOQUIALISM[KEYWORD("ben")]
    }
}

//Example: #Russie Bon ben va falloir vérifier d'où ça sort ça...
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("bon", "eh", "et")]|[#1]
        >>
        @COLLOQUIALISM[KEYWORD("ben")]|[#2]
    }
}

//Example: Ça alors, pour une suprise !
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("tout")
        >>
        @COLLOQUIALISM[KEYWORD("ça")]|[#1]
        >>
        @COLLOQUIALISM[KEYWORD("alors")]|[#2]
    }
}

//Example: Le con ça ose tout...
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("à la")
        >>
        @COLLOQUIALISM[LEMMA("con")]
    }
}

//Example: avec un sourire à la con 
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("à la con")]
    }
}

//Example: Suuuuurrrpprrriiiiise !!!
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("?")
        >>
        @COLLOQUIALISM[PATTERN("!!+")]
        >>
        !KEYWORD("?")
    }
}

//Example: Vraiment???
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("#","!")
        >>
        @COLLOQUIALISM[PATTERN("\?\?+")]
        >>
        !KEYWORD("!")
    }
}

//Example: Seulement ?!
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[PATTERN("[!]+[\?]+")]
        OR
        @COLLOQUIALISM[PATTERN("[\?]+[!]+")]
    }
}

//Example: Se bourrer au vin, cela fait mal à la tête
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[LEMMA ("bourrer") + SYNCON(72554)]//@SYN: #72554# [enivrer]
        <:2>
        !KEYWORD("gueule")
    }
}

//Example: On s'est bourrés la gueule
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[ROLE(SUBJECT)]|[SEQUENCE]
        <:3>
        LEMMA("bourrer")
        <:2>
        KEYWORD("gueule")
    }
}

//Example: Il a pas fini de vous casser le cul
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[LEMMA("casser","branler")]|[SEQUENCE]
        <:2>
        KEYWORD("couilles", "cul", "gueule")
    }
}

//Example: il a les couilles que vous n'avez pas
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !LEMMA("casser","branler")
        <:2>
        @COLLOQUIALISM [KEYWORD("couilles", "cul")]
    }
}

//Example:tu fermes bien gentiment ta grande gueule hein...
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[LEMMA("fermer")]|[SEQUENCE]
        <>
        KEYWORD("gueule", "gueules")
    }
}

//Example: Tu peux arrêter de te foutre de la gueule du monde @JRochedy ??
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !LEMMA("fermer", "bourrer", "casser")
        <>
        !KEYWORD("ta", "grande", "grosse")
        >>
        @COLLOQUIALISM[KEYWORD("gueule", "gueules")]
    }
}

//Example: Ta gueule!
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !LEMMA("fermer")
        <>
        @COLLOQUIALISM[KEYWORD("ta gueule", "ta grande gueule")]
    }
}

//Example: à la bourre !!
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("à la bourre")]
    }
}

//Example: il emmerde grave l'Europe
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        TYPE(VER)- LEMMA("être","taper")
        >>
        @COLLOQUIALISM[PATTERN("gra+ve")]
    }
}

//Example: Le reportage est grave orienté
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        LEMMA("être")
        >>
        @COLLOQUIALISM[PATTERN("gra+ve")]
        >>
        TYPE(ADJ)
    }
}

//Example: grave hâte d'être récompensé
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !TYPE(VER)
        >>
        @COLLOQUIALISM[PATTERN("gra+ve")]
        >>
        TYPE(ADJ)
        OR
        !TYPE(VER)
        >>
        @COLLOQUIALISM[PATTERN("gra+ve")]
        >>
        KEYWORD("envie", "besoin", "hâte")
    }
}

//Example: la Russie qui pour une fois ne nous fout pas la trouille
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[LEMMA("foutre")]|[#1]
        >
        @COLLOQUIALISM[KEYWORD("la")]|[#2]
        >>
        @COLLOQUIALISM[LEMMA("trouille")]|[#3]
    }
}

//Example: Ça file les j'tons.
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[TYPE(PRO)]|[SEQUENCE]
        <>
       KEYWORD("j'tons", "jetons")
    }
}

//Example: Donc je le crois pas! | Fais pas ça!
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
    !KEYWORD("n", "n'", "ne", "n’")
    >
    @COLLOQUIALISM[TYPE(VER, AUX)]|[SEQUENCE]
    <:3>
    !KEYWORD("ne", "sans")
    >>
    KEYWORD("pas", "jamais", "aucun", "aucune", "personne", "ni") - TYPE(ADJ)
    }
}

//Example: j'arrive même pas à parler français correctement
SCOPE CLAUSE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("c", "ce", "c'")
        <:1>
        !KEYWORD("ne","n'","n")
        <:2>
        @COLLOQUIALISM[TYPE(VER, AUX)]|[SEQUENCE]
        >>
        TYPE(ADV) - KEYWORD("pas")
        >>
        KEYWORD("pas","jamais","rien","aucun","aucune","personne")
    }
}

//Example: c'est même pas truqué.
SCOPE CLAUSE
{
    IDENTIFY(SLANG)
    {
        KEYWORD("c", "c'", "ce")
        <:1>
        !KEYWORD("ne","n'","n")
        <:2>
        @COLLOQUIALISM[TYPE(VER, AUX)]|[#1]
        >>
        @COLLOQUIALISM[TYPE(ADV) - KEYWORD("pas")]|[#2]
        >>
        @COLLOQUIALISM[KEYWORD("pas","jamais","rien","aucun","aucune","personne")]|[#3]
    }
}

//Example: J'étais vraiment pas loin.
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("c", "c'", "ce")
        <:1>
        !KEYWORD("ne","n'","n")
        <:2>
        @COLLOQUIALISM[TYPE(VER, AUX)]|[#1]
        >>
        @COLLOQUIALISM[KEYWORD("vraiment pas")]|[#2]
    }
}

//Example: C'est vraiment pas bien.
SCOPE CLAUSE
{
    IDENTIFY (SLANG)
    {
        KEYWORD("ce","c'","c")
        <:1>
        !KEYWORD("ne", "n'","n")
        <:2>
        @COLLOQUIALISM[TYPE(VER,AUX)]|[#1]
        >>
        @COLLOQUIALISM[KEYWORD ("vraiment pas")]|[#2]
    }
}

//Example: et personne proteste! // "personne" as a subject, without "ne"
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("la", "une", "cette")
        >>
        @COLLOQUIALISM[KEYWORD("personne")]|[#1]
        >>
        !KEYWORD("ne","n'", "qui", "que", "qu", "qu'")
        >>
        @COLLOQUIALISM[TYPE(VER, AUX)]|[#2]
    }
}

//Example: et rien fonctionne // "rien" as a subject, without "ne"
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !LEMMA("avoir", "sans")
        >>
        @COLLOQUIALISM[KEYWORD("rien")]|[#1]
        >>
        !KEYWORD("ne","n'", "qui", "que", "qu", "qu'")
        >>
        @COLLOQUIALISM[TYPE(VER, AUX)]|[#2]
    }
}

//Example: j'ai rien compris // "rien" as an object, not preceded by "ne"
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("ne","n'")
        >>
        @COLLOQUIALISM[TYPE(AUX)]|[#1]
        >>
        @COLLOQUIALISM[KEYWORD("rien")]|[#2]
        >>
        @COLLOQUIALISM[TYPE(VER)]|[#3]
    }
}

//Example: je comprends rien // "rien" as an object, not preceded by "ne",
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("ne","n'")
        >>
        @COLLOQUIALISM[TYPE(VER)]|[#1]
        >>
        @COLLOQUIALISM[KEYWORD("rien")]|[#2]
    }
}

//Example: Personne vous écoute
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("la", "une", "cette")
        >>
        @COLLOQUIALISM[KEYWORD("personne","rien")]|[#1]
        >>
        !KEYWORD("ne","n'","n")
        >>
        @COLLOQUIALISM[TYPE(PRO) - KEYWORD("je","j'","j","tu","t'","il","elle","on","ils","elles","c","c'","ce","ça","qui","que","qu'","qu")]|[#2]
        >>
        @COLLOQUIALISM[TYPE(VER, AUX)]|[#3]
    }
}

//Example: Vendredi ça va être le feuuuu !
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("ça", "ca", "c'")]|[SEQUENCE]
        <:2>
        LEMMA("être")
        >
        PATTERN("feu+")
    }
}

//Example: les gens qui n'ont aucune idée de ç'qui ç'passe
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("ç'", "m'", "d'")]|[SEQUENCE]
        >>
        PATTERN("[bcdfgjklmnpqrstvwxz]\w+")
    }
}

//Example: Ah ben tiens, c'est étonnant !
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("tiens")+ POSITION (BEGIN SENTENCE)]
        OR
        KEYWORD("bah","ben","tiens", ":","ah ben")
        >>
        @COLLOQUIALISM[KEYWORD("tiens")]
    }
}

//Example: Pauvres bêtes, quoi...
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
		KEYWORD(",")
		>>
        @COLLOQUIALISM[KEYWORD("quoi")]
	}
}

//Example: on va niquer le grand capital
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[LEMMA("niquer")]
       <:2>
       !LEMMA("mère")
    }
}

//Example: Nique ta mère
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[LEMMA("niquer")]|[SEQUENCE]
       <:2>
       LEMMA("mère")
    }
}

//Example: Exemple type d'un gros niquage de mère
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[KEYWORD("niquage")]|[SEQUENCE]
       <:2>
       LEMMA("mère")
    }
}

//Example: Sans blagues !
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[KEYWORD("sans blagues", "sans blague")]
    }
}

//Example: Oh la vache ! C'est encore pire à l'intérieur !
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[KEYWORD("oh la vache")]
    }
}

//Example: tout le monde en a marre de travailler le dimanche
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[KEYWORD("en")]|[#1]
        >>
        @COLLOQUIALISM[TYPE(VER,AUX)]|[BASE#2]
        <:2>
        @COLLOQUIALISM[PATTERN("marre")]|[TEXT#3]
    }
}

//Example: Je me marre !
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @COLLOQUIALISM[ROLE(SUBJECT)]|[SEQUENCE]
        >
        TYPE(PRO)
        <:3>
        LEMMA("marrer")
    }
}

//Example: Tu m'étonnes ! Le contraire aurait été une vraie surprise !
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[KEYWORD("tu m'étonnes")]
    }
}

//Example: j'ai la haine bande d'incompétent
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[ROLE(SUBJECT)]|[SEQUENCE]
       >
       LEMMA("avoir")
       <:2>
       LEMMA("haine")
    }
}

//Example: gros bisous
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       !LEMMA("gros")
       >>
       @COLLOQUIALISM[LEMMA("bisou")]
       OR
       @COLLOQUIALISM[LEMMA("gros")]|[#1]
       >>
       @COLLOQUIALISM[LEMMA("bisou")]|[#2]
    }
}

//Example: En gros le gars se paluche sur l'air de "la passion du travail les jours fériés"
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[TYPE(PRO)]|[SEQUENCE]
       >>
       PATTERN("paluch\w+")
    }
}

//Example: Je spoil à la fin ya meilleur attaquant français Karim benzema
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[PATTERN("spoil\w*")]
    }
}

//Example: Mince pourtant C #macron élu??
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       !TYPE(NOU,CON, ADJ, VER, ART)
       >>
       @COLLOQUIALISM[KEYWORD("mince")]
    }
}

//Example: Je me casse
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[PATTERN("\w+")]|[TOKEN#1]
       >>
       @COLLOQUIALISM[KEYWORD("me","te","se","nous","vous")]|[#2]
       >>
       @COLLOQUIALISM[LEMMA("casser")]|[#3]
       >>
       !ROLE(OBJECT)
    }
}

//Example: casse toi
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[KEYWORD("casse","cassons","cassez")]|[SEQUENCE]
       >>
       KEYWORD("toi","vous","nous")
    }
}

//Example: Cet abruti qui n'est même pas fichu de trouver une vraie photo de Paris.
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[ROLE(SUBJECT)]|[SEQUENCE]
       <:3>
       LEMMA("être")
       <:4>
       KEYWORD("fichu", "fichus", "fichue", "fichues")
       >>
       TYPE(PRE)
    }
}

//Example: c'est fichu pour lui
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[KEYWORD("c'est fichu")]
    }
}

//Example: Quand tu sens que c'est vraiment pas bien ce que t'as fait
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[KEYWORD("t'","t")]|[SEQUENCE]
       >>
       LEMMA("être", "avoir", "arriver")
    }
}

//Example: Encore heureux que la bouffe est livrée par les camions
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @COLLOQUIALISM[LEMMA(LOAD "colloquial language_2.cl")]
    }
}

//Example: C'est bête qu'ils n'ont pas demandé le TMO pour Russie/Espagne aussi.
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       !TYPE(ART, ADJ)
       >>
       !LEMMA("pauvre")
       >>
       @COLLOQUIALISM[LEMMA("bête")]
       >>
       !LEMMA("noir")
    }
}

//-----VERLAN-----//

//Example: aboyer comme des ienchs sur les réseaux
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @VERLAN[TAG(VERLAN)]
    }
}

//-----ABBREVIATIONS-----//

//Example: Non mdr enfin jsp
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @ABBREVIATION[TAG(ABBREVIATION) - TAG (USER)]|[TEXT]
    }
}

//Example: g sais que tu ne l'as pas voté
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       !KEYWORD("t")
       >>
       !TYPE(ART)
       >>
       @ABBREVIATION[KEYWORD("g")]
       >>
       !PATTERN("[\.A-Z]")
       >>
       !KEYWORD("pas")
    }
}

//Example: Ptdr jcrois y'a rien de pire que les contrôleurs SNCF désagréables.
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       !KEYWORD("@", "#")
       >>
       @ABBREVIATION[PATTERN("[Jj]'?[bcdfgjklmnpqrstvwxz][a-z]*")-KEYWORD("j'tons", "jsp")]
    }
}

//Example: Heureusement que la personne au tel est super pro.
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @ABBREVIATION[KEYWORD("tel")]
       >>
       !TYPE(NOU)
    }
}

//Example: Ça se voit ta jamais vu Marine Le Pen perdre au second tour
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @ABBREVIATION[KEYWORD("ta", "ma")]
       >>
       TYPE(VER,ADV)
    }
}

//Example: j'ai eu la chance de passer quelques temps avec des Évènes et leur troupeau de 1.9k rennes
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        @ABBREVIATION[PATTERN("(?:(?:\d+(?:.\d+)*)(k))")]
    }
}

//Example: C au peuple de voter des ouvriers ou des chômeurs
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("le", "b", "lettre", "@")
        >
        @ABBREVIATION[KEYWORD("c")]|[TEXT]
        <:2>
        !KEYWORD("est", "'","pas")
    }
}

//Example: C PAS ANGELA MERKEL QUI PEUT EN DIRE AUTANT
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
        !KEYWORD("le", "b", "lettre", "@")
        >
        @ABBREVIATION[KEYWORD("c pas")]|[TEXT]
    }
}

//-----EMOTICONS-----//

//Example: Je vais être plus claire alors:)
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       @EMOTICON[KEYWORD(LOAD "emoticons.cl")]
    }
}

//Example: Y'a comme un truc qui bloque la vue:/
SCOPE SENTENCE
{
    IDENTIFY(SLANG)
    {
       !PATTERN("\w*https*")
       >>
       @EMOTICON[KEYWORD(":/")]
    }
}

//-----USERS-----//

//Example: via @BFMTV
SCOPE SENTENCE
{
    IDENTIFY(USERS)
    {
        @USER [TAG(USER)]
    }
}

//-----URLS-----//

//Example: https://t.co/Jy9SicY0WM
SCOPE SENTENCE
{
    IDENTIFY(URLS)
    {
        @URL[TYPE(WEB)]
    }
}

//-----MMD-----//

//Example: France Info ferait mieux de s'occuper de l'élection truquée de Macron
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        !KEYWORD("#","@")
        >>
        @MMD[KEYWORD(LOAD "french radio broadcast.cl")]
    }
}

//Example: BFMTV serait capable de nous dire que c'est de la faute de Poutine
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        !KEYWORD("#","@","_")
        >>
        @MMD[KEYWORD(LOAD "french television networks.cl")]
    }
}

//Example: Et le Figaro, il soutient Poutine?
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        !KEYWORD("#","@")
        >>
        @MMD[KEYWORD(LOAD "french press.cl")]
    }
}

//Example: la portée totale de BBC World Service a considérablement augmenté
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        !KEYWORD("#","@")
        >>
        @MMD[KEYWORD(LOAD "international radio broadcast.cl")]
    }
}

//Example: La Vanguardia figure parmi les journaux de tradition en Espagne
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        !KEYWORD("#","@")
        >>
        @MMD[KEYWORD(LOAD "international newspapers.cl")]
    }
}

//Example: Retrouvez le programme TV de I24News de ce jour
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        !KEYWORD("#","@")
        >>
        @MMD[KEYWORD(LOAD "international television networks.cl")]
    }
}

//Example: Taux de participation à 16h, heure de france: RT 57% F24 52%
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        !KEYWORD("#","@", "_")
        >>
        @MMD[KEYWORD("rt") - TAG(RETWEET)]
        <:2>
        !KEYWORD("international", "america", "uk", "español", "français", "arabic", "france")
    }
}

//Example: il a été invité sur Sky News
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        @MMD[KEYWORD("sky news")]
        >>
        !KEYWORD("australia", "arabia")
    }
}

//Example: Telesur est une chaîne de télévision à destination de l'Amérique latine
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        @MMD[KEYWORD("telesur")]
        >>
        !KEYWORD("english")
    }
}

//Example: CGTN est en effet un média d'Etat chinois
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        @MMD[KEYWORD("cgtn")]
        >>
        !KEYWORD("español", "français", "русский", "arabic", "america", "africa")
    }
}

//Example: L'Orient-Le Jour
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        PATTERN("Retweeted", "via")
        >>
        @MMD[TYPE(ART)]|[#1]
        >>
        @MMD[TYPE(ADJ,NOU)+PATTERN("[A-Z][a-z]+")]|[#2]
        >>
        @MMD[TYPE(PNT)+PATTERN("\-")]|[#3]
        >>
        @MMD[TYPE(ART)]|[#4]
        >>
        @MMD[TYPE(ADJ,NOU)+PATTERN("[A-Z][a-z]+")]|[#5]
    }
}

//Example: Fraude et bourrage des urnes étaient au RV, rapporte la BBC selon observateurs.
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        @MMD[TYPE(MMD) - KEYWORD("#IFRI", "cgtn", "telesur", "sky news", "rt") - KEYWORD(LOAD "french press.cl") - KEYWORD(LOAD "french television networks.cl") - KEYWORD (LOAD "french radio broadcast.cl") - KEYWORD (LOAD "international newspapers.cl") ]
    }
}

//-----COM-----//

//Example: EDF et le gouvernement sont en train de préparer la poursuite du nucléaire
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        !LEMMA("affaire")
        >>
        @COM[TYPE(COM) - KEYWORD("#PS", "BBC World Service")- KEYWORD(LOAD "french press.cl") - KEYWORD(LOAD "french television networks.cl") - KEYWORD (LOAD "french radio broadcast.cl") - KEYWORD (LOAD "international newspapers.cl")]
    }
}

//Example: le statut des cheminots serait à l'avantage de la sncf
SCOPE SENTENCE
{
    IDENTIFY(COMPANIES)
    {
        !KEYWORD("@")
        >>
        @COM[TAG(sncf)]
    }
}

//-----QUOTES-----//

//Example: "La grève va prendre en otage 3,8 millions de voyageurs", dénonce Larcher
SCOPE SENTENCE
{
    IDENTIFY(QUOTES)
    {
        @QUOTE[PATTERN("\"((.+\s){3,}.+)\"")]|[TEXT]
    }
}

//-----POLITICALPARTIES-----//

//Example: En Marche fête "une victoire d'équipe"
SCOPE SENTENCE
{
    IDENTIFY(POLITICALPARTIES)
    {
        @FRENCHPOLITICALPARTIES[TAG(FRENCHPOLITICALPARTIES)]|[TEXT]
    }
}

//Example: Le FN appelle à voter LR à Mayotte
SCOPE SENTENCE
{
    IDENTIFY(POLITICALPARTIES)
    {
        @PARTY[ANCESTOR (100007278) - KEYWORD ("parti libéral", "parti libéral-démocrate") + TYPE(NPR) - TAG(FRENCHPOLITICALPARTIES) - SYNCON(100013124, 100040062) - SYNCON (UNKNOWN)]//@SYN: #100007278# [parti politique] //@SYN: #100013124# [Parti libéral-démocrate] //@SYN: #100040062# [Parti Libéral]
    }
}

//Example: La crise du parti libéral-démocrate allemand
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(POLITICALPARTIES)
    {
        @PARTY[SYNCON (100040062)]//@SYN: #100040062# [Parti Libéral]
        >>
        !KEYWORD("-")
        OR
        @PARTY[KEYWORD("parti libéral")]|[#1]
        >>
        @PARTY[KEYWORD("-")]|[#2]
        >>
        @PARTY[TYPE(NOU,ADJ)]|[#3]
        >>
        !KEYWORD("de","d'","du","de l'","de la","des")
    }
}

//Example: Parti libéral-démocrate de Russie
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(POLITICALPARTIES)
    {
        @PARTY[KEYWORD("parti libéral")]|[#1]
        >>
        @PARTY[KEYWORD("-")]|[#2]
        >>
        @PARTY[TYPE(ADJ, NOU)]|[#3]
        >>
        @PARTY[KEYWORD("de","d'","du","de l'","de la","des")]|[#4]
        >
        @PARTY[TYPE(GEO)]|[#5]
    }
}

//-----HASHTAGS-----//

//Example: Et #Poutine l'emporte haut la main, comme prévu.
SCOPE SENTENCE
{
    IDENTIFY(HASHTAGS)
    {
        @HASHTAG[PATTERN("#[A-Za-z0-9-]+")]
    }
}

//-----LOCATIONS-----//

//Example: Ça se passe en France.
SCOPE SENTENCE
{
    IDENTIFY(LOCATIONS)
    {   !KEYWORD("RT")
        >>
        !LEMMA("fief")
        <:2>
        @LOCATION[TYPE(GEO, GEA) - KEYWORD("Grève", "we","can", "Louvre", "RIP", "Chirac") - TAG(COLLOQUIALISM, ABBREVIATION, VERLAN) - SYNCON(UNKNOWN)]|[TEXT]
        >>
        !KEYWORD("#Poutine", "poutine")
    }
}

//-----PERCENTAGES-----//

//Example: Vladimir Poutine en tête avec 71,97% des voix
SCOPE SENTENCE
{
    IDENTIFY(PERCENTAGES)
    {
        @PERCENTAGE[TYPE(PCT)]
    }
}

//-----INSTITUTIONS-----//

//Example: La démocratie n'existe pas en UE
SCOPE SENTENCE
{
    IDENTIFY(INSTITUTIONS)
    {
        @INSTITUTION[ANCESTOR(100484652, 100178706) - ANCESTOR(100486972, 100056061, 100055043) + TYPE(NPR) - SYNCON(UNKNOWN)]//@SYN: #100484652# [organisation internationale] //@SYN: #100178706# [institution] //@SYN: #100486972# [établissement humain] //@SYN: #100056061# [division administrative]
    }
}

//Example: Poutine confirmé au Kremlin jusqu'en 2024
SCOPE SENTENCE
{
    IDENTIFY(INSTITUTIONS)
    {
        @INSTITUTION[ANCESTOR(114572) - SYNCON(UNKNOWN, 101450662) - ANCESTOR(100486972) + TYPE(NPR)]//@SYN: #114572# [gouvernement] //@SYN: #101450662# [Gouvernement de la République française] //@SYN: #100486972# [établissement humain]
    }
}

//Example: Aies donc le courage d'aller bloquer l'Elysée
SCOPE SENTENCE
{
    IDENTIFY(INSTITUTIONS)
    {
        @INSTITUTION[LIST(101450662, 100188190)]//@SYN: #101450662# [Gouvernement de la République française] //@SYN: #100188190# [palais de l'Élysée]
    }
}

//Example: On rappellera que la fraude à Pôle Emploi, c'est 39 millions d'euros par an.
SCOPE SENTENCE
{
    IDENTIFY(INSTITUTIONS)
    {
        @INSTITUTION[KEYWORD("pôle emploi")]
    }
}

//-----DATES-----//

//Example: On est le 18.
SCOPE SENTENCE
{
    IDENTIFY(DATES)
    {
        KEYWORD("on")
        >>
        LEMMA("être")
        >>
        KEYWORD("le")
        >>
        @DATE[PATTERN("[0-9]+[ \w]*[ 0-9]*") - TYPE(DAT)]
    }
}

//Example: Jeudi, 15 Mars, 2018
SCOPE SENTENCE
{
    IDENTIFY(DATES)
    {
        !KEYWORD("#")
        >>
        @DATE[TYPE(DAT)]
    }
}

//Example: En 1995 Alain Juppé recule sur les régimes spéciaux des cheminots.
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(DATES)
    {
        !ANCESTOR(100005151:0,192957)//@SYN: #100005151# [mois] //@SYN: #192957# [mois du calendrier grégorien]
        <:2>
        !KEYWORD("_")
        >>
        @DATE[PATTERN("19\d{2}") - TYPE(DAT, MON)]
    }
}

//Example: Une victoire de Vladimir Poutine le placerait aux commandes du pays jusqu'en 2024
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(DATES)
    {
        !ANCESTOR(100005151:0,192957)//@SYN: #100005151# [mois] //@SYN: #192957# [mois du calendrier grégorien]
        <:2>
        !KEYWORD("_")
        >>
        @DATE[PATTERN("20\d{2}") - TYPE(DAT, MON)]
        >>
        !KEYWORD("fois")
    }
}

//-----PEOPLE-----//

//Name (NPH) not in the list
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        PATTERN("[A-z]*[a-z]*") - KEYWORD(LOAD"nph_f.cl") - KEYWORD(LOAD "nph_m.cl")
        >>
        PATTERN("[A-z]*[a-z]*") - KEYWORD(LOAD "nph_m.cl") - KEYWORD(LOAD"nph_f.cl")
        >>
        @PERSON[TYPE(NPH) - TYPE(PRO) - TAG(ABBREVIATION, VERLAN, COLLOQUIALISM) - KEYWORD(LOAD "nph_f.cl") - KEYWORD(LOAD "nph_m.cl")]
        >>
        !PATTERN("\#[A-Z][a-z]+")
        >>
        !TYPE(NPH)
    }
}

//Name (NPR) not in the list
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        !KEYWORD("#", "@")
        >>
        @PERSON[PATTERN ("[A-Z][a-z]+") + TYPE(NPR) - ANCESTOR(100043229, 120, 100215627, 100811430, 102761147, 100042889, 101322005, 101656682, 116334295, 100002095) + SYNCON(UNKNOWN) - TAG(ABBREVIATION,VERLAN,COLLOQUIALISM) - KEYWORD(LOAD "nph_f.cl") - KEYWORD(LOAD "nph_m.cl") - KEYWORD(LOAD "french radio broadcast.cl") - KEYWORD("pen","macron", "Hallelujah", "Tele")]//@SYN: #100043229# [organisation] //@SYN: #120# [lieu géographique] //@SYN: #100215627# [individu] //@SYN: #100811430# [bâtiments] //@SYN: #102761147# [colloque] //@SYN: #100042889# [véhicule] //@SYN: #101322005# [phénomène] //@SYN: #101656682# [événement public] //@SYN: #116334295# [groupe de personnes] //@SYN: #100002095# [aliments]
        >>
        !TYPE(NPR)
    }
}

//First and last name (NPH) not in the list
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        @PERSON[TYPE(NPH) - TYPE(PRO) - TAG(ABBREVIATION, VERLAN, COLLOQUIALISM) - KEYWORD(LOAD "nph_f.cl") - KEYWORD(LOAD "nph_m.cl")]|[#1]
        >>
        @PERSON[TYPE(NPH) - TYPE(PRO) - TAG(ABBREVIATION, VERLAN, COLLOQUIALISM) - KEYWORD(LOAD "nph_f.cl") - KEYWORD(LOAD"nph_m.cl")]|[#2]
    }
}

//Female name from the list + last name (NPH) not in the list
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        @PERSON[KEYWORD(LOAD "nph_f.cl")]|[#1]
        >>
        @PERSON[TYPE(NPH) - TYPE(PRO) - TAG(ABBREVIATION, VERLAN, COLLOQUIALISM) - KEYWORD("marseillaise", "le pen")]|[#2]
    }
}

//Double male name from the list + last name (NPH) not in the list
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        @PERSON[PATTERN("[A-Z][a-z]+ [A-Z][a-z]+") + KEYWORD(LOAD "nph_m.cl") - TYPE(PRE)]|[#1]
        >>
        @PERSON[TYPE(NPH) - TYPE(PRO) - TAG(ABBREVIATION, VERLAN, COLLOQUIALISM)]|[#2]
    }
}

//Single male name from the list + last name (NPH) not in the list
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        !PATTERN("[A-Z][a-z]+") + KEYWORD(LOAD "nph_m.cl")
        >>
        @PERSON[PATTERN("[A-Z][a-z]+") + KEYWORD(LOAD "nph_m.cl")]|[#1]
        >>
        @PERSON[TYPE(NPH) - TYPE(PRO) - TAG(ABBREVIATION, VERLAN, COLLOQUIALISM) - KEYWORD(LOAD "nph_m.cl")]|[#2]
    }
}

//Female name from the list + last name (NPR)
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        !KEYWORD("#", "@")
        >>
        @PERSON[KEYWORD(LOAD "nph_f.cl")]|[#1]
        >>
        @PERSON[PATTERN ("[A-Z][a-z]+") + TYPE(NPR) - TYPE (NPH)]|[#2]
    }
}

//Male name from the list + last name (NPR)
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        !KEYWORD("#", "@")
        >>
        @PERSON[KEYWORD(LOAD "nph_m.cl")]|[#1]
        >>
        @PERSON[PATTERN ("[A-Z][a-z]+") + TYPE(NPR) - TYPE(NPH)]|[#2]
    }
}

//Name (NPH) not in the list + #lastname
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        @PERSON[TYPE(NPH) - KEYWORD(LOAD "nph_f.cl") - KEYWORD(LOAD "nph_m.cl")]|[#1]
        >>
        PATTERN("\#")
        >>
        @PERSON[PATTERN("[A-Z][a-z]+")]|[#2]
    }
}

//Female name from the list + #lastname
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        @PERSON[KEYWORD(LOAD "nph_f.cl")]|[#1]
        >>
        PATTERN("\#")
        >>
        @PERSON[PATTERN("[A-Z][a-z]+")]|[#2]
    }
}

//Male name from the list + #lastname
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        @PERSON[KEYWORD(LOAD "nph_m.cl")]|[#1]
        >>
        PATTERN("\#")
        >>
        @PERSON[PATTERN("[A-Z][a-z]+")]|[#2]
    }
}

//Male name from the list
SCOPE SENTENCE ON ATOM
{
    IDENTIFY (PEOPLE)
    {
        PATTERN("@?[A-Z]*[a-z]*[0-9]*") - KEYWORD(LOAD "nph_m.cl")
        >>
        !KEYWORD("_")
        >>
        @PERSON[KEYWORD(LOAD "nph_m.cl")]
        >>
        !PATTERN("#?[A-Z][a-z]+(-[A-Z][a-z]+)*")
        OR
        @PERSON[KEYWORD(LOAD "nph_m.cl") + POSITION(BEGIN SENTENCE)]
        >>
        !PATTERN("[A-Z][a-z]+")
    }
}

//Male name from the list, followed by a capitalized name (neither NPH nor NPR)
SCOPE SENTENCE ON ATOM
{
    IDENTIFY (PEOPLE)
    {
        @PERSON[KEYWORD(LOAD "nph_m.cl")]|[#1]
        >>
        @PERSON[PATTERN("[A-Z][a-z]+(-[A-Z][a-z]+)*") - TYPE(NPH,NPR) - KEYWORD("Le") - TAG(PUTIN)]|[#2]
    }
}

//Female name from the list
SCOPE SENTENCE ON ATOM
{
    IDENTIFY (PEOPLE)
    {
        PATTERN("@?[A-Z]*[a-z]*[0-9]*[\W]*") - KEYWORD(LOAD "nph_f.cl")
        >>
        !TYPE(ART)
        >>
        @PERSON[PATTERN("[A-Z]+[a-z]*") + KEYWORD(LOAD "nph_f.cl")]
        >>
        !TYPE(NPR, NPH)
        OR
        @PERSON[PATTERN("[A-Z]+[a-z]*") + KEYWORD(LOAD "nph_f.cl") + POSITION(BEGIN SENTENCE)]
        >>
        !TYPE(NPR, NPH)
    }
}

//Female name from the list, followed by a capitalized name (neither NPH nor NPR)
SCOPE SENTENCE ON ATOM
{
    IDENTIFY (PEOPLE)
    {
        @PERSON[KEYWORD(LOAD "nph_f.cl")]|[#1]
        >>
        @PERSON[PATTERN("[A-Z][a-z]+") - TYPE(NPH,NPR)]|[#2]
    }
}

//Vladimir Putin
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        @PERSON[KEYWORD(LOAD "nph_m.cl")]|[#1]
        >>
        @PERSON[TAG(PUTIN)]|[#2]
    }
}

//Putin not preceded by his first names
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        !KEYWORD("Vladimir", "Vladimirovitch")
        >>
        @PERSON[TAG(PUTIN)]|[TEXT]
        >>
        !PATTERN("\#[A-Z][a-z]+")
    }
}

//V. #putin
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        @PERSON[KEYWORD("V.")]|[#1]
        >>
        PATTERN("\#")
        >>
        @PERSON[PATTERN("[A-Z][a-z]+")]|[#2]
    }
}

//Affaire + name not in the list
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        LEMMA("affaire")
        >>
        @PERSON[PATTERN("[A-Z][a-z]+") - KEYWORD(LOAD "nph_f.cl") - KEYWORD(LOAD "nph_m.cl")]
    }
}

//Le Pen not preceded by their names
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        !KEYWORD(LOAD "nph_f.cl")
        >>
        !KEYWORD(LOAD "nph_m.cl")
        >>
        !KEYWORD("marine")
        >>
        @PERSON[KEYWORD("le pen")]
    }
}

//marine le pen
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        @PERSON[KEYWORD("marine")]|[#1]
        >>
        @PERSON[KEYWORD("le pen")]|[#2]
    }
}

//Le Pen family
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        @PERSON[KEYWORD(LOAD "nph_f.cl") - KEYWORD("marine")]|[SEQUENCE]
        <:2>
        KEYWORD("le pen")
        OR
        @PERSON[KEYWORD(LOAD "nph_m.cl")]|[SEQUENCE]
        <:2>
        KEYWORD("le pen")
    }
}

//Macron not preceded by his name, his initial or #
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        !KEYWORD("emmanuel","e.","#")
        >>
        @PERSON[KEYWORD("macron") - TYPE(NPR,NPH)]
    }
}

//E. Macron
SCOPE SENTENCE ON ATOM
{
    IDENTIFY(PEOPLE)
    {
        @PERSON[KEYWORD("e.")]|[#1]
        >>
        @PERSON[KEYWORD("macron")]|[#2]
    }
}

//Politicians' initials
SCOPE SENTENCE
{
    IDENTIFY(PEOPLE)
    {
        !KEYWORD("#","@")
        >>
        @PERSON[KEYWORD("mlp","nda","dsk", "jlm")]
    }
}
