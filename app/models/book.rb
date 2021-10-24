class Book < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
   validates :opinion, presence: true
end
