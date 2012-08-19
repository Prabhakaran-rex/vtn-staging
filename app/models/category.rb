class Category < ActiveRecord::Base
	has_ancestry
	attr_accessible :ancestry, :name
	has_many :skills

	def self.json_tree(nodes)
		nodes.map do |node, sub_nodes|
			{:name => node.name, :id => node.id, :children => json_tree(sub_nodes).compact}
		end
	end
end
