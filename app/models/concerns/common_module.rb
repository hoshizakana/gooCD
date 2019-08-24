module CommonModule
	extend ActiveSupport::Concern

	def consumption_tax
		return 1.08 #8%
	end

end
