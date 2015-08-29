module SuperMarket
  class CheckOut
    attr_reader :items
    def initialize
      @items = []
    end

    def scan(item)
      @items << item
    end

    def total
      items_summed.map {  |key, value|
        if SPECIALS.keys.include?(key)

          PriceRule.const_get(SPECIALS[key]["type"]).new(key,value).price
        else
          PriceRule::Base.new(key,value).price
        end
      }.inject(:+)
    end

    private

      def items_summed
        items.each_with_object(
          Hash.new(0)
        ) { |item, counts| counts[item] += 1 }
      end

  end
end
