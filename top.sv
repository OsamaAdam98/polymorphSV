module Top();

  import Env::*;

  Env testEnv = new();  

  initial begin
    testEnv.connect();
    testEnv.run();
  end     

endmodule
