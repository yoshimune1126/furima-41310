FactoryBot.define do
  factory :item do
    association :user 
    item_name {"消しゴム"}
    item_description {"文字を消す筆記用具"}
    price {'500'}
    category_id {'2'}
    condition_id {'2'}
    shipping_fee_responsibility_id {'2'}
    prefecture_id {'2'}
    shipping_duration_id {'2'}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
