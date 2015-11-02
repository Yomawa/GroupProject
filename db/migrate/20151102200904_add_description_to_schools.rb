class AddDescriptionToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :description, :string
  end
end
