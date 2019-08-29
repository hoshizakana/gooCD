module HomesHelper
	def maxof(x,y)
		# x,yの大きいほうを返す
    return (x > y) ? x : y
	end
	def minof(x,y)
		# x,yの小さいほうを返す
		return (x < y) ? x:y
	end
end
