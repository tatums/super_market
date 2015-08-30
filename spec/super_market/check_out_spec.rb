require 'spec_helper'

module SuperMarket
  describe CheckOut do
    subject(:checkout) { described_class.new }
    describe "#scan" do
      it { is_expected.to respond_to(:scan) }
      it { is_expected.to be_truthy }
    end

    describe "#items" do

      it { expect(subject.items).to be_a(Array) }

      context "when items are scanned" do
        subject(:checkout) do
          c = described_class.new
          c.scan("A")
          c.scan("B")
          c.items
        end
        it { is_expected.to eq(["A", "B"])  }
      end

    end

    describe "#total" do
      before { stub_const("SuperMarket::PRICES", prices) }
      before { stub_const("SuperMarket::SPECIALS", specials) }
      let(:prices) do
        {
          "A" => {"price" => 50},
          "B" => {"price" => 70},
          "C" => {"price" => 80}
        }
      end
      let(:specials)do
        {
          "A" => {"type" => "NForX", "value" => "3 for 75"},
          "C" => {"type" => "PercentageDiscount", "value" => "10"}
        }
      end

      context "when a 80 priced item is scanned and there is a 10% discount" do
        subject(:checkout) {
          c = described_class.new
          c.scan("C")
          c.total
        }
        it { is_expected.to eq(72) }
      end

      context "when a 50 priced item is scanned" do
        subject(:checkout) {
          c = described_class.new
          c.scan("A")
          c.total
        }
      end

      context "when a $50 item and a $70 item is scanned" do
        subject(:checkout) {
          c = described_class.new
          c.scan("A")
          c.scan("B")
          c.total
        }
        it { is_expected.to eq(120) }
      end

      context "when 5 x $50 items are scanned & there's a 3 for $75 special" do
        subject(:checkout) {
          c = described_class.new
          c.scan("A")
          c.scan("A")
          c.scan("A")
          c.scan("A")
          c.scan("A")
          c.total
        }
        it { is_expected.to eq(175) }
      end
    end
  end
end
