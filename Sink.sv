package Sink;

  import Packets::*;

  class Sink;

    mailbox #(Packet) inChan = new();
    Packet goodPackets[int];

    function new(int typeOnePackets, typeTwoPackets);

      this.typeOnePackets = typeOnePackets;
      this.typeTwoPackets = typeTwoPackets;

    endfunction



  endclass

endpackage