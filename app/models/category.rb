class Category < ActiveRecord::Base
  has_many :jifs, dependent: :delete_all
  validates :name, presence: true, uniqueness: true
end
