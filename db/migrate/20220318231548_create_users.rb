class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :stripe_account_id, null: true

      t.timestamps
    end
  end
end
