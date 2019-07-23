package Sink;

  import Packets::*;

  class Sink;

    mailbox #(Packet) inChan = new();
    Packet PacketPointer;
    Packet goodPackets[int];
    int numOfPackets;

    function new(int numOfPackets);
      this.numOfPackets = numOfPackets;
    endfunction

    task run();

      for(int i = 0; i < numOfPackets; i++) begin
        
        inChan.get(PacketPointer);
        
        if(PacketPointer.checkCRC()) begin
          goodPackets[PacketPointer.packetID] = PacketPointer;
          $display("Sink: Received a good Packet of ID: %0d", PacketPointer.packetID);
        end
        else
          $display("Sink: Received a corrupt Packet of ID: %0d", PacketPointer.packetID);

      end

    endtask

  endclass

endpackage