class AddWidthToJifs < ActiveRecord::Migration
  def change
    add_column :jifs, :width, :string
    add_column :jifs, :height, :string
  end
end
