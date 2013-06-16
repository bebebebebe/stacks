class Card < ActiveRecord::Base
  attr_accessible :stack_id, :writing

  belongs_to :stack
end
