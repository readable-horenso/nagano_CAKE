class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  # 製作ステータス （０= 着手不可 / １= 製作待ち / ２= 製作中 / ３= 製作完了 ）
  enum status: {
    cannot_start: 0,
    production_pending: 1,
    in_production: 2,
    production_complete: 3
  }

end
