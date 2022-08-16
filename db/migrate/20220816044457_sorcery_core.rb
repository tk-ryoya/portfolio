class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :last_name,        null: false
      t.string :first_name,       null: false
      t.string :last_name_kana,   null: false
      t.string :first_name_kana,  null: false
      t.string :tel,              null: false
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.integer :role,            null: false, default: 0

      t.timestamps                null: false
    end
  end
end
