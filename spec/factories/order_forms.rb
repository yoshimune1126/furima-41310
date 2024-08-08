FactoryBot.define do
  factory :order_form do
    postal_code {'123-4567'}
    prefecture_id {'2'}
    city {"横浜市"}
    address {'111'}
    building_name {''}
    phone_number {'09011231123'}
    token { 'your_valid_token' }

    
  end
end
