// Taken from http://www.firstpr.com.au/dsp/pink-noise/

#include <iostream>
#include <stdlib.h>

using namespace std;

class PinkNumber {
private:
  int max_key;
  int key;
  unsigned int white_values[ 5 ];
  unsigned int range;

public:
  PinkNumber( unsigned int range = 128 ){
    max_key = 0x1f; // Five bits set
    this->range = range;
    key = 0;
    for ( int ii = 0; ii < 5; ii++ ){
      white_values[ ii ] = rand() % ( range/ 5 );
    }
  }

  int GetNextValue(){
    int last_key = key;
    unsigned int sum;


    key++;
    if ( key > max_key ){
      key = 0;
    }

    // Exclusive-Or previous value with current value. This gives a
    // list of bits that have changed.
    int diff = last_key ^ key;
    sum = 0;
    for ( int ii = 0; ii < 5; ii++ ){
      // If a bit changed, get a new random number for corresponding
      // white_value
      if ( diff & ( 1 << ii ) ){
	white_values[ ii ] = rand() % ( range/ 5 );
      }
      sum += white_values[ ii ];
    }
    return sum;
  }
};

main(){
  PinkNumber pn;

  for ( int ii = 0; ii < 48000; ii++ ){
    cout << pn.GetNextValue() << endl;
  }
}
