class Producer < ApplicationRecord
  has_many :distilleries, dependent: :nullify
end
