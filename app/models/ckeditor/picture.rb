class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :storage => :s3,
                    :s3_credentials => {
                      :bucket => ENV['S3_BUCKET_NAME'],
                      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    },
                    :path => ":attachement/:id/:style_:basename.:extension",
                    :url => "gradezilla.s3.amazonaws.com",
                    # :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    # :path => ":rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :styles => { :content => '800>', :thumb => '118x100#' }

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_content_type :data, :content_type => /\Aimage/

  def url_content
    url(:content)
  end
end
