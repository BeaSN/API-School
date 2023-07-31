class AddColorsToInstitutions < ActiveRecord::Migration[7.0]
  def change
    add_column :institutions, :color_1, :string
    add_column :institutions, :color_2, :string
    add_column :institutions, :color_3, :string
    add_column :institutions, :color_4, :string
  end
end
