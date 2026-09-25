require_relative '../lib/yaml2json'

if __FILE__ == $0
  begin
    jyaml = JYaml::JYaml.new("example.yaml")

    jyaml.to_json("out.json")
  
  rescue ArgumentError => e
    puts e
  end
end