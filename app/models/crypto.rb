class Crypto < ApplicationRecord
    
    validates :date, presence: true
  validates :curr_typ, presence: true

  enum curr_typ: [:bitcoin, :ethereum, :ripple]

end
