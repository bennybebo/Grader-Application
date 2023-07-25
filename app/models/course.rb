class Course < ApplicationRecord
    has_many :sections, foreign_key: :course_number, dependent: :destroy
    has_many :meetings, through: :sections
end
