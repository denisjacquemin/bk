

replace_ids = function(s){
  var new_id = new Date().getTime();
  return s.replace(/NEW_RECORD/g, new_id);
}

var quicksearch = null;
document.observe("dom:loaded", function() {
  
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
      }
  });
  
  document.observe('change', function(e, el) {
      if (el = e.findElement('.ct')) {
        var product = el.up('.product');
        if (product) {
          var compute = true;
          product.select('.ct').each(function(ct){
              alert(parseInt(ct.value));
              if (!Object.isNumber(parseInt(ct.value))) {
                  compute = false;
              }
          });
          alert('compute: ' + compute);
        }
      }
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