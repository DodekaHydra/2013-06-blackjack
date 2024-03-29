class window.Deck extends Backbone.Collection

  model: Card

  initialize: ->
    @add _(_.range(1, 105)).shuffle().map (card) ->
      new Card
        rank: (card % 52) % 13
        suit: Math.floor((card % 52) / 13)

  dealPlayer: -> hand = new Hand [ @pop(), @pop() ], @

  dealDealer: -> new Hand [ @pop().flip(), @pop() ], @, true
