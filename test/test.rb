require_relative '../lib/yaml2json'

if __FILE__ == $0
  convert_yaml_to_json('./example.yaml', './configs.json', Encoding::UTF_8)
end