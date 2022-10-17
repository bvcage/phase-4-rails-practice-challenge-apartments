class Lease < ApplicationRecord
   validates :rent, presence: true, numericality: { only_integer: true }
   validates :apartment_id, presence: true, numericality: { only_integer: true }
   validates :tenant_id, presence: true, numericality: { only_integer: true }

   belongs_to :apartment_id
   belongs_to :tenant_id
end
