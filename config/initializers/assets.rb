Rails.application.config.assets.version = "1.0"
Rails.application.config.assets.paths << Rails.root.join("node_modules")
Rails.application.config.assets.precompile += %w( devise_users/devise_user.css jobs/job.css )
Rails.application.config.assets.precompile += %w( load_image.js )
Rails.application.config.assets.precompile += %w( companies/company.css homepages/homepage.css )
Rails.application.config.assets.precompile += %w( format_datepicker.js homepage.js )
Rails.application.config.assets.precompile += %w( employers/employer.css homepages/f-style.css )
Rails.application.config.assets.precompile += %w( employer.js jquery.form.min.js)
