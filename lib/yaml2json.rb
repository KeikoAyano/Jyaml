require 'yaml'
require 'json'

# convert yaml to json
def convert_yaml_to_json(yaml_file, json_file, encoding)
  configs = YAML.load_file(yaml_file)
  content = JSON.generate(configs).class

  File.open(json_file, 'w', encoding: encoding) {
    |f| f.puts JSON.generate(configs)
  }
end