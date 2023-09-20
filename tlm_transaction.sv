class trans extends uvm_sequence_item;
  
  
  rand bit [31:0] data;
  
  function new(string name);
    super.new(name);
  endfunction
  
  
constraint c1_data {
    data >= 'habcd;
}
  
  
endclass
