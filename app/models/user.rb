class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  delegate :can?, :cannot?, to: :ability

  enum role: { user: 0, admin: 1 }

  def ability
    @ability ||= Ability.new(self)
  end
end
