package Env;

  import Packets::*, Source::*, Sink::*;

  class Env;
    // create  channel between Source & Sink
    mailbox #(Packet) src2snk = new();  
    Source src = new(5,5);  // create Source obj - send 5 of each type of Packet
    Sink snk = new(10);  // create Sink obj - receive 10 Packets
    
    function void connect();
      src.outChan = src2snk; //connect up src to mailbox 
      snk.inChan = src2snk;  //connect up snk to mailbox
    endfunction
    
    task automatic run();
      fork
        src.run(); // start up Source
        snk.run(); // start up Sink
      join_none
    endtask
  endclass

endpackage