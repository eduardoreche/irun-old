require 'RMagick'

class User < ActiveRecord::Base
  
  has_many :backlog_items
  has_many :tasks
  has_many :developers
  
  attr_protected :image
  
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password
  validates_confirmation_of :password
  validates_length_of :password, :within => 6..15

  def authenticate(email,password)
    user = User.find_by_email_password(email,password)
  end
  
  def file=(value)
    if value.size > 0
      t = Time.new
      
      self.image = "#{t.to_i}_#{self.id}.jpg"
      filepath = "#{RAILS_ROOT}/public/images/users/#{self.image}"
      File.open(filepath, "wb") do |f|
        f.write(value.read)
      end
      
      image = Magick::Image.read(filepath).first
      image.change_geometry('100x100'){ |cols, rows, img|
        img.resize!(cols,rows)
      }  
      image.write("#{filepath}")
    end
  end
  
end
