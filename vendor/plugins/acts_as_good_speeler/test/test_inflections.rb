$:.unshift(File.dirname(__FILE__) + '/../../../rails/activesupport/lib')

require 'test/unit'

begin
  require File.dirname(__FILE__) + '/../../../rails/activesupport/lib/active_support/inflector.rb'
  require File.dirname(__FILE__) + '/../../../rails/activesupport/lib/active_support/core_ext/string.rb'
rescue LoadError
  raise "You need to freeze Rails to be able to run the tests."
end

class TestInflections < Test::Unit::TestCase
  SINGULAR_INFLECTIONS = [ 
    ["humans", "human"], 
    ["penises", "penis"], 
    ["appendices", "appendix"], 
    ["stimuli", "stimulus"],
    ["hippopotami", "hippopotamus"],
    ["foci", "focus"],
    ["syllabi", "syllabus"],
    ["alumni", "alumnus"],
    ["fungi", "fungus"],
    ["radii", "radius"],
    ["torpedoes", "torpedo"],
    ["memoranda", "memorandum"],
    ["phenomena", "phenomenon"],
    ["criteria", "criterion"],
    ["germans", "german"],
    ["shamans", "shaman"],
    ["nebulae", "nebula"],
    ["formulae", "formula"],
    ["vitae", "vita"],
    ["vertebrae", "vertebra"],
    ["algae", "alga"],
    ["alumnae", "alumna"],
    ["teeth", "tooth"],
    ["dice", "die"],
    ["talismans", "talisman"],
    ["pokemon", "pokemon"],
    ["pokémon", "pokémon"]
  ]
  
  PLURAL_INFLECTIONS = [ 
    ["penises", "penis"], 
    ["appendices", "appendix"], 
    ["stimuli", "stimulus"],
    ["hippopotami", "hippopotamus"],
    ["syllabi", "syllabus"],
    ["foci", "focus"],
    ["alumni", "alumnus"],
    ["fungi", "fungus"],
    ["radii", "radius"],
    ["memoranda", "memorandum"],
    ["phenomena", "phenomenon"],
    ["criteria", "criterion"],
    ["nebulae", "nebula"],
    ["formulae", "formula"],
    ["vitae", "vita"],
    ["vertebrae", "vertebra"],
    ["algae", "alga"],
    ["alumnae", "alumna"],
    ["teeth", "tooth"],
    ["dice", "die"],
    ["cookies", "cookie"],
    ["rookies", "rookie"],
    ["bookies", "bookie"],
    
    # If you try to singularize these (even though
    # they're singular already) the result is wrong.
    ["dress", "dress"],
    ["press", "press"]
  ]
  
  def setup
    Inflector.inflections.clear
  end
  
  def test_stock_inflections_suck
    require File.dirname(__FILE__) + '/../../../rails/activesupport/lib/active_support/inflections.rb'
    
    SINGULAR_INFLECTIONS.each do |pair|
      assert_not_equal pair[0], pair[1].pluralize
    end
    
    PLURAL_INFLECTIONS.each do |pair|
      assert_not_equal pair[1], pair[0].singularize 
    end 
  end
  
  def test_our_inflections_rock_face
    require File.dirname(__FILE__) + '/../lib/inflections.rb'
    
    SINGULAR_INFLECTIONS.each do |pair|
      assert_equal pair[0], pair[1].pluralize
    end
    
    PLURAL_INFLECTIONS.each do |pair|
      assert_equal pair[1], pair[0].singularize 
    end
  end
end