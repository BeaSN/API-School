class AddPasswordToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :password, :string
  end
end
