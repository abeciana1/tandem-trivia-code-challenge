require "json"
require 'pry'

class Quiz < ApplicationRecord
    has_many :questions

    def create_questions
        question_choice_json = File.read("Apprentice_TandemFor400_Data.json")
        quizzes_hash = JSON.parse(question_choice_json)
        quizzes_hash.map do |quiz|
            correct_ans = Choice.find_or_create_by(choice: quiz["correct"], correct: true, question_id: saved_ques.id, point_value: 1)
            saved_ques = Question.find_or_create_by(question: quiz["question"], quiz_id: self.id, correct_choice_id: correct_ans.id)
            binding.pry
            incorrect_ans = quiz["incorrect"].map { |wrong_ans| Choice.find_or_create_by(choice: wrong_ans, correct: false, question_id: saved_ques.id, point_value: 0) }
        end
    end

    def get_questions
        Question.all.sample(10).uniq.map do |question|
            question.quiz_id = self.id
        end
    end
end
