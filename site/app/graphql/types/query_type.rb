module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :distilleries,
          [Types::DistilleryType],
          null: false,
          description: "Returns a list of distilleries in the cellar"

    def distilleries
      Distillery.preload(:producer)
      # Distillery.all
    end

    field :producers,
          [Types::ProducerType],
          null: false,
          description: "Returns a list of producers available"

    def producers
      Producer.all
    end
  end
end
