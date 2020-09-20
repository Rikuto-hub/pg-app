class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :language, null: false
      t.string :title, null: false
      t.text :error, null: false
      t.text :content, null: false
      t.text :memo, null: false
      t.integer :number,null: false
      t.timestamps
    end
  end
end
