class Apartment < ApplicationRecord
   validates :number,
      presence: true,
      numericality: { only_integer: true },
      uniqueness: true

   has_many :leases
   has_many :tenants, through: :leases
end
