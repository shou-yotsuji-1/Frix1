class AddCollegeAgeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users,:college,:string
    add_column :users,:age,:string
  end
end
