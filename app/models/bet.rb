class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :pool
  belongs_to :selection
end
