class Organization < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
end
