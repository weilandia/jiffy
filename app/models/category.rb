class Category < ActiveRecord::Base
  has_many :jifs
  validates :name, presence: true, uniqueness: true
end
