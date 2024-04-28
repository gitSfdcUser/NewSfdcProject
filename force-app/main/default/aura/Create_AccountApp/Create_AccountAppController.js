({
    handleSuccess : function(component, event, helper) {
        
        var name = component.get("v.name");
        console.log('name::',name);
        var phone = component.get("v.phone");
        console.log('phone::',phone);
        var industry = component.get("v.industry");
        console.log('industry::',industry);
        var website = component.get("v.website");
        console.log('website::',website);
        var rating = component.get("v.rating");
        console.log('rating::',rating);
    }
})