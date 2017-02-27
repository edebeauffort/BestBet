class Pool < ApplicationRecord
  belongs_to :user
  has_one :chat
  has_many :selections
  has_many :bets
end
