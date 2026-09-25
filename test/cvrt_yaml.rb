require_relative '../lib/yaml2json'

if __FILE__ == $0
  begin
    jyaml = JYaml::JYaml.new("configs.json")

    jyaml.to_yaml("out.yaml")
  
  rescue ArgumentError => e
    puts e
  end
end