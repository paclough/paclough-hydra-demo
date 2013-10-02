class Book < ActiveFedora::Base
  include Hydra::ModelMixins::RightsMetadata

  has_metadata 'descMetadata', type: Datastream::BookMetadata
  has_metadata :name => "rightsMetadata", :type => Hydra::Datastream::RightsMetadata

  has_many :pages, :property => :is_part_of

  delegate :title, to: 'descMetadata', unique: true
  delegate :author, to: 'descMetadata'
  delegate :publication_date, to: 'descMetadata', unique: true
end