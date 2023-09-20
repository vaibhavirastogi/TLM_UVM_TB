import uvm_pkg::*;
`include "uvm_macros.svh"
//import uvm_pkg::*;
`include "tlm_environment.sv"
module tb_top;
  
  //tlm_env env();
  
  initial begin


    
    run_test("test");
  end
  
  
endmodule


class test extends uvm_test;
  `uvm_component_utils(test)
  
  tlm_env env;
  
  
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
    env=new("env", this);
  endfunction
  
  
endclass
