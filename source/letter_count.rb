require 'json'

class StringSize

	attr_accessor :query 

	def initialize(query)
		@query = query.strip
	end

	def string_size
		query.size
	end

	def content
		if string_size == 0
			"Clipboard doesnt contain any text"
		else
			query
		end	
	end
end

class AlfredOutput
	def generate
		ss = StringSize.new(`pbpaste`)
		line_items = []

		line_items << {
			type: "default",
			title: "String size",
			subtitle: ss.string_size,
			arg: ss.query
		}

		line_items << {
			type: "default",
			title: "Clipboard content",
			subtitle: ss.content,
			arg: ss.query
		}

		puts ({items: line_items}.to_json)
	end
end

AlfredOutput.new.generate


