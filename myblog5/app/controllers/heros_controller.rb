class HerosController < ApplicationController

  def index
    @name = Faker::Superhero.name

    @rand_num = rand(1..1000)
# avater
    @set_num = rand(1..4)
    if @set_num == 1
      @set = "set1"
    elsif @set_num == 2
      @set = "set2"
    elsif @set_num == 3
      @set = "set3"
    else
      @set = "set4"
    end
# background
    @bg = rand(1..2)
    if @bg == 1
      @gackground = "bg1"
    else
      @gackground = "bg2"
    end

    @hero_image = Faker::Avatar.image(@rand_num, "350x350", "png", @set, @gackground)
  end

end
