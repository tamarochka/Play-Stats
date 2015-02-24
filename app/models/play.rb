class Play < ActiveRecord::Base
  require "rexml/document"
  has_many :roles

  def self.upload(file)
    xml_file = File.read(file.path)
    @doc = REXML::Document.new(xml_file)
    @doc.elements.each('PLAY/TITLE') do |element|
      @play = new
      @play.title = element.text
      @play.save!
    end
    self.create_roles
  end

  private
  def self.create_roles
    @doc.elements.each('PLAY/PERSONAE/PERSONA') do |role_element|
      role = Role.new
      role.name = role_element.text
      role.play = @play
      role.save!
    end
  end

end
