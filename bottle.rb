require 'pry'

@bonus_soda = 0
@empty_bottles = 0
@bottlecaps = 0

#TODO recursive logic 
#  cap and bottle amount need to save and record
# if used subtract
#add to total amount

def get_bottle_reward_amount(bottle_amount)
  @empty_bottles = bottle_amount % 2
  bottle_amount/2
end

def get_bottlecap_reward_amount(bottlecap_amount)
  @bottlecaps = bottlecap_amount % 4
  bottlecap_amount/4
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

  puts "empty #{@empty_bottles} bottlecap #{@bottlecaps} reward #{@bonus_soda}"

  calculate_final_bottle_amount(reward)
end

# $6 = 3 soda 4 free soda
first_bottles_amount = get_bottle_buy_amount(6)
calculate_final_bottle_amount(first_bottles_amount)