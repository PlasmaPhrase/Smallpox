return {
    descriptions = {
        Back = {
            b_smallpox_showman = {
                name = {
                    "Showman Deck",
                },
                text = {
                    "{C:attention}Joker{}, {C:tarot}Tarot{}, {C:planet}Planet{},",
                    "and {C:spectral}Spectral{} cards may",
                    "appear multiple times",
                    "{s:0.8,C:inactive}Art by Inky",
                },
                unlock = {
                    "{C:attention}Oh, this is the greatest show!",
                    "{C:attention}Oh, this is the greatest show!",
                }
            },
        },
        Joker = {
            j_smallpox_smallpox = {
                name = {
                  "Smallpox", 
                  "{s:0.5}created by {C:blue,s:0.5}Plasma{}{}",
                  "{s:0.5}art by {C:blue,s:0.5}Plasma{}{}"
                },
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "{C:green}#2# in #3#{} chance for a",
                    "random Joker to become",
                    "{V:1}infected{} with {C:attention}Smallpox{}"
                }
            },
            j_smallpox_tjetsu_sumi = {
                name = {
                    "Sumi",
                    "{s:0.5}created by {C:tarot,s:0.5}Tje.Tsu{}{}",
                },
                text = {
                    {"Scored {C:hearts}Hearts{} give",
                    "{X:mult,C:white}X#2#{} Mult if scored",
                    "after a {C:spades}Spade{}"},
                    {"Scored {C:spades}Spades{} give",
                    "{X:chips,C:white}X#1#{} Chips if scored",
                    "after a {C:hearts}Heart{}"},
                    {"{C:inactive}(Last scored : {V:1}#3#{}{C:inactive}){}"}
                }
            }
        }
    }
}


