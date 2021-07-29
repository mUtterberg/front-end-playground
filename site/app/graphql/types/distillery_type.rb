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

    # field :full_name, String, null: false
    #
    # def full_name
    #   # `object` references the Distillery instance
    #   # TODO: Return name with producer in parentheses
    #   [object.name, ' (', object.producer.name, ')'].compact.join('')
    # end

    # field :location, Types::LocationType, null: true
  end

  # class LocationType < Types::BaseObject
  #   field :country, String, null: false
  #   field :state, String, null: true
  #   field :city, String, null: true
  #   field :longitude, Float, null: true
  #   field :latitude, Float, null: true
  # end
end
