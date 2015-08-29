module SuperMarket
  module PriceRule
    class Base

      attr_reader :sku, :qty
      def initialize(sku, qty)
        @sku = sku
        @qty = qty
      end

      def price
        price_per_item * qty
      end

      private

        def price_per_item
          PRICES[sku]["price"]
        end
    end
  end
end
