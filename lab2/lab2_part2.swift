/*different actions with stringes*/

class stringaction{
    var str1:String?
    var str2:String?
    var str1ch:[Character] = []
    var str2ch:[Character] = []
    var result:[Character] = []
    init(str1: String?,str2: String?) {
        self.str1 = str1
        self.str2 = str2
        if str1 == "" || str2 == ""{
            print("Some values are empty, try again")
        }
        else {
            self.str1ch = stringtocharacters(a: str1!)
            self.str2ch = stringtocharacters(a: str2!)
        }
    }
    func stringtocharacters(a:String)->[Character]{
        var characters:[Character] = []
        for i in a{
            characters.append(i)
        }
        return characters
    }
    func sumstring()->[Character]{
        for i in str1ch{
            result.append(i)
        }
        result.append(" ")
        for i in str2ch{
            result.append(i)
        }
        return result
    }
    func minusstring()->[Character]{
        var repeatch:[Character] = []
        for i in str1ch{
            for j in str2ch{
                if i == j{
                    repeatch.append(i)
                }
            }
        }
        str1ch.removeAll(where: {repeatch.contains($0)})
        return str1ch
    }
    func multiplystring()->[Character]{
        let myint = Int(str2 ?? "")
        if myint != nil
        {
            for _ in 1...myint!{
                result.append(contentsOf: str1ch)
            }
        }
        else {print("Second string must be number")}
    return result
    }
    func countchinstring(a:String?){
        var i:Int = 0
        for _ in a!{
            i+=1
        }
        print("In string ",String(a!) ," - ", i, "characters")
    }
    func printstring(a:[Character]){
        for i in a{
            print(i, terminator: "")
        }
        print("")
    }
}
func Repeat()->Bool{
    while true
    {
        print("Do you want repeat? Press y/n")
        let answer = readLine()
        if answer == "y" {return true}
        else if answer == "n" {return false}
        else {print("Please, chose attentively")}
    }
}
func switchh(menu:String?)->Bool{
    switch menu {
    case "1":
        print("Please, type your strings")
        let st = stringaction(str1: readLine(), str2: readLine())
        st.printstring(a: st.sumstring())
        return Repeat()
    case "2":
        print("Please, type your strings\nFrom first string u exclude all characters from second")
        let st = stringaction(str1: readLine(), str2: readLine())
        st.printstring(a: st.minusstring())
        return Repeat()
    case "3":
        print("Please, type your strings\nIn second string write number by which we will multiply")
        let st = stringaction(str1: readLine(), str2: readLine())
        st.printstring(a: st.multiplystring())
        return Repeat()
    case "4":
        print("Please, type your strings")
        let st = stringaction(str1: readLine(), str2: readLine())
        st.countchinstring(a: st.str1)
        st.countchinstring(a: st.str2)
        return Repeat()
    case "5":
        return false
    default:
        print("Please, chose attentively")
        return true
    }
}
while true
{
    print("""
        Chose something:
        1. Concatenate string
        2. Excluding string
        3. Multiply string
        4. Count characters in strings
        5. Exit
        """)
    let menu:String? = readLine()
    let repeatt = switchh(menu: menu)
    if repeatt == false {break}
}
