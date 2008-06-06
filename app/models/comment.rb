class Comment < ActiveRecord::Base
  
  belongs_to :user
  
  validates_presence_of :user
  validates_presence_of :comment
  validates_length_of :attachment, :within => 0..255
  
  def file=(value)
    if value.size > 0
      t = Time.new
      self.attachment = "#{t.to_i}_#{File.basename(value.original_filename)}"
      filepath = "#{RAILS_ROOT}/public/uploads/attachments/#{self.attachment}"
      File.open(filepath, "wb") do |f|
        f.write(value.read)
      end
    end
  end
  
end
