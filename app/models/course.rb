class Course < ApplicationRecord
    has_many :sections, foreign_key: :course_number, dependent: :destroy
end
