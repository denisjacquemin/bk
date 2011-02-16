

replace_ids = function(s){
  var new_id = new Date().getTime();
  return s.replace(/NEW_RECORD/g, new_id);
}

var quicksearch = null;
document.observe("dom:loaded", function() {
  
    Growl.initialize(); 
    
    $$('.flash').each(function(f){
        Growl.Smoke({
            title: f.innerHTML,
            text: f.innerHTML,
            image: "/images/web-app-theme/icons/information.png",
            duration: 5.0
        });
    });
    
  // init Quick Search on customers/index
  if ($('qs-target') != undefined) {
    quicksearch = new CustomerFilter('qs-target');
    quicksearch.filter($F('quicksearch'));
  }
  
  // put the focus on input with a .focus selector
  $$('.focus').invoke('select');
  
  document.observe('click', function(e, el) {
      
      if (el = e.findElement('.remove')) {
        target = el.href.replace(/.*#/, '.');
        
        // if 'el' is already saved in database, hide 'el' to submit a delete request
        // else 'el' was dynamicaly added and needs to be removed from dom
        if(hidden_input = el.previous("input[type=hidden]")) { 
            hidden_input.value = '1';
            el.up(target).hide();
        } else {
            el.up(target).remove();
        }
        
        // only for Bill.edit screen, refresh the global total
        if (target == '.product') {
            computeGlobalTotal();
        }
      }
  });

  $$('.error').each(function(e){
      $$('div.field_with_errors input')[0].focus();
  });
  
  $$('.add_nested_item').each(function(el) {
    el.observe('click', function() {
      template = eval(el.href.replace(/.*#/, ''));
      $(el.rel).insert({     
        bottom: replace_ids(template.gsub('&quot;', '\'')).unescapeHTML()
      });
    });
  });
});

function toCurrency(amount) {
  return amount.toFixed(2);
}

Number.prototype.toCurrency = function () {
  return toCurrency(this);
}