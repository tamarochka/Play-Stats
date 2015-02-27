class Play < ActiveRecord::Base
  require "rexml/document"
  has_many :roles
  has_many :scenes

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
    self.create_scenes
  end

  def self.create_scenes
    @doc.elements.each("PLAY/ACT") do |act_element|
      act_element.elements.each("SCENE") do |scene_element|
        scene = Scene.new
        scene.name = scene_element.elements["TITLE"].text
        scene.play = @play
        scene.save!
        scene_element.elements.each("SPEECH") do |speech_element|
          speaker = speech_element.elements["SPEAKER"].text

          if !@play.roles.find_by(name: speaker).nil?
            speech = Speech.new
            speech.role = @play.roles.find_by(name: speaker)
            speech.scene = scene
            speech.save!

            speech_element.elements.each("LINE") do |line_element|
              line = Line.new
              line.speech = speech
              line.body = line_element.text
              line.save!
            end
          end
        end
      end
    end
  end

end
