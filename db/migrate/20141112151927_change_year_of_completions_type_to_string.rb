class ChangeYearOfCompletionsTypeToString < ActiveRecord::Migration
  def change
	change_column :doctor_profiles, :year_of_completion,  :string
  end
end
