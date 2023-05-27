class Destination < ApplicationRecord
  belongs_to :customer
  
  #セレクトボックス内に「郵便番号 住所 宛名」を表示するためのアクション
  def address_display
  '〒' + postcode + ' ' + address + ' ' + name
  end
end
