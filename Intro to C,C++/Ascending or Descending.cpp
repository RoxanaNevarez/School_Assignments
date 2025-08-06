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
	char ch_one,a,d,ch_two,Y,N; //ch_one corresponds to a,d; ch_two corresponds to Y,N
	cout << "Enter four integers: \n";
	cin >> w >> x >> y >> z;
	cout << "Do you want numbers in ascending [a] or descending [d] order?: ";
	cin >> ch_one;
	
	if (ch_one == 'a' || ch_one == 'A')
	{
		ascending(w,x,y,z);
		cout << "Ascending Order: " << w << " " << x << " " << y << " " << z;
	}
	if (ch_one == 'd' || ch_one == 'D')
	{
		descending(w,x,y,z);
		cout << "Descending Order: " << w << " " << x << " " << y << " " << z;
	}
	cout << "\nWould you like to try a different set of integers? Yes [Y] | No [N]: ";
	cin >> ch_two;
	
	while (ch_two == 'Y' || ch_two == 'y')
	{
		cout << "\nEnter four integers: \n";
	cin >> w >> x >> y >> z;
	cout << "Do you want numbers in ascending [a] or descending [d] order?: ";
	cin >> ch_one;

	if (ch_one == 'a' || ch_one == 'A')
	{
		ascending(w,x,y,z);
		cout << "Ascending Order: " << w << " " << x << " " << y << " " << z;
	}
	if (ch_one == 'd' || ch_one == 'D')
	{
		descending(w,x,y,z);
		cout << "Descending Order: " << w << " " << x << " " << y << " " << z;
	}
	cout << "\nWould you like to try a different set of integers? Yes [Y] | No [N]: ";
	cin >> ch_two;
	}
	
	return 0;
}
