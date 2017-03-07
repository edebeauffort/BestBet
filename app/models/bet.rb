class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :selection

  def pool
    return selection.pool
  end
end
