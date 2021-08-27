require 'rails_helper'

RSpec.describe Types::QueryType do
  describe "distilleries" do
    let!(:distilleries) { create_pair(:distillery) }

    let(:query) do
      %(query {
        distilleries {
          name
        }
      })
    end

    subject(:result) do
      SiteSchema.execute(query).as_json
    end

    it "returns all distilleries" do
    expect(result.dig("data", "distilleries")).to match_array(
      distilleries.map { |distillery| { "name" => distillery.name } }
    )
    end
  end
end
