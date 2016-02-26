class CreateJifs < ActiveRecord::Migration
  def change
    create_table :jifs do |t|
      t.string :jif_path
      t.string :static_path
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
