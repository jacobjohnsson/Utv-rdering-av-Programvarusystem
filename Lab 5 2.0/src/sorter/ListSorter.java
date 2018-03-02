package sorter;

import java.util.LinkedList;

public class ListSorter<E extends Comparable<? super E>>{
	private LinkedList<E> myList;

	public ListSorter(LinkedList<E> inputList) {
		myList = inputList;
	}

	public LinkedList<E> sort() {
		int i = 1;
		while(i < myList.size()){
			int j = i;
			while(j > 0 && myList.get(j - 1).compareTo(myList.get(j)) > 0){
				swap(j, j - 1);
				j--;
			}
			i++;
		}
		return myList;
	}

	private void swap(int a, int b) {
		E tmp = myList.get(a);
		myList.set(a, myList.get(b));
		myList.set(b, tmp);
	}	
}
