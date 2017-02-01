class AlolashiniesController < ApplicationController
  def index
    if params[:pokemon] != nil
      require 'yaml'
      parsed = begin
        YAML.load(File.open("./app/assets/pokedex.yml"))
      rescue ArgumentError => e
        puts "Could not parse YAML: #{e.message}"
      end
      pokemon_chosen = params[:pokemon].downcase
      @pokemon = {
        pokemon: pokemon_chosen
      }
      def shiny_definer(pokemon)
          def alolan_images_array(hash_index)
              @images = ["http://www.serebii.net/sunmoon/pokemon/%03d.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d.png" % @dex[hash_index],
                          "http://www.serebii.net/sunmoon/pokemon/%03d-a.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d-a.png" % @dex[hash_index]] 
          end
          def regular_images_array(hash_index)
              @images = ["http://www.serebii.net/sunmoon/pokemon/%03d.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d.png" % @dex[hash_index]]
          end
          # CHECK IF POKEMON ENTERED IS IN DEX HASH
          pokemon_for_logic = pokemon.to_sym
          if @dex.key?(pokemon_for_logic)
              one_up = @dex[pokemon_for_logic] + 1
                  if @dex.value?(one_up)
                      @next_pokemon = @dex.key(one_up).to_s
                  end
              one_down = @dex[pokemon_for_logic] - 1
                  if @dex.value?(one_down)
                      @prev_pokemon = @dex.key(one_down).to_s
                  end
              hash_index = pokemon_for_logic
              @redirect = "http://www.serebii.net/pokedex-sm/%03d.shtml" % @dex[hash_index]
              
              # CREATE ALOLAN FORMS AND SPECIAL PKMN ARRAYS OF SYMBOLS
              alolan = %i[raichu meowth persian grimer muk diglett dugtrio marowak geodude graveler golem sandshrew sandslash vulpix ninetails exeggutor]
              special = %i[oricorio lycanroc wishiwashi zygarde minior shellos gastrodon]
              
              # GENERATE IMAGES ARRAY / START WITH SPECIAL FORMS POKEMON
              if pokemon_for_logic == special[0] #ORICORIO
                  @images = ["http://www.serebii.net/sunmoon/pokemon/%03d.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d.png" % @dex[hash_index],
                              "http://www.serebii.net/sunmoon/pokemon/%03d-p.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d-p.png" % @dex[hash_index],
                              "http://www.serebii.net/sunmoon/pokemon/%03d-pau.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d-pau.png" % @dex[hash_index],
                              "http://www.serebii.net/sunmoon/pokemon/%03d-s.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d-s.png" % @dex[hash_index]]
              elsif pokemon_for_logic == special[1] #LYCANROC
                  @images = ["http://www.serebii.net/sunmoon/pokemon/%03d.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d.png" % @dex[hash_index],
                              "http://www.serebii.net/sunmoon/pokemon/%03d-m.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d-m.png" % @dex[hash_index]]
              elsif pokemon_for_logic == special[2] #WISHIWASHI
                  @images = ["http://www.serebii.net/sunmoon/pokemon/%03d.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d.png" % @dex[hash_index],
                              "http://www.serebii.net/sunmoon/pokemon/%03d-s.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d-s.png" % @dex[hash_index]]
              elsif pokemon_for_logic == special[3] #ZYGARDE
                  @images = ["http://www.serebii.net/sunmoon/pokemon/%03d.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d.png" % @dex[hash_index],
                              "http://www.serebii.net/sunmoon/pokemon/%03d-c.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d-c.png" % @dex[hash_index],
                              "http://www.serebii.net/sunmoon/pokemon/%03d-10.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d-10.png" % @dex[hash_index]]
              elsif pokemon_for_logic == special[4] #MINIOR
                  @images = ["http://www.serebii.net/sunmoon/pokemon/%03d.png" % @dex[hash_index],
                              "http://www.serebii.net/sunmoon/pokemon/%03d-b.png" % @dex[hash_index], "http://www.serebii.net/sunmoon/pokemon/%03d-g.png" % @dex[hash_index],
                              "http://www.serebii.net/sunmoon/pokemon/%03d-i.png" % @dex[hash_index], "http://www.serebii.net/sunmoon/pokemon/%03d-o.png" % @dex[hash_index],
                              "http://www.serebii.net/sunmoon/pokemon/%03d-r.png" % @dex[hash_index], "http://www.serebii.net/sunmoon/pokemon/%03d-v.png" % @dex[hash_index],
                              "http://www.serebii.net/sunmoon/pokemon/%03d-y.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d-b.png" % @dex[hash_index]]
              elsif pokemon_for_logic == special[5] #SHELLOS
                  @images = ["http://www.serebii.net/sunmoon/pokemon/%03d.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d.png" % @dex[hash_index],
                              "http://www.serebii.net/sunmoon/pokemon/%03d-e.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d-e.png" % @dex[hash_index]]
              elsif pokemon_for_logic == special[6] #GASTRODON
                  @images = ["http://www.serebii.net/sunmoon/pokemon/%03d.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d.png" % @dex[hash_index],
                              "http://www.serebii.net/sunmoon/pokemon/%03d-e.png" % @dex[hash_index], "http://www.serebii.net/Shiny/SM/%03d-e.png" % @dex[hash_index]]
              elsif alolan.include?(pokemon_for_logic)
                  alolan_images_array(pokemon_for_logic)
              else
                  regular_images_array(pokemon_for_logic)
              end
          else
              @error = true
          end
      end
      shiny_definer(@pokemon[:pokemon])
    end
  end
end