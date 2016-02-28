class Favorite < ActiveRecord::Base
  validates :user, presence: true, uniqueness: true
  validates :jif, presence: true
  belongs_to :user
  belongs_to :jif
end
