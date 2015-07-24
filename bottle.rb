
@bonus_soda = 0
@empty_bottles = 0
@bottlecaps = 0
@empty_bottle_bonus = 0
@bottlecap_bonus = 0

#TODO recursive logic 
#  cap and bottle amount need to save and record
# if used subtract
#add to total amount

def get_bottle_reward_amount(bottle_amount)
  @empty_bottles = bottle_amount % 2
  current_bonus = bottle_amount/2
  @empty_bottle_bonus += current_bonus
  current_bonus
end

def get_bottlecap_reward_amount(bottlecap_amount)
  @bottlecaps = bottlecap_amount % 4
  current_bonus = bottlecap_amount/4
  @bottlecap_bonus += current_bonus
  current_bonus
end

def get_bottle_buy_amount(cash)
  cash/2
end

def calculate_final_bottle_amount(bottles)
  if bottles == 0
    return @bonus_soda
  end

  @bottlecaps += bottles
  @empty_bottles += bottles

  bottle_reward = get_bottle_reward_amount(@empty_bottles)
  bottlecap_reward = get_bottlecap_reward_amount(@bottlecaps)

  reward = bottle_reward + bottlecap_reward

  @bonus_soda += reward

  calculate_final_bottle_amount(reward)
end

# $6 = 3 soda 4 free soda
first_bottles_amount = get_bottle_buy_amount(6)
puts "Bottles Bought #{first_bottles_amount}"
total_reward = calculate_final_bottle_amount(first_bottles_amount)
puts "Free Bottles Received #{total_reward}"
puts "Free Bottles Received From Empty Bottles #{@empty_bottle_bonus}"
puts "Free Bottles Received From Bottlecaps #{@bottlecap_bonus}"
puts "You have #{@empty_bottles} empty bottles left over and #{@bottlecaps} bottlecaps left over"