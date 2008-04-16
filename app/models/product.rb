class Product < ActiveRecord::Base
  
  has_many :backlog_items
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  attr_protected :image
  
  def file=(value)
    if value.size > 0
      t = Time.new
      
      self.image = "#{t.to_i}_#{File.basename(value.original_filename)}"
      filepath = "#{RAILS_ROOT}/public/images/products/#{self.image}"
      File.open(filepath, "wb") do |f|
        f.write(value.read)
      end
      
      image = Magick::Image.read(filepath).first
      File.delete("#{filepath}")
      image.change_geometry('100x100'){ |cols, rows, img|
        img.resize!(cols,rows)
      }  
      image.write("#{filepath}")
    end
  end
  
end
