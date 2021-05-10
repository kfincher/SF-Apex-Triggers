public class UsernameCheck {
    public static List<String> profCheck = new List<String>{'wholistic','dang','curses'};
        public static boolean checker(String str){
            for(String tempString:profCheck){
                if(str.containsIgnoreCase(tempString))
                    return false;
            }
            return true;
        }
}