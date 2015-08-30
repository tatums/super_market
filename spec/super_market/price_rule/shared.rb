RSpec.shared_examples "a price rule" do
  subject(:item) { described_class.new("A", 1)  }
  it { expect(item).to respond_to(:price) }
end
