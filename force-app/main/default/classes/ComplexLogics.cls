public class ComplexLogics {
    public static void listMethod(){
// Create an empty list of String
List<String> my_list = new List<String>();
        List<String> my_list1 = new List<String>();
List<String> my_list2 = new List<String>();
List<String> my_list3 = new List<String>();
List<String> my_list4 = new List<String>();

// Create a nested list
List<List<String>> my_nested_list = new List<List<String>>();
        List<List<String>> my_nested_list2 = new List<List<String>>();   

        List<List<List<String>>> list_of_my_nested_list = new List<List<List<String>>>();   
//
my_list.add('mywork');
        my_list1.add('mywork1');
my_list2.add('mywork2');
my_list3.add('mywork3');
my_list4.add('mywork3');

        
        
        
my_nested_list.add(my_list);
        my_nested_list.add(my_list1);
my_nested_list.add(my_list2);

        //
        my_nested_list2.add(my_list3);
                my_nested_list2.add(my_list4);

 System.debug('my_nested_list>>>>'+my_nested_list);
    list_of_my_nested_list.add(my_nested_list);
            list_of_my_nested_list.add(my_nested_list2);

        System.debug('list_of_my_nested_list>>>>'+list_of_my_nested_list);
    }
}