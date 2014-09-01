#!/usr/bin/env ruby
# encoding: utf-8

require 'net/http'
require 'json'

movies = JSON.parse(Net::HTTP.get(URI('http://yts.re/api/list.json?sort=date&order=desc')))['MovieList']
movies.each_with_index { |m, index| puts "[#{index}] #{m['MovieTitle']} -- (#{m['Size']})" }
puts ''
puts 'To select a movie to download, just enter the movie\'s index'
puts 'if you want to select various torrents, enter them separated with a whitespace'
puts ''
indexes = gets
if indexes
  indexes = indexes.split(' ').map {|i| i.to_i}
  indexes.each do |index|
    movie = movies[index]
    `curl -S #{movie['TorrentUrl']} -o "$HOME/Downloads/#{movie['MovieTitle']}.torrent"`
  end
end
