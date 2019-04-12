class Crypto < ApplicationRecord
    
    validates :date, presence: true
  validates :curr_type, presence: true

  enum curr_type: [:bitcoin, :ethereum, :ripple]

end
