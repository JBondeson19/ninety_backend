if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_ninety_backend', domain: 'ninety_backend-json-api'
  else
    Rails.application.config.session_store :cookie_store, key: '_ninety_backend'
end
