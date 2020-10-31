class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.integer :total_points, :default => 10
      t.integer :accrued_points, :default => 0
      t.string :player_name
      t.timestamps
    end
  end
end
