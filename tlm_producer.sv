`include "tlm_transaction.sv"
class producer extends uvm_component;
  
  uvm_blocking_put_port #(trans) put_port;  //port declaration for put task
  uvm_blocking_get_imp #(trans, producer) get_export;
  
  function new(string name, uvm_component parent);
     super.new(name, parent);
    put_port= new("put_port", this);
    get_export=new("get_export", this);
   
  endfunction
  
  task run_phase(uvm_phase phase);
    trans t;
    
    for(int i=0;i<10;i++) //generate and randomize ten transactions and put it
      begin
        t=new("txn");
        if(!t.randomize)begin
          `uvm_info(get_type_name(), $sformatf("Problem in randomizing txn in producer run task"), UVM_MEDIUM);
        end
      put_port.put(t);
      end
  endtask
  
  task get(output trans t);
    trans temp=new("txn");
    if(!temp.randomize)
      `uvm_info(get_type_name(), $sformatf("randomize failed inside get task in producer"), UVM_MEDIUM);//assign values to temp
    t=temp;
    
  endtask
  
  
endclass
