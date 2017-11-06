def pet_shop_name(shop)
  shop[:name]
end

def total_cash(shop)
  shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, value)
  shop[:admin][:total_cash] += value
end

def pets_sold(shop)
  shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, value)
  shop[:admin][:pets_sold] += value
end

def stock_count(shop)
  shop[:pets].count
end

def pets_by_breed(shop, breed_name)
  breed_array = []
  for pet in shop[:pets]
    if pet[:breed] == breed_name
      breed_array.push(pet)
    end
  end
  return breed_array
end

# # Homework solution from class notes:
# def pets_by_breed(pet_shop, breed)
#   matches = []
#   for pet in pets_in_stock(pet_shop)
#     matches << pet if(pet[:breed] == breed)
#   end
#   return matches
# end

def find_pet_by_name(shop, name)
  for pet in shop[:pets]
     return pet if pet[:name] == name
  end
  return nil
end

# # my first solution:
# def remove_pet_by_name(shop, name)
#   for pet in shop[:pets]
#     if pet[:name] == name
#      shop[:pets].delete(pet)
#    end
#   end
# end

def remove_pet_by_name(shop, name)
  pet = find_pet_by_name(shop, name)
  shop[:pets].delete(pet)
end

# # HOMEWORK SOLUTION:
# Why the Index - implications further down the code? by removing an item...?
#
# def remove_pet_by_name(pet_shop, pet_name)
#   pets = pets_in_stock(pet_shop)
#   index = 0
#   match = nil
#
#   for pet in pets
#     if(pet[:name] == pet_name)
#       match = pet
#       break
#     end
#     index += 1
#   end
#
#   return if(match == nil)
#   pets.delete_at(index)
# end



def add_pet_to_stock(shop, new_pet)
  shop[:pets] << new_pet
end

def customer_pet_count(customer)
  customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

#OPTIONAL

def customer_can_afford_pet(customer, pet)
  customer[:cash] >= pet[:price] ? true : false
end

# def sell_pet_to_customer(shop, pet, customer)
#   if pet == nil
#    p "No pet of that name"
#  else customer_can_afford_pet(customer,pet) == true
#    add_pet_to_customer(customer, pet)
#    add_or_remove_cash(shop, pet[:price])
#    customer[:cash] -= pet[:price]
#    remove_pet_by_name(shop, pet[:name])
#    increase_pets_sold(shop, 1)
#  end
# end

# Matt adjustments!
def sell_pet_to_customer(shop, pet, customer)
  if pet == nil
    return
  elsif customer_can_afford_pet(customer,pet) == false
   return
  else
   add_pet_to_customer(customer, pet)
   add_or_remove_cash(shop, pet[:price])
   customer[:cash] -= pet[:price]
   remove_pet_by_name(shop, pet[:name])
   increase_pets_sold(shop, 1)
 end
end

# # OPTIONALS from the HOmework Solution::
#
# def customer_can_afford_pet(customer, pet)
#   return customer[:cash] >= pet[:price]
# end
#
# def sell_pet_to_customer(pet_shop, pet, customer)
#   return if (pet == nil)
#   return if !(customer_can_afford_pet(customer, pet))
#
#   add_pet_to_customer(customer,pet)
#   add_or_remove_cash(pet_shop, pet[:price])
#   remove_pet_by_name(pet_shop, pet[:name])
#   increase_pets_sold(pet_shop,1)
# end
