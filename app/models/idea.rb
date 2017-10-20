class Idea < ActiveRecord::Base
	belongs_to :user
	has_many :likes

	validates :idea, :presence => true, :length => { :in => 2..1000}
end