class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, presence: true, format: { with: /\A[a-zA-Z0-9_.+-]+@osu\.edu\z/, message: 'must be in OSU name.#@osu.edu format' }

  enum role: [:student, :instructor, :admin]

end
