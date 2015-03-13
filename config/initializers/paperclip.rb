if Rails.env.production?

  s3_config = YAML.load_file(File.join(Rails.root, 'config', 's3.yml'))

  Paperclip::Attachment.default_options[:storage] = :fog
  Paperclip::Attachment.default_options[:fog_credentials] = {
    :provider              => 'AWS', 
    :aws_access_key_id     => s3_config['access_key_id'],
    :aws_secret_access_key => s3_config['secret_access_key'],
    :region                => 'eu-west-1'
  }
  Paperclip::Attachment.default_options[:fog_public]    = true
  Paperclip::Attachment.default_options[:fog_directory] = "sprycer"
  Paperclip::Attachment.default_options[:path] = ':attachment/:id/:style.:extension'
else
  Paperclip::Attachment.default_options[:path] = ':rails_root/public/system/:attachment/:id/:style.:extension' 
  Paperclip::Attachment.default_options[:url]  = '/system/:attachment/:id/:style.:extension'
end

Paperclip::Attachment.default_options[:default_url] = ":style/missing.png"
