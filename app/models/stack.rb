class Stack < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :cards, :dependent => :destroy

  def top_card
    cards = Card.select { |card| card.stack_id == id }
    cards.first
  end

end
