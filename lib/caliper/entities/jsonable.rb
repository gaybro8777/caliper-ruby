require 'json'

#
#  @author Prashant Nayak
#  @copyright @copyright ©2013 IMS Global Learning Consortium, Inc.  All Rights Reserved.
#  @license For license information contact, info@imsglobal.org
#
#  Module that supports ser-des for Caliper Entities/JSON
#
module Caliper
  module Entities
    module Jsonable

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
      end

      def to_json(*a)
        # puts 'Jsonable: to_json invoked'
        result = {}
        result['@id'] = self.id
        result['@type'] = self.type
        self.instance_variables.each do |key|
          # puts "got key = #{key}"
          next if (key[1..-1] == 'id' || key[1..-1] == 'type')
          value = self.instance_variable_get key
          # puts "setting #{key}: #{value}"
          result[key[1..-1]] = value
        end
        result.to_json(*a)
      end

      def from_json json_hash
        data = json_hash
        # puts "Jsonable: from_json: json_hash = #{json_hash}"
        self.id = data['@id']
        self.type = data['@type']
        self.name = data['name']
        json_hash.each do | key, value |
          next if (key[1..-1] == 'id' || key[1..-1] == 'type')
          # puts "Jsonable - adding #{key} : #{value}"
          self.instance_variable_set "@#{key}", value
        end
        return self
      end

      def eql?(other)
        @id == other.id && @type == other.type && @name == other.name && @description == other.description && @dateCreated == other.dateCreated && @dateModified == other.dateModified
      end

    end
  end
end