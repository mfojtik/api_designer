require 'graphviz'
require 'erb'

module Designer
  module Graph

    GRAPH_ATTRIBUTES = {
      :rankdir => :LR,
      :ranksep => 0.5,
      :nodesep => 0.4,
      :pad => "0.4,0.4",
      :margin => "0,0",
      :concentrate => true,
      :labelloc => :t,
      :fontsize => 13,
      :fontname => "Arial Bold"
    }

    # Default node attributes.
    NODE_ATTRIBUTES = {
      :shape => "Mrecord",
      :fontsize => 10,
      :fontname => "Arial",
      :margin => "0.07,0.05",
      :penwidth => 1.0
    }

    # Default edge attributes.
    EDGE_ATTRIBUTES = {
      :fontname => "Arial",
      :fontsize => 8,
      :dir => :both,
      :arrowsize => 0.9,
      :penwidth => 1.0,
      :labelangle => 32,
      :labeldistance => 1.8,
      :fontsize => 7
    }



    NODE_WIDTH = 130

    def self.entity_template
      ERB.new(File.read(File.expand_path("templates/entity.erb", File.dirname(__FILE__))), nil, "<>")
    end

    def self.erd_plot(model, opts={})
      graph = GraphViz.digraph(opts[:title] || '')

      # Graphviz defaults
      #
      GRAPH_ATTRIBUTES.each { |attribute, value| graph[attribute]      = value }
      NODE_ATTRIBUTES.each  { |attribute, value| graph.node[attribute] = value }
      EDGE_ATTRIBUTES.each  { |attribute, value| graph.edge[attribute] = value }

      draw_nodes graph, model

      graph.output(:png => 'test.png')
    end

    def self.node_exists?(graph, node_name)
      !!graph.get_node(node_name)
    end

    def self.edge_style
      { :color => :grey60, :arrowtail => :onormal, :arrowhead => :none, :arrowsize => 1.2 }
    end

    def self.draw_nodes(graph, model)
      model.to_node(graph)
      model_module = const_get(model.name.split('::').first)
      model.relations.each { |r|
        begin
          relation_class = model_module.const_get(r.to_klass)
          next if node_exists?(graph, relation_class.entity_name)
          draw_nodes(graph, relation_class)
          graph.add_edges graph.get_node(relation_class.entity_name), graph.get_node(model.entity_name), edge_style
        rescue NameError
          warn "WARN: #{r.to_klass} model definition not found. Skipping..."
        end
      }
    end

  end

end
