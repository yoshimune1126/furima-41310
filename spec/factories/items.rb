FactoryBot.define do
  factory :item do
    association :user 
    item_name {"消しゴム"}
    item_description {"文字を消す筆記用具"}
    price {'500'}
    category_id {'1'}
    condition_id {'1'}
    shipping_fee_responsibility_id {'1'}
    prefecture_id {'1'}
    shipping_duration_id {'1'}
  end
end
