class RemoveNullConstraintFromUser < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :username, :string, :null => true 
    change_column_null :users, :password_digest, :string, :null => true
  end
end
