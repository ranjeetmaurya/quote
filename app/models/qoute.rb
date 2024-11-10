class Qoute < ApplicationRecord
	validates :name, presence: true
	scope :ordered, lambda { order(id: :desc)}

	# after_create_commit -> { broadcast_prepend_later_to "qoutes" }
	# after_update_commit -> { broadcast_replace_later_to "qoutes" }
	# after_destroy_commit -> { broadcast_remove_to "qoutes" }

	broadcasts_to ->(qoute) { "qoutes" }, inserts_by: :prepend
end
