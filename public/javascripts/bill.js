document.observe("dom:loaded", function() {
   $$('.product').each(function(p){
       p.down('.totalhtva').innerHTML = parseFloat(p.down('.totalhtvahidden').value).toCurrency();
       p.down('.totaltvac').innerHTML = parseFloat(p.down('.totaltvachidden').value).toCurrency();
   });
   
   computeGlobalTotal();

   Autocomplete.isDomLoaded = true;
   new Autocomplete('customer_autocomplete', { 
       serviceUrl:'/customers/autocomplete',
       minChars:2, 
       maxHeight:400,
       width:403,
       deferRequestBy:100,
       // callback function:
       onSelect: function(value, data){
           $('customer_autocomplete').value = value;
           $('bill_customer_id').value = data;
       }
   });
});

// if customer_autocomplete field is changed, set bill_customer_id's value to nothing
$('customer_autocomplete').observe('change', function(field) {
    if ($F('customer_autocomplete').strip() == '') {
        $('bill_customer_id').value = '';
    }
});

document.observe('change', function(e, el) {
    
    if (el = e.findElement('.ct')) {
      var product = el.up('.product');
      if (product) {
        computeTotalForAProduct(product);
        
        computeGlobalTotal();
      }
    }
});


function computeTotalForAProduct(product) {

    var total = 0.0;
    var quantity = 0.0;
    var up = 0.0;
    var tva = 0.0;
    
    product.select('.ct').each(function(ct){
        if (ct.hasClassName('q'))  { 
            if (validateNumeric(ct.value, ct)) {
                quantity = parseFloat(ct.value); 
            }
        }
        if (ct.hasClassName('up')) { 
            if (validateNumeric(ct.value, ct)) {
                up = parseFloat(ct.value);
            } 
        }
        if (ct.hasClassName('tva')) { 
            tva = parseFloat(ct.options[ct.selectedIndex].innerHTML);
        }
    });
    
    // total for current product
    totalhtva = quantity * up;
     
    product.down('.totalhtva').innerHTML = parseFloat(totalhtva).toCurrency();
    product.down('.totalhtvahidden').value = totalhtva;
    
    totaltvac = totalhtva + (totalhtva * (tva/100));
    product.down('.totaltvac').innerHTML = parseFloat(Math.round(totaltvac*100)/100).toCurrency();
    product.down('.totaltvachidden').value = Math.round(totaltvac*100)/100;
}

function computeGlobalTotal() {
    // update global total 
    var globaltotal_tvac = 0.0;
    $$('.totaltvac').each(function(t){
        if (t.up('.product').visible()) {
            globaltotal_tvac = globaltotal_tvac + parseFloat(t.innerHTML);
        }
    });
    
    var globaltotal_htva = 0.0;
    $$('.totalhtva').each(function(t){
        if (t.up('.product').visible()) {
            globaltotal_htva = globaltotal_htva + parseFloat(t.innerHTML);
        }
    });
    
    $('bill_totalhtva').value = globaltotal_htva;
    $('globaltotalhtva').innerHTML = parseFloat(globaltotal_htva).toCurrency();
    
    $('bill_totaltvac').value = Math.round(globaltotal_tvac*100)/100;
    $('globaltotaltvac').innerHTML = parseFloat(Math.round(globaltotal_tvac*100)/100).toCurrency();
}

function validateNumeric(input, element) {
  var valid = true;
  if(!IsNumeric(input)) {
    valid = false;
    element.setStyle({backgroundColor: '#FFBABA'});
  }
  
  if(valid) { element.setStyle({backgroundColor: '#FFF'}); }
  
  return valid;
}

function IsNumeric(input)
{
   return (input - 0) == input && input.length > 0;
}