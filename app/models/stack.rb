class Stack < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :cards, :dependent => :destroy


end
