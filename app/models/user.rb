class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
  	:validatable, :token_authenticatable, :lockable
end
