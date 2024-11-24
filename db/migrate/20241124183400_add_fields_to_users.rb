class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :cpf, :string
  end
end
