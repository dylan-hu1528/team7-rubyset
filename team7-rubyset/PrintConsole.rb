=begin
Prints the cards that are on the table
=end
def PrintTable(workingSet)
    #Places to break out of loop
    breakArr = [4,10,16,19,19]

    #Places to create new row of cards
    rowLength = [0,6,12,18,22]
    rowNumber = 0

    #Draw top for all displayed cards in the row
    until workingSet.length <=  rowLength[rowNumber] do
        c = rowLength[rowNumber]
        until workingSet[c] == nil
            print("   #{c+1}.#{workingSet[c].outline}")
            if(c>breakArr[rowNumber])
                break
            end
            c+=1
        end
        puts()

        #Runs three times to display each row of the card
        for i in 0..2
            #Draw first symbol for all displayed cards in the row
            if(i==0)
                print(" ")
                c = rowLength[rowNumber]
                until workingSet[c] == nil
                    if(c>9)
                        print(" ")
                    end
                    print("    #{workingSet[c].symbol}")
                    if(c>breakArr[rowNumber])
                        break
                    end
                    c+=1
                end
                puts()
            #Draw second symbol for all displayed cards in the row
            elsif (i==1)
                print(" ")
                c = rowLength[rowNumber]
                until workingSet[c] == nil
                    if(c>9)
                        print(" ")
                    end
                    if(!(workingSet[c].number>1))
                        print("    #{workingSet[c].empty}")
                    else
                        print("    #{workingSet[c].symbol}")
                    end
                    if(c>breakArr[rowNumber])
                        break
                    end
                    c+=1
                end
                puts()
            #Draw third symbol for all displayed cards in the row
            else
                print(" ")
                c = rowLength[rowNumber]
                until workingSet[c] == nil
                    if(c>9)
                        print(" ")
                    end
                    if(!(workingSet[c].number>2))
                            print("    #{workingSet[c].empty}")
                    else
                            print("    #{workingSet[c].symbol}")
                    end
                    if(c>breakArr[rowNumber])
                        break
                    end
                    c+=1
                end
                puts()
            end
        end

        #Draw bottom for all displayed cards in the row
        c = rowLength[rowNumber]
        until workingSet[c] == nil
            if(c>9)
                print(" ")
            end
            print("     #{workingSet[c].outline}")
            if(c>breakArr[rowNumber])
                break
            end
            c+=1
        end
        puts()
        rowNumber +=1
    end
end