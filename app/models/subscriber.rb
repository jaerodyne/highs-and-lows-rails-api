class Subscriber < ApplicationRecord
	validates :email, presence: true, uniqueness: true
	validates :email, format: {
	                    with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
	                  }
end
