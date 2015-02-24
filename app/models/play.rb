class Play < ActiveRecord::Base
  require "rexml/document"
  has_many :roles

  def self.upload(file)
    xml_file = File.read(file.path)
    doc = REXML::Document.new(xml_file)
    doc.elements.each('PLAY/TITLE') do |element|
      location = new
      location.title = element.text
      location.save!
    end
  end

end
