#class ProductSearchForm
#  include ActiveModel::Model
#
#  attr_accessor :id, :name
#
#  def search
#    rel = Product
#    rel = rel.where(id: id) if id.present?
#    rel = rel.where(name: name) if name.present?
#    #rel = rel.joins(:artist).where("artist.name") if name.present?
#    rel
#  end
#end
