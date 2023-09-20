`include "tlm_producer.sv"
`include "tlm_consumer.sv"
class tlm_env extends uvm_env;
  `uvm_component_utils(tlm_env)
  
  producer prod;
  consumer cons;
  
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
    prod=new("producer", this);
    cons=new("consumer", this);
  endfunction
  
  
  virtual function void connect_phase(uvm_phase phase);
    
    prod.put_port.connect(cons.put_export);
    cons.get_port.connect(prod.get_export);
  endfunction
  
  
  task run_phase(uvm_phase phase);
     phase.raise_objection(this);
      #100;
    
      phase.drop_objection(this);

    
    
  endtask
  
endclass
