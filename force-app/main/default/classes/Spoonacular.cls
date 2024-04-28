public class Spoonacular {
    Private static final String SPOONACULAR_API = 'https://api.spoonacular.com';
    Private static final String API_KEY = '1816f91d120845bb8d15284b65285b93';
     @AuraEnabled
    public static String getRandomRecipe(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/random?apiKey='+API_KEY);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        system.debug('Response Code>>>'+ response.getStatusCode());
        if(response.getStatusCode() == 200) {
          return response.getbody();
        }
        return '';
    }
    
     @AuraEnabled
    public static String getRecipe(String recipeId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/'+ recipeId+ '/information?apiKey='+API_KEY);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        system.debug('Response Code>>>'+ response.getStatusCode());
        if(response.getStatusCode() == 200) {
          return response.getbody();
        }
          return '';
    }
    
     @AuraEnabled
    public static String getRecipeByIngredients(String ingredients){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(SPOONACULAR_API+'/recipes/findByIngredients?apiKey='+API_KEY+'&ingredients='+ingredients);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        system.debug('Response Code>>>'+ response.getStatusCode());
        if(response.getStatusCode() == 200) {
          return response.getbody();
        }
          return '';
    }
    
    
}