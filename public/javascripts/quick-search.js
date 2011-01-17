/*  Table row filter, version 1.0
 *  (c) 2009 Denis Jacquemin
 *
 *  Table row filter is freely distributable under the terms of an MIT license.
 *  For details, see the Table row filter github page: http://github.com/denis.jacquemin//
 *
 *--------------------------------------------------------------------------*/
var CustomerFilter = Class.create({
  
  Version: '1.0',
  
  initialize: function(list) {
    this.list = $(list);
  },
  
  rows: function() {
    return $$( '#' + this.list.id + ' .row');
  },
  
  filter: function(pattern) {
    var re = new RegExp(pattern, 'i'); 
 
    this.rows().each(function(r){

        var found = false;
        
        r.childElements().each(function(c){
          var value = c.textContent ? c.textContent : c.innerText;
          
          if (re.test(value)) {
              found = true;
              // Highligh with yellow color the string found
          }
          
        })
        
        if (!found) {
            r.hide();
        } else {
            r.show();
        }
    });
  },
  
  unfilter:function() {
      this.rows.invoke('show');
  }

});
