require 'spec_helper'

module SuperMarket
  describe CheckOut do

    describe "#scan" do
      it { is_expected.to respond_to(:scan) }
      it { is_expected.to be_truthy }
    end

    describe "#items" do
      it { expect(subject.items).to be_a(Array) }
    end

    context "when items are scanned" do
      it "returns the items scanned" do
        subject.scan("A")
        subject.scan("B")
        expect(subject.items ).to eq(["A", "B"])
      end
    end

    describe "#total" do
      context "when a percentage discount item is ordered" do
        it "gives a discount" do
          subject.scan("C")
          expect(subject.total).to eq(72)
        end
      end
      context "when an item is scanned" do
        it "returns the sum of the items" do
          subject.scan("A")
          expect(subject.total).to eq(50)
        end
        it "returns the sum of the items" do
          subject.scan("A")
          subject.scan("B")
          expect(subject.total).to eq(120)
        end
        it "returns the sum of the items" do
          subject.scan("A")
          subject.scan("A")
          subject.scan("A")
          subject.scan("A")
          subject.scan("A")
          expect(subject.total).to eq(175)
        end
      end
    end
  end
end
