module Top();

  import Env::*, Source::*, Sink::*;

  Env testEnv = new();  

  initial begin
    testEnv.connect();
    testEnv.run();
  end     

endmodule
