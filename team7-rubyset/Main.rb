#Main.rb
require_relative "Deck"
require_relative "Card"
require_relative "VerifySet"
require_relative "PrintConsole"
require 'colorize'

=begin
Creates the game of set and controls the flow of the game
=end
def PlaySet
    #Represents the cards that are on the table
    workingSet = []

    #Entire Deck of cards used for game
    deck = Deck.new
    deck.shuffle

    #Variable used to check if selected cards are a set
    isASet = false
    dealtThreeMore = false
    score= 0
    intial = 0
    final=0
    total=0
    
    DealTwelve(workingSet,deck)

    while(true) do
        #If nothing left in deck and no sets are left display end messages and exit game
        if (deck.length == 0 && hint(workingSet) == nil) 
            final= Time.now.to_i
            total= total + (final-intial)
            print("Time: ")
            puts(total)
            print("Score: ")
            puts(score)
            abort("Game Over! No more sets to be made!")
        end

        #If DealThree is called don't print again
        if(!dealtThreeMore)
            PrintTable(workingSet)
            dealtThreeMore = false
        end

        #intialize timer
        intial= Time.now.to_i
        options = 'deal'
        while(options.downcase == 'deal' || options.downcase == 'hint' )
            #Checks to see if the player wants 3 more cards or a hint
            puts("\nWould you like to deal 3 more cards, get a hint, try a set, or quit?")
            print("Enter Deal,Hint, Set or Quit: ")
            options = gets().chomp()
            #Deal three more cards if deal is entered
            if (options.downcase== 'deal')
                DealThree(workingSet,deck)
            #Display a hint if hint is entered
            elsif(options.downcase == 'hint')
                ahint = hint(workingSet)
                if (ahint == nil)
                    DealThree(workingSet,deck)
                    puts("There is no Set, three more cards dealt!")
                else
                    print("Hint: ")
                    puts("#{workingSet.find_index(ahint) + 1} is part of a Set!")
                end
            #Quit game and display end of game messages
            elsif(options.downcase == 'quit')
                final= Time.now.to_i
                total= total + (final-intial)
                print("Time: ")
                puts(total)
                print("Score: ")
                puts(score)
                abort("Game of Set quit")
            end
        end

        #Asks the player to choose a set
        puts("\nEnter the card numbers that form a set")
        print("Card 1: ")
        card1 = workingSet[gets.to_i - 1]
        print("Card 2: ")
        card2 = workingSet[gets.to_i - 1]
        print("Card 3: ")
        card3 = workingSet[gets.to_i - 1]

        #Verifys the set
        if(!(card1 == card2  || card1 == card3 || card2 == card3))
            isASet = VerifySet?(card1,card2,card3)
        else
            puts("This is not a valid input")
            isASet = false
        end

        #If the cards selected is a set, remove them from the table and deal 3
        #more cards if the table has less than 12 cards
        if(isASet)
        
            puts("\n----------------------------------------------")
            puts("\nCompleted Set!")
	
           #player's total time to attempt to verify set
           final= Time.now.to_i
           total= total + (final-intial)
            
            #adjusts points and displays
            score= AddPoints(score)
            print ("Score: ")
		    puts (score)
		    #prints time that player attempted to verify set
		    print ("Time Elapsed: ")
		    puts(total);
	        puts("\n----------------------------------------------")
		
		
	
            workingSet.delete(card1)
            workingSet.delete(card2)
            workingSet.delete(card3)
            if(workingSet.length<12)
                DealThree(workingSet,deck)
                dealtThreeMore = true
            else
                dealtThreeMore = false
            end
            
        else
            puts("\n----------------------------------------------")
            puts("\nNot a Set")
            

           #player's total time to attempt to verify set
           final= Time.now.to_i
           total= total + (final-intial)
            
            #adjusts points and displays
            score= RemovePoints(score)
            	print ("Score: ")
		    puts (score)
		    #prints time that player attempted to verify set
		    print ("Time Elapsed: ")
		    puts(total);
		    puts("\n----------------------------------------------")

        end
    end
end

=begin
    Adds points to score
=end
def AddPoints(score)
	score = score + 100
end

=begin
    Removes points from score
=end
def RemovePoints(score)
	score = score - 50
end


=begin
    Deals three more cards
=end
def DealThree(workingSet,deck)
    if (deck== 0)
        puts("NO MORE CARDS IN DECK")
    elsif(workingSet.length == 21)
        puts("This the Max amount of cards you can have. There must be a set on the table.")
    else
        for i in 0..2
            workingSet << deck.deal!
        end
        PrintTable(workingSet)
    end
end

=begin
Deals 12 cards onto the 'table'
=end
def DealTwelve(workingSet,deck)
    if (deck== 0)
        puts("NO MORE CARDS IN DECK")
    else
        for i in 0..11
            workingSet << deck.deal!
        end
    end
end

=begin
Gives the player a card that is in a set
=end
def hint(workingSet)
    setFound = false
    for i in workingSet
        for j in workingSet
            for k in workingSet
                if(!(i == k || j == k || i == k))
                    setFound = VerifySet?(i,j,k)
                    if(setFound)
                        return i
                        break
                    end
                end
            end
        end
    end
    if(setFound == false)
        return nil
    end
end

#Starts the program
PlaySet()