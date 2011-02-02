document.observe("dom:loaded", function() {
   $$('.product').each(function(p){
       p.down('.totalhtva').innerHTML = p.down('.totalhtvahidden').value;
       p.down('.totaltvac').innerHTML = p.down('.totaltvachidden').value;
   }); 
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
        var total = 0;
        var quantity = 0;
        var up = 0;
        var tva = 0;
        
        product.select('.ct').each(function(ct){
            if (ct.hasClassName('q'))  { quantity = parseInt(ct.value); }
            if (ct.hasClassName('up')) { up = parseInt(ct.value); }
            if (ct.hasClassName('tva')) { tva = parseInt(ct.value); }
        });
        
        totalhtva = quantity * up;
         
        product.down('.totalhtva').innerHTML = totalhtva;
        product.down('.totalhtvahidden').value = totalhtva;
        
        totaltvac = totalhtva + (totalhtva * (tva/100));
        product.down('.totaltvac').innerHTML = totaltvac;
        product.down('.totaltvachidden').value = totaltvac;
        
      }
    }
});