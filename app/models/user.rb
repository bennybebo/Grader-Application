class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
validates :email, presence: true, format: { with: /\A[a-zA-Z\-]+(\.[0-9]+)?@osu\.edu\z/, message: 'must be in OSU name.#@osu.edu format' }



  attribute :approved, :boolean, default: false

  def active_for_authentication?
    super && (approved? || user_type == 'Student')
  end

  def inactive_message
    approved? ? super : :not_approved
  end

end
