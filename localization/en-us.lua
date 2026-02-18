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
            j_smallpox_agency = {
                name = {
                  "The Agency", 
                  "{s:0.5}created by {C:red,s:0.5}Mysthaps{}{}",
                  "{s:0.5}art by {C:attention,s:0.5}Inky{}{}"
                },
                text = {
                    {
                        "When hand starts, roll {C:attention}6 {C:red}D4s",
                        "{C:mult}+#1#{} Mult for every {C:red}3{} rolled"
                    },
                    {
                        "If exactly {C:attention}3 {C:red}3s{} are rolled, pick one:",
                        "- Counts this roll as {C:attention}3^3{} {C:red}3s{} rolled",
                        "- Replenish {C:attention}#3# {C:blue}hands{} and {C:red}discards",
                        "- Permanently increase Mult by {C:mult}#2#",
                    },
                }
            },
        }
    },
    misc = {
        dictionary = {
            k_smallpox_triscendence = "!!! TRISCENDENCE !!!",
            k_smallpox_select_tri = "Select an additional Triscendence effect:",
            k_smallpox_tri_1 = "All Hands",
            k_smallpox_tri_2 = "Circle Back",
            k_smallpox_tri_3 = "Employee of the Moment",
            k_smallpox_tri_1_desc = "Counts this roll as 3^3 3s rolled",
            k_smallpox_tri_2_desc = "Replenish 3 hands and discards",
            k_smallpox_tri_3_desc = "Permanently increase Mult by 3",
        }
    }
}


