#Deck.rb

=begin
Creates Deck object which makes an array of 81 unique Card objects. The deck object can
be shuffled, have its length checked, and can have a card dealt and removed from the deck.
=end
class Deck
    def initialize
        #Initialize Deck
        @deck = []

        #Attribute types for cards
        @number = [1,2,3]
        @color =  ["Blue", "Green", "Red"]
        @shading = ["Solid","Half","Open"]
        @shape =  ["Circle","Square","Diamond"]

        #Create Deck with 81 unique cards
        @number.each do |number|
            @color.each do |color|
                @shading.each do |shading|
                    @shape.each do |shape|
                        @deck << Card.new(number,color,shading,shape)
                    end
                end
            end
        end
    end

    #Returns length of the deck
    def length
        return @deck.length
    end

    #Shuffle Deck
    def shuffle
        @deck.shuffle!
    end

    #Deal a Card and remove it from deck
    def deal!
        if(@deck.length > 0)
            card = @deck.last
            @deck.pop
            return card
        end
    end
end
