SMODS.Joker {
    key = "negative_nancy",
    config = {
      
    },
    loc_txt = {
      name = "Negative Nancy",
      text ={
          "{C:dark_edition}Negative{} Jokers appear {C:attention}3X{}",
          "more often."
      },
  },
    rarity = 1,
    pos = { x = 18, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }