class AddInstitutionToCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :institution_id, :integer
  end
end
