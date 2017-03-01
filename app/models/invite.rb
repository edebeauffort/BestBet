class Invite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :pool, optional: true
end
