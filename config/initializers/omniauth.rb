Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,  '480880615300034', 'f30fb539ef7dbd4b4c3f0cf71716cff8', {client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}, :scope => 'email,user_birthday,read_stream', :display => 'page'}
end