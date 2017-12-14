Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( devise_user.css )
Rails.application.config.assets.precompile += %w( load_image.js )
Rails.application.config.assets.precompile += %w( information.css homepage.css )
Rails.application.config.assets.precompile += %w( format_datepicker.js homepage.js )
Rails.application.config.assets.precompile += %w( employer.css f-style.css )
Rails.application.config.assets.precompile += %w( employer.js jquery.form.min.js)
Rails.application.config.assets.precompile += %w( ckeditor/filebrowser/images/gal_del.png )
