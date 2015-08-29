require 'spec_helper'

module SuperMarket
  module PriceRule
    describe NForX do

      subject(:item) { described_class.new("A", quantity)  }
      describe "#price" do

        context "given an item that cost 50 and a qty of 2" do
          let(:quantity) { 2 }
          it "returns 100" do
            expect(item.price).to eq(100)
          end
        end

        context "given an item that's on special" do
          before { stub_const("SuperMarket::SPECIALS", special) }

          context "special is 3 for 75 and 3 are ordered" do
            let(:special) do
              { "A" => {"type" => "NForX", "value" => "3 for 75"} }
            end
            context "when 3 are ordered" do
              let(:quantity) { 3 }
              it { expect(item.price).to eq(75) }
            end
            context "when 5 are ordered" do
              let(:quantity) { 5 }
              it { expect(item.price).to eq(175) }
            end
            context "when 8 are ordered" do
              let(:quantity) { 8 }
              it { expect(item.price).to eq(250) }
            end
          end
        end
      end

    end
  end
end
