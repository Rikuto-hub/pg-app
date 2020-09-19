class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.references :user, null: false
      t.string :language, null: false
      t.string :title, null: false
      t.timestamps
    end
  end
end
