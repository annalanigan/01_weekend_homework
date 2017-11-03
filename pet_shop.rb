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

# def find_pet_by_name(shop, name)
#   for pet in shop[:pets]
#      return pet if pet[:name] == name
#   end
# end

def find_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
     return pet
   end
  end
  return nil
end

def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
     shop[:pets].delete(pet)
   end
  end
end

def add_pet_to_stock(shop, new_pet)
  shop[:pets]<<new_pet
end

def customer_pet_count(customer)
  customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets]<<new_pet
end

#OPTIONAL

def customer_can_afford_pet(customer, pet)
  customer[:cash] >= pet[:price] ? true : false
end



def sell_pet_to_customer(shop, pet, customer)
  if pet == nil
   p "No pet of that name"
  else customer_can_afford_pet(customer,pet)
   add_pet_to_customer(customer, pet)
   add_or_remove_cash(shop, pet[:price])
   customer[:cash] -= pet[:price]
   increase_pets_sold(shop, 1)
 end
end
