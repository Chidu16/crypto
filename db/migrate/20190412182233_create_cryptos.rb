class CreateCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptos do |t|
      t.integer :curr_typ
      t.float :val
      t.date :date

      t.timestamps
    end
  end
end
