/*
check math expressions: example : (1+98-8)*52 
*/

class interpretation{
	private let alphabet: [Character] = ["+","-","*","^","/"];
	private let numbers = "1234567890()"
	private let bracket = "()"
	struct scobes {
		var firstscobe: Character;
		var secondscobe: Character;
	}
	
	init( data: String? ) {
		
		if( data == nil ) {
			print( "incorrect expression" );
		} else {
			if( check_correct(_data: data!) ){
				print("correct expression");
				
			} else {
				print( "incorrect expression" );
			}
		}
		
	}
	
	func check_correct( _data: String ) -> Bool {
		var key = 0;
		for i in _data {
			var j = 0;
			while( j<alphabet.count ) {
				if ( i == alphabet[j] ) {
					key += 1;
					break;
				}
				
				j += 1;
			}
			
			if numbers.contains( i ) {
				key += 1;
			}
		}
		
		var correct: Bool = false;
		
		if  ( numbers.contains(_data[ _data.startIndex ] ) ) && ( numbers.contains(_data[ _data.index( before: _data.endIndex ) ] ) )  {
			if ( _data[ _data.startIndex ] != ")" ) && ( _data[ _data.index( before: _data.endIndex ) ] != "("  ) {
				if( correct_brackets(data: _data) ) {
					correct = true;
				}
			}
		}
		var j = 0;
		for i in _data {
			if( j < _data.count && j > 0){
				let s = _data[ _data.index( _data.startIndex, offsetBy: j-1)];
				if( (alphabet.contains( i ) && (alphabet.contains( s ))) || ( i == "(" && s == ")") ){
					correct = false;
					break;
				} else {
					if( alphabet.contains(s) && i == ")"){
						correct = false;
						break;
					}
				}
			} 
			j += 1;
		}
		
		if( key == _data.count && correct ) {
			return true;
		} 
		return false;
	}
	
	func correct_brackets( data: String ) -> Bool {
		var encounter = 0;
		for i in data {
			if i == "(" {
				encounter += 1;
			}
			if i == ")" {
				encounter -= 1;
			}
		}
		
		if encounter != 0 && deepbracket(ss: data) {
			return false;
		} else {
			return true;
		}
	}
	
	func deepbracket( ss: String) -> Bool {
		var s = ss;
		var k = 0;
		var _pair:scobes = scobes(firstscobe: "0", secondscobe: "0");
		for i in s {
			if bracket.contains(i) {
				_pair.firstscobe = i;
				let range = s.startIndex..<s.index(s.startIndex, offsetBy: k);
				s.removeSubrange(range);
				var kk = 0;
				for j in s.reversed(){
					if bracket.contains(j) {
						_pair.secondscobe = j;
						let range = s.index(s.endIndex, offsetBy: -kk)..<s.endIndex;
						s.removeSubrange(range);
						if(deepbracket(ss: s) && _pair.firstscobe == "(" && _pair.secondscobe == ")") {
							return true;
						} else {
							return false
						}
					}
					kk+=1;
				}
			}
		k += 1
		}
		return true;
	}
}

while true {
	let expression: String? = readLine();
	var inter: interpretation = interpretation( data: expression );
	print( "Do you want to continue?(y/n)" )
	let acception = readLine();
	if acception == "y" || acception == "yes" {} else {break;}
}
