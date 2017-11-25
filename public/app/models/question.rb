class Question < ApplicationRecord
	has_many :answer


	validates :content, :name, presence: {message:'は、必須項目です。'}
end
