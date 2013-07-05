# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
   include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    return "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
     # For Rails 3.1+ asset pipeline compatibility:
     # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  
   #  "/images/fallback/" + [thumb, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end
  version :thumb do  
    process :resize_to_fill => [180, 160]  
  end  
=begin  
  version :normal do  
    process :resize_to_fill => [180, 180]  
  end  
=end    
  version :small_thumb, :from_version => :thumb do
    process resize_to_fill: [80, 80]
  end
  
  #version :original  

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  def filename  
    if @filename  
      #Digest::SHA1.hexdigest(original_filename) + File.extname(@filename)  
    Time.now.to_i.to_s + File.extname(@filename) 
    end     
  end  
end
