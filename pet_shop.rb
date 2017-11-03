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
  new_array = []
  for pet in shop[:pets]
    if pet[:breed] == breed_name
      new_array.push(pet)
    end
  end
  return new_array
end

def find_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
end
