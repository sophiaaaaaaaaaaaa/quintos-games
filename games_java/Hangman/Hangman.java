package games_java.Hangman;

import java.util.Arrays;
import java.util.Scanner;

public class Hangman {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		String[] hangman = new String[] { """
				=========""", """
				      |
				=========""", """
				      |
				      |
				=========""", """
				      |
				      |
				      |
				=========""", """
				      |
				      |
				      |
				      |
				=========""", """
				      |
				      |
				      |
				      |
				      |
				=========""", """
				  +---+
				      |
				      |
				      |
				      |
				      |
				=========""", """
				  +---+
				  |   |
				      |
				      |
				      |
				      |
				=========""", """
				  +---+
				  |   |
				  O   |
				      |
				      |
				      |
				=========""", """
				  +---+
				  |   |
				  O   |
				  |   |
				      |
				      |
				=========""", """
				  +---+
				  |   |
				  O   |
				 /|   |
				      |
				      |
				=========""", """
				  +---+
				  |   |
				  O   |
				 /|\\  |
				      |
				      |
				=========""", """
				  +---+
				  |   |
				  O   |
				 /|\\  |
				 /    |
				      |
				=========""", """
				  +---+
				  |   |
				  O   |
				 /|\\  |
				 / \\  |
				      |
				=========""" };

		String wordList = "abruptly absurd abyss affix askew avenue awkward axiom azure bagpipes bandwagon banjo bayou beekeeper bikini blitz blizzard boggle bookworm boxcar buckaroo buffalo buffoon buxom buzzard buzzing buzzwords cobweb croquet crypt cycle disavow dizzying duplex dwarves embezzle equip espionage euouae exodus faking fishhook fixable fjord flapjack flopping fluffiness flyby foxglove frazzled frizzled fuchsia funny gabby galaxy galvanize gazebo gizmo glowworm glyph gnarly gnostic gossip grogginess haiku haphazard hyphen icebox injury ivory ivy jackpot jawbreaker jaywalk jazzy jelly jigsaw jinx jiujitsu jockey jogging joking jovial joyful juicy jukebox jumbo kayak kazoo keyhole kilobyte kiosk kitsch kiwifruit klutz knapsack larynx lengths lucky luxury lymph marquee matrix megahertz microwave mnemonic mystify nightclub nowadays oxidize oxygen pajama phlegm pixel pizazz polka psyche puppy puzzling quartz queue quips quiz quizzes quorum razzmatazz rhubarb rhythm scratch snazzy sphinx squawk staff strength stretch stronghold stymied subway swivel syndrome thrift thumb topaz transcript transgress transplant twelfth triphthong unknown unzip vaporize voodoo vortex walkway waltz wave wavy waxy well whomever witch wizard wristwatch xylophone yacht youthful yummy zigzag zilch zipper zodiac zombie";

		/* PART A0: split the words string into an array, choose a random word */
		String[] words = wordList.split(" ");

		// generate random number between 0 and the number of words in the words array
		int rand = (int)(Math.random()* words.length);
		String word = words[rand];

		/* PART A1: make a char array with a line for each letter in the word */
		// Example word: 'quiz'
		// lines -> ['_', '_', '_', '_']
		char[] lines = "_".repeat(word.length()).toCharArray();

		int parts = 0;

		while (Arrays.asList(lines).contains('_') == true) {
			if (parts >= hangman.length){
				break;
			}
			String msg = hangman[parts];
			int i = 0;
			while (i < lines.length) {
				// add line character to the message
				msg += lines[i] + " ";
				i = i + 1;
			}

			// print the word too just for testing
			System.out.println(msg);
			String guess = sc.nextLine();

			boolean isCorrect = false;

			if (guess.length() == 1){
				i = 0;
				while (i < lines.length) {
					// assuming guess is one letter
					// check if the guess is equal to the character
					// at index i in the word
					if (guess.charAt(0) == word.charAt(i)) {
						// change the line at the index to be the correct guess
						lines[i] = guess.charAt(0);
						isCorrect = true;
					}
					i = i + 1;	
				}
			} else if (guess.equals(word)) {
				break;
			}
			if (isCorrect == false){
				parts += 1;
			}
		}
		if (parts < hangman.length){
			System.out.println ("CONGRATULATIONS, YOU ARE SAFE!" + "\n\n The correct word is indeed " + word + "\n\n you have made " + parts + " mistakes");
		} else {
			System.out.println ("RIP DX" + "\n\n The correct word is " + word + "\n\n you have made " + parts + " mistakes");
		}

		sc.close();
		System.exit(0);
	}
}
