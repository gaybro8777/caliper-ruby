
require_relative './profile'
require_relative '../entities/digital_resource'
require_relative '../entities/annotation/annotation'
require_relative '../entities/reading/frame'

module Caliper
  module Profiles
    module AnnotationActions
      ATTACHED = "annotation.attached"
      BOOKMARKED = "annotation.bookmarked"
      CLASSIFIED = "annotation.classified"
      COMMENTED = "annotation.commented"
      DESCRIBED = "annotation.described"
      HIGHLIGHTED = "annotation.highlighted"
      IDENTIFIED = "annotation.identified"
      LIKED = "annotation.liked"
      LINKED = "annotation.linked"
      RANKED = "annotation.ranked"
      QUESTIONED = "annotation.questioned"
      RECOMMENDED = "annotation.recommended"
      REPLIED = "annotation.replied"
      SHARED = "annotation.shared"
      SUBSCRIBED = "annotation.subscribed"
      TAGGED = "annotation.tagged"
    end
    class ReadingProfile < Profile
      include AnnotationActions
      attr_accessor :key, # String
        :lookup # hash of ReadingActions

      # whether object if of type DigitalResource
      def validate_object (object)
        if  (object.is_a? AnnotationType::BOOKMARK_ANNOTATION)
          ## TODO check required properties
          return object
        elsif (object.is_a? AnnotationType::HIGHLIGHT_ANNOTATION)
          ## TODO check required properties
          return object
        elsif  (object.is_a? AnnotationType::SHARED_ANNOTATION)
          ## TODO check required properties
          return object
        elsif  (object.is_a? AnnotationType::TAG_ANNOTATION)
          ## TODO check required properties
          return object
        else
          fail "Object must be of type Annotation"
        end
      end

      # whether target is of type Frame
      def validate_target(target)
        if (target is_a? Frame)
          return target
        else
          fail "Target must be of type Frame."
        end
      end
    end
  end
end