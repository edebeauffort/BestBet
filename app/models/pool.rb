class Pool < ApplicationRecord
  belongs_to :user
  has_one :chat
  has_many :selections
  has_many :bets, through: :selections
  has_many :invites
  has_many :messages
  accepts_nested_attributes_for :selections, reject_if: :all_blank, allow_destroy: true
  belongs_to :winning_selection, optional: :true, class_name: "Selection", foreign_key: :selection_id
  accepts_nested_attributes_for :invites, reject_if: :all_blank, allow_destroy: true
  validates :title, presence: true
  validates :stake, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :end_date, presence: true
  validate :expiration_date_cannot_be_in_the_past

private

  def expiration_date_cannot_be_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end
end
