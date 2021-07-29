class Distillery < ApplicationRecord
  has_many :whiskeys, dependent: :nullify
end
