import Config

config :app_importer, :data_store, type: "cache"

config :app_importer, :data_store_cache, key: :app_key

import_config "#{config_env()}.exs"
