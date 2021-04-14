# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  photo      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  require 'elasticsearch/model'
  searchkick

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # Category.import(force: true)

  mount_uploader :photo, CategoryUploader
  has_many :words

  # class << self
  # 		def search(query_string)
  #     		__elasticsearch__.search(
	# 	        {
	# 	          query: {
	# 	            multi_match: {
	# 	              query: "#{query_string}",
	# 	              fields: ['name^10']
	# 	            }
	# 	          }
	# 	        }
  #     		)
  #     	end
  #   end

end
