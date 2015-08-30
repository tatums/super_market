module SuperMarket
  module PriceRule
    class PercentageDiscount < PriceRule::Base

      def price
        item_total - amount_off
      end

      private

        def item_total
          (qty * price_per_item)
        end

        def amount_off
          item_total * percentage_off
        end

        def percentage_off
          SPECIALS[sku]["value"].to_f / 100
        end

    end
  end
end
