class Selection < ApplicationRecord
  belongs_to :pool, optional: true
  has_many :bets
end
