# Make sure the config file exists and load it
CONFIG_FILE = File.join(::Rails.root, "config", "application.yml")
unless File.exists? CONFIG_FILE
  puts
  puts "ERROR"
  puts "The configuration file does not exists!"
  puts "Path: #{CONFIG_FILE}"
  puts
  exit
end

full_config = YAML.load_file(CONFIG_FILE)

config = full_config["default"]
config_env = full_config[Rails.env]
config.merge!(config_env) unless config_env.nil?

configatron.configure_from_hash(config)
