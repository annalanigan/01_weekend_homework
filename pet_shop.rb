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
  array = []
  for pet in shop[:pets]
    if pet[:breed] == breed_name
      array.push(pet)
    end
  end
  return array
end
