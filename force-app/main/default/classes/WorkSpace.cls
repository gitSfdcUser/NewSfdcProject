public class WorkSpace {
public static Id correctCapitalizedId(String input) {
        String keyString = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ012345', result = '';
        Integer i = 0, s = 15;
        
        if (input.length() != 18) { return null; }
        
        for (String seq : input.split('(?<=\\G.{5})')) {
            Integer chk = keyString.indexOf(input.mid(s++,1));
            i = 0;
            for (String chr : seq.split('')) {
                result += seq.length() != 5  ? '' : (chk & (i == 0 ? ++i : (i*=2))) == 0 ? chr.toLowerCase() : chr;
            }
        }
    System.debug('correctCapitalizedId>>>>>>>'+result);
        System.debug('correctCapitalizedId>>>>>>>'+ Id.valueOf(result));

    
    
    
        return Id.valueOf(result);
    }
}