CarrierWave.configure do |c|
  # c.fog_provider = 'fog/aws'
  c.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ID'],
    aws_secret_access_key: ENV['AWS_SECRET'],
    region: 'us-west-2'
  }
  
  c.fog_directory = ENV['AWS_BUCKET']
  c.fog_attributes = {'Cache-Control' => "max-age=#{1.day.to_i}"}
end


# class FarmGalsUploader < CarrierWave::Uploader::Base 
  # include CarrierWave::MiniMagick
# 
  # version :test_size do 
    # process :resize_to_fill => [50, 50]
  # end
#   
  # version :thumb do 
    # process :resize_to_fill => [150, 150]
  # end
#   
    # def extension_white_list
    # %w(jpg jpeg gif png)
  # end
# 
#   
#   
# end