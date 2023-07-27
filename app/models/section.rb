class Section < ApplicationRecord
    belongs_to :course, foreign_key: :course_number
    has_many :meetings, foreign_key: :class_number
end
