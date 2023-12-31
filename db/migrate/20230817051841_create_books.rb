class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :publication_year
      t.boolean :availability

      t.timestamps
    end
  end
end
