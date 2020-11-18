Customer.create!(
  first_name: '太郎',
  last_name: '山田',
  kana_first_name: 'タロウ',
  kana_last_name: 'ヤマダ',
  postal_code: '0001111',
  address: '東京都中央区',
  phone_number: '09011112222',
  email: 'test@test.com',
  password: '111111'
)

Admin.create!(
  email: "admin@admin.com",
  password: "111111"
)