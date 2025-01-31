# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
<<<<<<< HEAD
#  username               :string
=======
>>>>>>> c4b797f8e412fc01ec60384b61439adf3303a238
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
<<<<<<< HEAD
  has_many :stores, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :product_item_dates, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :product_items, dependent: :destroy
  has_many :payments, dependent: :destroy

  # roles for authorizations
  enum :role, { 
    'Normal': 0,
    'Super Admin': 1,
    'Admin': 2
  }
=======
  has_many :stores
  has_many :customers
  has_many :product_item_dates
  has_many :products
  has_many :product_items
  has_many :payments

  enum :role, { 
        admin: 0,
        editor: 1,
   }
>>>>>>> c4b797f8e412fc01ec60384b61439adf3303a238
end
