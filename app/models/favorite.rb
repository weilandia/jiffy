class Favorite < ActiveRecord::Base
  validates :user, presence: true
  validates :jif, presence: true
  belongs_to :user
  belongs_to :jif
end
