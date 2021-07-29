class Distillery < ApplicationRecord
  belongs_to :producer
  has_many :whiskeys, dependent: :nullify
end
