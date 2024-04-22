class Customer < ApplicationRecord
  has_many :posts, dependent: :destroy
end
