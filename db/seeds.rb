# Customer.create!(
#   id: 1,
#   first_name: '太郎',
#   last_name: '山田',
#   kana_first_name: 'タロウ',
#   kana_last_name: 'ヤマダ',
#   postal_code: '0001111',
#   address: '東京都中央区',
#   phone_number: '09011112222',
#   email: 'test@test.com',
#   password: '111111'
# )

# Admin.create!(
#   email: "admin@admin.com",
#   password: "111111"
# )

# Genre.create!(
#   [
#     {
#       id: 1,
#       name: "ケーキ"
#     },

#     {
#       id: 2,
#       name: "プリン"
#     },

#     {
#       id: 3,
#       name: "焼き菓子"
#     },

#     {
#       id: 4,
#       name: "キャンディ"
#     }

#   ]
# )


  # create_table "genres", force: :cascade do |t|
  #   t.string "name", null: false
  #   t.boolean "is_valid", default: false, null: false
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false



  #   t.integer "genre_id"
  #   t.string "name", null: false
  #   t.text "explanation", null: false
  #   t.integer "tax_out_price", null: false
  #   t.boolean "is_sale", default: false, null: false
  #   t.boolean記述の仕方は0 or 1　default: false, null: false　の場合はtrue or falseで記述

# Item.create!(
#   [
#     {
#       genre_id: 1,
#       id: 1,
#       name: "チョコケーキ",
#       explanation: "チョコの香りが素敵ですよ",
#       tax_out_price: 500,
#       image_id:"sample",
#       is_sale: true
#     },

#     {
#       genre_id: 1,
#       id: 2,
#       name: "イチゴケーキ",
#       explanation: "チョコの香りが素敵ですよ",
#       tax_out_price: 500,
#       image_id: "sample",
#       is_sale: true
#     },

#     {
#       genre_id: 2,
#       id: 3,
#       name: "抹茶プリン",
#       explanation: "抹茶の香りが素敵ですよ",
#       tax_out_price: 300,
#       image_id: "sample",
#       is_sale: true
#     },

#     {
#       genre_id: 3,
#       id: 4,
#       name: "フィナンシェ",
#       explanation: "上品な甘さが大人気",
#       tax_out_price: 400,
#       image_id: "sample",
#       is_sale: true
#     },
#     {
#       genre_id: 4,
#       id: 5,
#       name: "龍角散",
#       explanation: "あなたの風邪はどこから?喉から？",
#       tax_out_price: 800,
#       image_id: "sample",
#       is_sale: true
#     }
#   ]
#   )

  # CartItem.create!(
  # [
  #   {
  #     customer_id: 1,
  #     item_id: 1,
  #     quantity: 1
  #   },

  #   {
  #     customer_id: 1,
  #     item_id: 5,
  #     quantity: 6
  #   },
  # ]
  # )

Address.create!(
  [
    # {
    #   id: 1,
    #   customer_id: 1,
    #   name: '萩の月',
    #   postal_code: '123456',
    #   address: '東京都港区'
    # },
    
    {
      id: 2,
      customer_id: 1,
      name: 'じゃがりこ太郎',
      postal_code: '111111',
      address: '東京都千代田区丸の内'
    }
    
  ]
)