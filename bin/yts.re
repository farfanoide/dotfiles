#!/usr/bin/env ruby
# encoding: utf-8
# ------------------------------------------------------------------------------
# Description
# -----------
#
#   Script to show last 20 torrents uploaded to yts.re and
#   optionally download some of them
#
# ------------------------------------------------------------------------------
# Author
# -------
#
#  * Farfanoide (https://github.com/farfanoide)
#
# ------------------------------------------------------------------------------

require 'net/http'
require 'json'

movies = JSON.parse(Net::HTTP.get(URI('http://yts.to/api/list.json?sort=date&order=desc&limit=50')))['MovieList']
movies.each_with_index { |movie, index| puts "[#{index}] #{movie['MovieTitle']} -- (#{movie['Quality']}) -- (#{movie['Size']}) -- (★ #{movie['MovieRating']})" }
puts ''
puts 'To select a movie to download, just enter the movie\'s index'
puts 'if you want to select various torrents, enter them separated with a whitespace'
puts ''

if indexes = gets
  indexes = indexes.split(' ').map {|index| index.to_i}
  indexes.each do |index|
    movie = movies[index]
    `curl --progress -S #{movie['TorrentUrl']} -o "$HOME/Downloads/#{movie['MovieTitle']}.torrent"`
  end
end
