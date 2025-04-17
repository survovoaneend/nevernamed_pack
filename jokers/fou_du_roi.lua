SMODS.Joker {
  key = "fou_du_roi",
  config = {
      extra = {
          odds = 2
      }
  },
  loc_txt = {
      name = "Fou du Roi",
      text = {
          '{C:green}#2# in #1#{} chance to create a', 
          '{C:tarot}Tarot card{} if played hand',
          'contains a {C:attention}King{} or {C:attention}Queen',
          '{C:inactive}(Must have room)'
      },
  },
  rarity = 1,
  pos = { x = 2, y = 7 }, 
  atlas = 'joker_atlas', 
  cost = 4,
  unlocked = true,
  discovered = true,
  blueprint_compat = true, 
  eternal_compat = true,  

  loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.odds, G.GAME.probabilities.normal } }
  end,

  calculate = function(self, card, context)
    if context.joker_main then
      if pseudorandom('fou_du_rou') < G.GAME.probabilities.normal / card.ability.extra.odds and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        local kq = 0
        for k, v in ipairs(context.full_hand) do
          if v:get_id() == 12 or v:get_id() == 13 then
            kq = kq + 1
          end
          if kq > 0 then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
              trigger = 'before',
              delay = 0.0,
              func = (function()
                local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'vag')
                _card:add_to_deck()
                G.consumeables:emplace(_card)
                G.GAME.consumeable_buffer = 0
                return true
              end)
            }))
            return {
              message = localize('k_plus_tarot'),
              card = card
            }
          end
        end
      end
    end
  end
}
