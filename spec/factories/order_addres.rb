FactoryBot.define do
  factory :order_addres do
    postcode {"246-0037"}
    area_id {2}
    city     {"横浜市"}
    block    {"横浜1-1"}
    building {"スリーエイト瀬谷"}
    phone_number {"09011112222"}
  end
end
