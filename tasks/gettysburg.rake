desc 'Generate a word cloud of the Gettysburg address. Pdf with the cloud will be located in the pdf directory.'
task :gettysburg do
  temp = PaperSizes.new
  @paper_sizes = temp.paper_sizes
  @ordered_sizes = temp.ordered_sizes
  options = {:file => File.dirname(__FILE__) + '/../test/gettysburg.txt',
             :min_font_size => 12,
             :max_words => 100,
             :font => "Times-Roman",
             :palette => "winter",
             :lang => "EN",
             :distance_type => "ellipse",
             :short_name => "gettysburg_100_Times-Roman_horizontal_ellipse"          
  }
  t = time { 
    @cloud = WordCloud.new(options)
    @cloud.place_boxes("horizontal")
    @cloud.put_placed_boxes_in_pdf
    @cloud.dump_pdf
  }
  puts "execution took #{t} seconds"
end
  