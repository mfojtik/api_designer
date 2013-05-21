module Designer
  class Entity

    extend Schema
    extend DSL
    extend Graph

    href    :id
    string  :name

    def self.to_s
      "#{super}(#{self.attributes})"
    end

    def self.entity_name
      name.split('::').last
    end

    def self.to_node(graph)
      graph.add_nodes entity_name, :label => Graph.entity_template.result(binding)
    end


  end
end
