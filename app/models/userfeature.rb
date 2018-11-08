class Userfeature < ApplicationRecord
  belongs_to :user
  before_validation :culculate_calorie_macro
  enum activity: { high: 0, middle: 1, low: 2 }
  enum purpose: { increase: 0, maintain: 1, loss: 2 }

  private

# カロリーやマクロ栄養素の計算式に関しては、以下のURLの”計算の解説”を参照
# https://dietgenius.jp/macro-nutrient-calculator/#1492304410953-fc2d4b82-8b8c
  def culculate_calorie_macro
    culculate_calorie()
    culculate_macro()
  end

  def culculate_calorie
    gender_num = user.male? ? 5 : -161
    activity_val = activity_value()
    purpose_val =  purpose_value()
    basic_calorie = (10 * weight) + (6.25 * height) -
                    (5 * age) + gender_num
    self.total_calorie = basic_calorie * activity_val * purpose_val
  end

  def culculate_macro
    self.protein = weight * 2
    self.fat = total_calorie / (4 * 9)
    self.carbo = (total_calorie -
                     (protein * 4) - (fat * 9)) / 4
  end

  def activity_value
    return 1.2 if low?
    return 1.55 if middle?
    return 1.725 if high?
  end

  def purpose_value
    return 0.8 if loss?
    return 1 if maintain?
    return 1.2 if increase?
  end
end