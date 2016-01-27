class User < ActiveRecord::Base

    def find_match(characters)
      matches = []
      characters.each do |character|
        match_count = 0
        match_count += 1 if match_hair?(character.hair)
        match_count += 1 if match_eyes?(character.eyes)
        match_count += 1 if match_skin?(character.skin)
        match_count += 1 if match_gender?(character.gender)
        match_count += 1 if match_weight?(character.weight)
        match_count += 1 if match_height?(character.height)
        match_count += 1 if match_species?(character.species)
        match_count += 1 if match_species_class?(character.species_class)

        matches << [ character.name, match_count]
      end
      matches
    end

    def match_hair?(hair)
      self.hair.include?( hair )
    end

    def match_eyes?(eyes)
      self.eyes.include?( eyes )
    end

    def match_skin?(skin)
      self.skin.include?( skin )
    end

    def match_gender?(gender)
      self.seeking_gender == gender
    end

    def match_species?(species)
      self.species.include?( species )
    end

    def match_species_class?(species_class)
      self.species_class.include?( species_class )
    end

    def match_vehicle?(vehicle)
      self.vehicle.include?( vehicle )
    end

    def match_starship?(starship)
      self.starship.include?( starship )
    end

    def match_height?(height)
      SHORT = 100
      TALL = 185
      if height < SHORT
        true if self.height == "short"
      elsif height > TALL
        true if self.height == "tall"
      else
        true if self.height == "average"
      end
      false
    end

    def match_weight?(weight)
      HEFTY = 100
      LIGHT = 50
      if weight < LIGHT
        return true if self.weight == "light"
      elsif weight > HEFTY
        return true if self.weight == "hefty"
      else
        return true if self.weight == "average"
      end
      false
    end

    def match_lifespan?(lifespan)
      CUTOFF = 120
      if lifespan < CUTOFF
        return true if self.lifespan == "Die Quick"
      elsif lifespan > CUTOFF
        return true if self.lifespan == "Live Long"
      else
        return true if self.lifespan == "Average"
      end
      false
    end

end
