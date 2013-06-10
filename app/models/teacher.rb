class Teacher < ActiveRecord::Base
  attr_accessible :address, :alias_name, :comment, :deleted, :email, :first_name, :image_url, :last_name, :mobile, :position, :postcode, :pwd, :regist_name, :resume, :telephone, :title, :valid_certificate, :valid_certificate_no
end
