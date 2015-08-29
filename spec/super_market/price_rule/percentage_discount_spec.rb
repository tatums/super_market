require 'spec_helper'

module SuperMarket
  module PriceRule
    describe PercentageDiscount do

      before { stub_const("SuperMarket::PRICES", prices) }
      before { stub_const("SuperMarket::SPECIALS", specials) }

      describe "#price" do

        let(:prices) do
          {"A" => {"price" => 100} }
        end
        let(:specials) do
          {"A" => {"type" => "PercentageDiscount", "value" => "10"} }
        end

        context "discount pricing" do
          subject(:item) { described_class.new("A", 1)  }
          it "returns 90" do
            expect(item.price).to eq(90)
          end
        end
      end
    end
  end
end

