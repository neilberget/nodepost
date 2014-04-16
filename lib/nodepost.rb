require "nodepost/version"

require 'json'
require 'uri'
require 'open-uri'

module Nodepost
  class NodeGroupsClient
    def initialize(options={})
      @options = options
    end

    # Get hash representing the nodegroup
    def get_nodegroup(nodegroup)
      payload = { nodegroup: nodegroup, outputFormat: 'json' }

      response = api_request("nodegroups/get_nodegroup.php", payload)
      JSON.parse(response[0])['details']
    end

    # Get nodegroups from a node
    def get_nodegroups_from_node(node)
      payload = { node: node }

      api_request("nodes/get_nodegroups.php", payload)
    end

    # Get array of nodes from an expression
    def get_nodes_from_expression(expression)
      payload = { expression: expression }

      api_request("expression/get_nodes.php", payload)
    end

    # Get array of nodes from a nodegroup.
    def get_nodes_from_nodegroup(nodegroup)
      payload = { nodegroup: nodegroup }

      api_request("nodegroups/get_nodes.php", payload)
    end

    private

    def api_request(url, payload)
      payload = { outputFormat: 'list', statusHeader: 1 }.merge payload

      uri = URI.parse(@options[:base_url] + url)
      uri.query = URI.encode_www_form payload
      response = uri.open.read
      response.split "\n"
    end
  end
end
