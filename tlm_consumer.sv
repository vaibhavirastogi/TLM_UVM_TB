
class consumer extends uvm_component;
  
  uvm_blocking_put_imp#(trans, consumer) put_export; 
  uvm_blocking_get_port#(trans) get_port;
  
  
  function new(string name, uvm_component parent);
     super.new(name, parent);
    get_port=new("get_port", this);
    put_export=new("put_export", this);    
    
  endfunction
  
  
  task run_phase(uvm_phase phase);
    trans t;
    
    for(int i=0;i<10;i++)
      begin
      get_port.get(t);
        `uvm_info("consumer", $sformatf("receiving from the producer using get task %h", t.data), UVM_MEDIUM)
      end
  endtask
  
  
  task put(input trans t);
    `uvm_info("consumer", $sformatf("producer put the following data onto consumer using put task: %h", t.data), UVM_MEDIUM)
  endtask
  
  
endclass
