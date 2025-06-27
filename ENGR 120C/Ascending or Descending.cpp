#include <iostream>
#include <string>
using namespace std;

// General swapping function 
void swap(int&a, int&b, int&c, int&d)
{
	int temp;
	temp = a;
	a = b;
	b = temp;
}

// Ascending Function for 4 Integers
void ascending(int&a, int&b, int&c, int&d)
{
	// compares the first integer with the following three integers
	if (a > b) 
	{
	    swap(a,b);
	}
	if (a > c)
	{
		swap(a,c);
	}
	if (a > d)
	{
		swap(a,d);
	}
	// compares the second integer with the following two integers
	if (b > c)
	{
		swap(b,c);
	}
	if (b > d)
	{
		swap(b,d);
	}
	// compares the third integer with the fourth integer
	if (c > d)
	{
		swap(c,d);
	}
}

// Descending Function for 4 Integers
void descending(int&a, int&b, int&c, int&d)
{
	// compares the first integer with the following three integers
	if (b > a)
	{
	  swap(a,b);
	}
	if (c > a)
	{
		swap(a,c);
	}
	if (d > a)
	{
		swap(a,d);
	}
	// compares the second integer with the following two integers
	if (c > b)
	{
		swap(b,c);
	}
	if (d > b)
	{
		swap(b,d);
	}
	// compares the third integer with the fourth integer
	if (d > c)
	{
		swap(c,d);
	}
}

int main()
{
	int w,x,y,z;
	char ch_one,a,d,ch_two,Y,N;
	string word; // this only reads up to the first whitespace of the word
				 // user can enter an abbreviation or half a word and it will still execute the correct command
	cout << "Enter four integers: \n";
	cin >> w >> x >> y >> z;
	cout << "Do you want numbers in ascending [a] or descending [d] order?: ";
	cin >> ch_one;
	cin >> word;
	
	if (ch_one == 'a' || ch_one == 'A' || ch_one == 'ascending' || ch_one == 'Ascending')
	{
		ascending(w,x,y,z);
		cout << "Ascending Order: " << w << " " << x << " " << y << " " << z;
	}
	if (ch_one == 'd' || ch_two == 'D' || ch_one == 'descending' || ch_one == 'Descending')
	{
		descending(w,x,y,z);
		cout << "Descending Order: " << w << " " << x << " " << y << " " << z;
	}
	cout << "\nWould you like to try a different set of integers? Yes [Y] | No [N]: ";
	cin >> ch_two;
	cin >> word;
	
	while (ch_two == 'Y' || ch_two == 'y' || ch_two == 'Yes' || ch_two == 'yes')
	{
		cout << "\nEnter four integers: \n";
	cin >> w >> x >> y >> z;
	cout << "Do you want numbers in ascending [a] or descending [d] order?: ";
	cin >> ch_one;
	cin >> word;
	if (ch_one == 'a' || ch_one == 'A' || ch_one == 'ascending' || ch_one == 'Ascending')
	{
		ascending(w,x,y,z);
		cout << "Ascending Order: " << w << " " << x << " " << y << " " << z;
	}
	if (ch_one == 'd' || ch_two == 'D' || ch_one == 'descending' || ch_one == 'Descending')
	{
		descending(w,x,y,z);
		cout << "Descending Order: " << w << " " << x << " " << y << " " << z;
	}
	cout << "\nWould you like to try a different set of integers? Yes [Y] | No [N]: ";
	cin >> ch_two;
	cin >> word;
	}
	
	return 0;
}
