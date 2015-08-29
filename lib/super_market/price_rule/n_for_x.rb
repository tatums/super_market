module SuperMarket
  module PriceRule
    class NForX < PriceRule::Base

      def price
        if qty >= special_qty
          remainder = qty % special_qty
          (special_price * ( qty / special_qty ) ) + PriceRule::Base.new(sku, remainder).price
        else
          super
        end
      end

      private

        def special_qty
          SPECIALS[sku]["value"].split(" for ").first.to_i
        end

        def special_price
          SPECIALS[sku]["value"].split(" for ").last.to_i
        end
    end
  end
end
