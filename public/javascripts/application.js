

replace_ids = function(s){
  var new_id = new Date().getTime();
  return s.replace(/NEW_RECORD/g, new_id);
}

var quicksearch = null;
document.observe("dom:loaded", function() {

  window.setTimeout(function() {
      Effect.SlideDown('message', { duration:0.7 });
  }, 400);
  window.setTimeout(function() {
      Effect.SlideUp('message', { duration:0.7 });
  }, 3500);
  
  $$('input[data-action]').each(function(el) {
      if (el.checked) {
          $$('.' + el.readAttribute('data-target-show')).invoke('show');
      } else {
          $$('.' + el.readAttribute('data-target-show')).invoke('hide');
      }
  });

  // init Quick Search on customers/index
  if ($('qs-target') != undefined) {
    quicksearch = new CustomerFilter('qs-target');
    quicksearch.filter($F('quicksearch'));
  }
  
  // put the focus on input with a .focus selector
  $$('.focus').invoke('select');
  
  $$('.in_place_edit').each(function(ipe) {
      var input = ipe.down('input');
      var desc = ipe.down('.description');
       
      if (ipe.down('input').value=='') { // if input is empty, show in edit mode
        ipe.down('.readonly').hide();
        input.show();
        if (desc) {
            desc.show();
        }
      }
  });
  
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
      
      if (el = e.findElement('.in_place_edit')) {
          el.down('.readonly').hide();
          el.down('input').show().select();
          var desc = el.down('.description');
          if (desc) {
              desc.show();
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

document.on("click", "button[data-disable-with]", function(event, el) {
    var buttonContent = new Template('<button disabled="disabled" class="button" type="button"><img src="/images/web-app-theme/icons/hourglass.png" alt="#{imgalt}">#{buttontext}</button>');
    var data = {imgalt: el.readAttribute('data-disable-with'), buttontext: el.readAttribute('data-disable-with') };
    el.replace(buttonContent.evaluate(data));
});

document.on("change", "input[data-action]", function(event, el) {
    $$('.' + el.readAttribute('data-target-group')).invoke('hide');
    $$('.' + el.readAttribute('data-target-show')).invoke('show');
});

function toCurrency(amount) {
  var value = amount.toFixed(2) + '';
  return value.replace('.', ',');
}

Number.prototype.toCurrency = function () {
  return toCurrency(this);
}