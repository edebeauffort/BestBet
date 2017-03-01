class Pool < ApplicationRecord
  belongs_to :user
  has_one :chat
  has_many :selections
  has_many :bets
  has_many :invites
  accepts_nested_attributes_for :selections, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :invites, reject_if: :all_blank, allow_destroy: true
end
