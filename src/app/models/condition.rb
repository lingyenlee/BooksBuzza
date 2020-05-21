class Condition < ApplicationRecord
      # -------associations---------
      has_many :listings, dependent: :destroy
end
