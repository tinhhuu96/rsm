Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( devise_user.css )
Rails.application.config.assets.precompile += %w( format_datepicker.js )
Rails.application.config.assets.precompile += %w( employer.css )
Rails.application.config.assets.precompile += %w( employer.js )
Rails.application.config.assets.precompile += %w( load_image.js )
