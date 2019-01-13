require 'generic'
require 'increase_in_value'
include IncreaseQuality

# name, sell_in, quality
class AgedBrie < Generic

  def update_quality
    if below_max_quality? and before_sell_in_period_ends?
      update_quality_by_before_sell_in_amount
    elsif below_max_quality? and not before_sell_in_period_ends?
      update_quality_by_after_sell_in_amount
    end
  end

  private

  def update_quality_by_before_sell_in_amount
    @quality += 1
  end

  def update_quality_by_after_sell_in_amount
    @quality == 49 ? @quality += 1 : @quality += 2
  end

end
