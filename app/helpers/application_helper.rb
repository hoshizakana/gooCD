module ApplicationHelper

# # 価格計算について
#
# # 税率の設定
# 	tax = 1.08 # 8%
#
# # 単価表示
# 	product.price * tax
# # カート・注文の商品あたり計
#
# # カート・注文の小計
# # カート・注文の合計
# # カート・注文の商品あたり計

# #










	def taxed_price_helper(product)
		taxed_price = product.price * 1.08
		taxed_price.floor
	end
end
