class Question < ApplicationRecord
    belongs_to :quiz
    has_many :choices
    has_one :correct_choice, foreign_key: "correct_choice_id", class_name: "Choice"
end
