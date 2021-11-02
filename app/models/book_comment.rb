class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :bookComment, dependent: :destroy
end
