require 'yaml'
require 'json'

module JYaml

  class JYaml
    def initialize(file_name)
      # init content from file
      # support file type: yaml, json
      # raise exception if file type not support
      
      # get file extension
      ext = File.extname(file_name)

      if ext == '.yaml'
        @content = load_yaml(file_name)
      elsif ext == '.json'
        @content = load_json(file_name)
      else
        raise ArgumentError.new("unsupport file type")
      end

    end

    attr_reader :content

    def load_yaml(file_name)
      return YAML.load_file(file_name)
    end

    def load_json(file_name)
      json = JSON.create_id()
      
      return JSON.load_file(file_name)
    end

    def to_json(save_name)
      File.write(save_name, @content.to_json)
    end

    def to_yaml(save_name)
      File.open(save_name, "w") do |file|
        file.write(@content.to_yaml)
      end
    end

  end
end

# convert yaml to json
def convert_yaml_to_json(yaml_file, json_file, encoding)
  configs = YAML.load_file(yaml_file)
  content = JSON.generate(configs).class

  File.open(json_file, 'w', encoding: encoding) {
    |f| f.puts JSON.generate(configs)
  }
end