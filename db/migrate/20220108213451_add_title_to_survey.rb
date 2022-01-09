class AddTitleToSurvey < ActiveRecord::Migration[6.1]
  def change
    add_column :surveys, :title, :string
    change_column_null :surveys, :title, false
  end
end
