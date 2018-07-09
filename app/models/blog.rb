class Blog < ApplicationRecord
	enum status: { draft: 0 , published: 1 }
	default_scope { order(id: :desc) }
	validates_presence_of :title, :body

	belongs_to :topic
end
