#Cards.rb

=begin
Creates Card object which holds a cards number, color, shading and shape attributes. Has method 
display that prints all card attributes. Also includes attributes for printing cards.
=end
class Card
    #Makes Attributes Readable
    attr_reader :number
    attr_reader :color
    attr_reader :shading
    attr_reader :shape
    attr_accessor :symbol
    attr_reader :outline
    attr_reader :empty

    #Set Card Attributes
    def initialize(number,color,shading,shape)
        @number = number
        @color = color
        @shading = shading
        @shape = shape
        
        #Give each instance of card a symbol attribute for displying card based on it's number,color,shading, and shape
        #Comments from Red follow for Blue and Green if blocks
        #First deterimine color of card
        if(@color == "Red")
            #Set card outline 3 dashes for top and bottom of card
            @outline = " ---".red
            #Set empty for card displayed if number is fewer than 3
            @empty = "|   |".red
            #If card is red and square 
            if(@shape == "Square")
                #Separate card by shading and assign appropriate symbol
                if(@shading == "Solid")
                    @symbol = "| ■ |".red
                elsif(@shading == "Open")
                    @symbol = "| □ |".red
                else
                    @symbol = "| ◨ |".red
                end
            #If card is red and Circle
            elsif(@shape =="Circle")
                #Separate card by shading and assign appropriate symbol
                if(@shading == "Solid")
                    @symbol = "| ● |".red
                elsif(@shading == "Open")
                    @symbol = "| ○ |".red
                else
                    @symbol = "| ◑ |".red
                end
            #If card is red and Diamond
            else
                #Separate card by shading and assign appropriate symbol
                if(@shading == "Solid")
                    @symbol = "| ◆ |".red
                elsif(@shading == "Open")
                    @symbol = "| ◇ |".red
                else
                    @symbol = "| ⬗ |".red
                end
            end
        elsif(@color == "Blue")
            @outline = " ---".blue
            @empty = "|   |".blue
            if(@shape == "Square")
                if(@shading == "Solid")
                    @symbol = "| ■ |".blue
                elsif(@shading == "Open")
                    @symbol = "| □ |".blue
                else
                    @symbol = "| ◨ |".blue
                end
            elsif(@shape =="Circle")
                if(@shading == "Solid")
                    @symbol = "| ● |".blue
                elsif(@shading == "Open")
                    @symbol = "| ○ |".blue
                else
                    @symbol = "| ◑ |".blue
                end
            else
                if(@shading == "Solid")
                    @symbol = "| ◆ |".blue
                elsif(@shading == "Open")
                    @symbol = "| ◇ |".blue
                else
                    @symbol = "| ⬗ |".blue
                end
            end
        else
            @outline = " ---".green
            @empty = "|   |".green
            if(@shape == "Square")
                if(@shading == "Solid")
                    @symbol = "| ■ |".green
                elsif(@shading == "Open")
                    @symbol = "| □ |".green
                else
                    @symbol = "| ◨ |".green
                end
            elsif(@shape =="Circle")
                if(@shading == "Solid")
                    @symbol = "| ● |".green
                elsif(@shading == "Open")
                    @symbol = "| ○ |".green
                else
                    @symbol = "| ◑ |".green
                end
            else
                if(@shading == "Solid")
                    @symbol = "| ◆ |".green
                elsif(@shading == "Open")
                    @symbol = "| ◇ |".green
                else
                    @symbol = "| ⬗ |".green
                end
            end
        end
    end
    
    #Displays all card values
    def display
        print("#{@number} #{@color} #{@shading} #{@shape}")
    end

end

