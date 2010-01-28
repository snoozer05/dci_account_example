# coding: utf-8
begin
  Encoding::default_external = 'UTF-8'
rescue NameError
  $KCODE = "u"
end

$LOAD_PATH << File.expand_path("../../app", File.dirname(__FILE__))

require 'rubygems'
require 'spec/expectations'
require 'cucumber'

