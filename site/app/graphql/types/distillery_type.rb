module Types
  class DistilleryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :country, String, null: false
    field :state, String, null: true
    field :city, String, null: true
    field :longitude, Float, null: true
    field :latitude, Float, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :producer, Types::ProducerType, null: true
    # field :location, Types::LocationType, null: true

    def full_name
      # `object` references the Distillery instance
      [object.name, ' (', 'object.producer_id.name', ')'].compact.join('')
    end
  end

  # class LocationType < Types::BaseObject
  #   field :country, String, null: false
  #   field :state, String, null: true
  #   field :city, String, null: true
  #   field :longitude, Float, null: true
  #   field :latitude, Float, null: true
  # end
end
