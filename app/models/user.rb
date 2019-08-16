class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


	# admin_user検索用, 動かず
	scope :search, -> (search_params) do
		return if search_params.blank?
		id_like(search_params[:id])
			.email(search_params[:email])
			.phone(search_params[:phone])
			.name(search_params[:name])
	end
		# scope :id_like,    -> (id)    { where('id LIKE ?',    "%#{id}%") if id.present? }
		# scope :email_like, -> (email) { where('email LIKE ?', "%#{email}%") if email.present? }
		# scope :phone_like, -> (like)  { where('phone LIKE ?',  "%#{phone}%") if like.present? }
		# scope :name_like,  -> (name)  { where('name LIKE ?',  "%#{name}%") if name.present? }
	  scope :name_like,  -> (name)  { where('name LIKE ?',  "%#{name}%") if name.present? }

end
