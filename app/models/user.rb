# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :messages
  has_many :likes
  has_many :goals
  has_many :threemonths_goals
  has_many :monthly_goals
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
end
