require 'spec_helper'
require 'super_market/price_rule/shared'

module SuperMarket
  module PriceRule
    describe NForX do

      it_behaves_like "a price rule"

      subject(:item) do
        i = described_class.new("A", quantity)
        i.price
      end

      describe "#price" do

        context "given a $50 product and 2 are ordered" do
          let(:quantity) { 2 }
          it { is_expected.to eq(100) }
        end

        context "given an item that's on special (3 for $75)" do

          before { stub_const("SuperMarket::SPECIALS", special) }
          let(:special) do
            { "A" => {"type" => "NForX", "value" => "3 for 75"} }
          end

          context "when 3 are ordered" do
            let(:quantity) { 3 }
            it { is_expected.to eq(75) }
          end

          context "when 5 are ordered" do
            let(:quantity) { 5 }
            it { is_expected.to eq(175) }
          end

          context "when 8 are ordered" do
            let(:quantity) { 8 }
            it { is_expected.to eq(250) }
          end
        end
      end

    end
  end
end
