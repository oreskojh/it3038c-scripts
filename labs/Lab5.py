import random
print ("We are going to play a random number guessing game.\nTo start we need to have a number range to generate the number i.e. 0-10")
startingRange = int(input("Please input a starting range integer number: "))
endRange = int(input("Please input an ending range integer number: "))
generatedNumber = (random.randint(startingRange,endRange))

#Printing the generated number was used for testing purposes. Remove the # below to make it easier to grade.
#print ("The generated number is: " +  str(generatedNumber))


playerGuess = int(input("Please enter your guess: "))
while generatedNumber != playerGuess:
	if playerGuess > generatedNumber:
		print ("Your guess was too high.")
		playerGuess = int(input("Please try another number: "))
	elif playerGuess < generatedNumber:
		print ("Your guess was too low.")
		playerGuess = int(input("Please try another number: "))
	else:
		break
print("Congratulations! " + str(playerGuess) + " was the correct number.")


