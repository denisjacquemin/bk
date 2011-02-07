document.observe("dom:loaded", function() {
   $$('.product').each(function(p){
       p.down('.totalhtva').innerHTML = p.down('.totalhtvahidden').value;
       p.down('.totaltvac').innerHTML = p.down('.totaltvachidden').value;
   }); 
   
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
    
    //if (el = e.findElement('.number')) {
    //    var regExpr = new RegExp("^-{0,1}\");
    //    if (!regExpr.test(el.value)) {
    //        //el.style.backgroundColor = '#F00';
    //        alert('true');
    //    } else {
    //        alert('false');
    //    }
    //}
    
    
    if (el = e.findElement('.ct')) {
      var product = el.up('.product');
      if (product) {
        var total = 0.0;
        var quantity = 0.0;
        var up = 0.0;
        var tva = 0.0;
        
        product.select('.ct').each(function(ct){
            if (ct.hasClassName('q'))  { quantity = parseFloat(ct.value); }
            if (ct.hasClassName('up')) { up = parseFloat(ct.value); }
            if (ct.hasClassName('tva')) { tva = parseFloat(ct.options[ct.selectedIndex].innerHTML); }
        });
        
        // total for current product
        totalhtva = quantity * up;
         
        product.down('.totalhtva').innerHTML = totalhtva;
        product.down('.totalhtvahidden').value = totalhtva;
        
        totaltvac = totalhtva + (totalhtva * (tva/100));
        product.down('.totaltvac').innerHTML = Math.round(totaltvac*100)/100;
        product.down('.totaltvachidden').value = Math.round(totaltvac*100)/100;
        
        // update global total 
        var globaltotal_tvac = 0.0;
        $$('.totaltvac').each(function(t){
            globaltotal_tvac = globaltotal_tvac + parseFloat(t.innerHTML);
        });
        
        var globaltotal_htva = 0.0;
        $$('.totalhtva').each(function(t){
            globaltotal_htva = globaltotal_htva + parseFloat(t.innerHTML);
        });
        
        $('bill_totalhtva').value = globaltotal_htva;
        $('globaltotalhtva').innerHTML = globaltotal_htva;
        
        $('bill_totaltvac').value = Math.round(globaltotal_tvac*100)/100;
        $('globaltotaltvac').innerHTML = Math.round(globaltotal_tvac*100)/100;
      }
    }
});