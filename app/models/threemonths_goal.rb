class ThreemonthsGoal < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :aim, presence: true, length: { maximum: 140 }
  attr_accessor :collection
end
