SMODS.Joker {
    key = "pinhead",
    config = {
      extra = {
        money = 10
      }
    },
    loc_txt = {
      name = "Pinhead",
      text ={
          "Earn {C:money}$#1#{} if blind is beaten ",
          "in a {C:attention}single hand{}"
      },
  },
    rarity = 1,
    pos = { x = 2, y = 4 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
          vars = {
            card.ability.extra.money
          }
      }
    end,
  
    calculate = function(self, card, context)
      if context.end_of_round then
        if G.GAME.current_round.hands_played == 1 then
          card.ability.extra.money = 10
        end
      end
    end,
    calc_dollar_bonus = function(self, card)
      if card.ability.extra.money > 0 and G.GAME.current_round.hands_played == 1 then
          local dollar_bonus = card.ability.extra.money
          return dollar_bonus
      end
  end
  }