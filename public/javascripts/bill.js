document.observe("dom:loaded", function() {
   $$('.product').each(function(p){
       p.down('.totalhtva').innerHTML = parseFloat(p.down('.totalhtvahidden').value.replace(',', '.')).toCurrency();
       p.down('.totaltvac').innerHTML = parseFloat(p.down('.totaltvachidden').value.replace(',', '.')).toCurrency();
   });
   
   computeGlobalTotal();
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
            var numeric = ct.value;
            if (validateNumeric(numeric, ct)) {
                quantity = parseFloat(numeric); 
            }
        }
        if (ct.hasClassName('up')) { 
            var numeric = ct.value.replace(',', '.');
            if (validateNumeric(numeric, ct)) {
                up = parseFloat(numeric);
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
            globaltotal_tvac = globaltotal_tvac + parseFloat(t.innerHTML.replace(',', '.'));
        }
    });
    var globaltotal_htva = 0.0;
    $$('.totalhtva').each(function(t){
        if (t.up('.product').visible()) {
            globaltotal_htva = globaltotal_htva + parseFloat(t.innerHTML.replace(',', '.'));
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