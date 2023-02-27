class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :pet_type
      t.string :breed
      t.string :name
      t.text :bio

      t.timestamps
    end
  end
end
