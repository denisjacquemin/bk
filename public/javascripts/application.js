var quicksearch = null;

document.observe("dom:loaded", function() {
  
  // init Quick Search on customers/index
  if ($('qs-target') != undefined) {
    quicksearch = new CustomerFilter('qs-target');
    quicksearch.filter($F('quicksearch'));
  }
  
  // put the focus on input with a .focus selector
  $$('.focus').invoke('select');
  
});
