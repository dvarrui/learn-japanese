#!/usr/bin/env ruby

require 'ruby2d'

set title: "LearnJapanese - ImageGame"
# set background: 'blue'

filepath = File.join(File.dirname(__FILE__), '..', 'data', 'images', 'book.png')
Image.new(filepath, x: 50, y: 50, z: 5)

Text.new(
  'What is this? Select the right answer.',
  x: 10, y: 380,
  size: 20,
  z: 10
)

Text.new(
  'Select the right answer (1, 2, 3, 4)',
  x: 10, y: 400,
  size: 20,
  z: 10
)

on :key_down do |event|
  puts event.key
  if event.key == 'q'
    exit 0
  end
end


show
