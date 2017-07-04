class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  belongs_to :station

  def admin!
    self.is_admin = true
    self.save
  end

  def not_admin!
    self.is_admin = false
    self.save
  end

end
