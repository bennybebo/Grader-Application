class Section < ApplicationRecord
    belongs_to :course, foreign_key: :course_number
    has_many :meetings, foreign_key: :class_number, dependent: :destroy
    has_many :recommendations, foreign_key: :class_number, dependent: :destroy
    has_many :graders, foreign_key: :class_number, dependent: :destroy
    has_many :student_applications, foreign_key: :class_number, dependent: :destroy
end
