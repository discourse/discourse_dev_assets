# frozen_string_literal: true

Dir[File.dirname(__FILE__) + '/**/*.rb'].each { |file| require file }

module DiscourseDevAssets
  require 'discourse_dev_assets/engine'

  def self.avatars
    # Using the stock avatar images from https://tinyfac.es
    # Tiny Faces is a free crowd-sourced avatar gallery
    Dir[File.join(__dir__, '..', 'avatars', '*.*')]
  end
end

require "active_record/database_configurations"

ActiveRecord::Tasks::DatabaseTasks.module_eval do
  alias_method :rails_each_current_configuration, :each_current_configuration

  private
  def each_current_configuration(environment, name = nil)
    rails_each_current_configuration(environment, name) { |db_config|
      next if environment == "development" &&
        ENV["SKIP_TEST_DATABASE"] == "1" &&
        db_config.configuration_hash[:database] != "discourse_development"

      yield db_config
    }
  end
end

require 'faker'

Faker::Base.instance_eval do
  alias :faker_translate :translate

  def translate(*args, **opts)
    if args[0] == "faker.lorem.words"
      args[0] = "faker.discourse.words"
    end

    faker_translate(*args, **opts)
  end
end

require 'literate_randomizer'

Faker::Lorem.instance_eval do
  alias :faker_sentence :sentence
  alias :faker_paragraph :paragraph

  NOT_GIVEN = Object.new

  def sentence(word_count: 4, supplemental: false, random_words_to_add: 15)
    faker_sentence(word_count: word_count, supplemental: supplemental, random_words_to_add: random_words_to_add)
  end

  def paragraph(options={})
    LiterateRandomizer.paragraph(options)
  end
end
