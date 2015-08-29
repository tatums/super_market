require "super_market/version"
require "super_market/check_out"
require "super_market/price_rule/base"
require "super_market/price_rule/n_for_x"
require "super_market/price_rule/percentage_discount"

module SuperMarket

    PRICES = {
          "A" => {"price" => 50},
          "B" => {"price" => 70},
          "C" => {"price" => 80}
        }

    SPECIALS = {
      "A" => {"type" => "NForX", "value" => "3 for 75"},
      "C" => {"type" => "PercentageDiscount", "value" => "10"}
    }
end
