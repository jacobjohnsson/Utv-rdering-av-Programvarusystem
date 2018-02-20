package sorter;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.Random;
import java.util.Scanner;


public class Lab {

	public static void main(String[] args) {
		int antaletTalAttSortera = 200;
		
		// generera infil.txt
		generateNumbers(args[0], antaletTalAttSortera);

		// lägg alla de talen i en lista
		LinkedList<Integer> randomTal = new LinkedList<Integer>();
		try (Scanner scanner = new Scanner(new File("resources", args[0]))) {
			while (scanner.hasNext()){
				randomTal.add(Integer.parseInt(scanner.nextLine()));
			}
		} catch (IOException e) {
			System.out.println("Got ourselves a litte IOException trying to list the numbers: " + e.getMessage());
		}
		
		// generera utfil.txt
		generateResult(args[1], Integer.parseInt(args[2]), randomTal);

		// debug: printa ut alla tal INNAN de sorteras.
//		for (int i : randomTal) {
//			System.out.println(i + ", ");
//		}

		// debug: skriv ut alla tal EFTER de sorterats.
//		randomTal = sorter.sort();
//		for (int i : randomTal) {
//			System.out.println(i + ", ");
//		}
	}

	public static void generateResult(String output, int n, LinkedList<Integer> randomTal){
		// Initialisera utskriftsobjekten
		FileWriter fileWriter = null;
		try {
			fileWriter = new FileWriter(new File("resources", output));
		} catch (IOException e) {
			e.printStackTrace();
		}
		PrintWriter printWriter = new PrintWriter(fileWriter);

		StringBuilder sb = new StringBuilder();
		sb.append("Försök nr, Tid i nanosekunder'\n");

		ListSorter<Integer> sorter = new ListSorter<Integer>(randomTal);
		for (int i = 1; i <= n; i++) {
			// sortera listan och klocka.
			long t1 = System.nanoTime();
			sorter.sort();
			long t2 = System.nanoTime();
			long time = t2 - t1;

			// spara datan.
			sb.append(i + ", " + time + '\n');
			//System.out.println(i + ": " + time + " nano seconds.");
		}

		System.out.println(sb.toString());
		printWriter.print(sb.toString());
		printWriter.close();
	}

	public static void generateNumbers(String output, int n) {
		int storlekPåTal = 1000;
		
		Random randNumGen = new Random();
		StringBuilder sb = new StringBuilder();

		// bygg upp strängen
		for (int i = 0; i < n; i++) {
			sb.append(randNumGen.nextInt(storlekPåTal) + "\n");
		}

		// skriv strängen till fil
		FileWriter fileWriter = null;
		try {
			fileWriter = new FileWriter(new File("resources", output));
		} catch (IOException e) {
			e.printStackTrace();
		}
		PrintWriter printWriter = new PrintWriter(fileWriter);
		printWriter.print(sb.toString());
		printWriter.close();

	}

}
