require 'spec_helper'
require 'super_market/price_rule/shared'

module SuperMarket
  module PriceRule
    describe PercentageDiscount do

      it_behaves_like "a price rule"

      before { stub_const("SuperMarket::PRICES", prices) }
      before { stub_const("SuperMarket::SPECIALS", specials) }
      let(:prices) do
        {"A" => {"price" => 100} }
      end
      let(:specials) do
        {"A" => {"type" => "PercentageDiscount", "value" => "10"} }
      end

      describe "#price" do
        context "given an $100 product and a special discount of 10%" do
          subject(:item) do
            i = described_class.new("A", 1)
            i.price
          end
          it { is_expected.to eq(90) }
        end
      end
    end
  end
end

