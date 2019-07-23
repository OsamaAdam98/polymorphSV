package Source;  

  import Packets::*;
  
  class Source;

    mailbox #(Packet) outChan = new();
    int typeOnePackets, typeTwoPackets;
    Packet PacketPointer;
    PacketTypeOne PacketOne;
    PacketTypeTwo PacketTwo;

    function new(int typeOnePackets, typeTwoPackets);

      this.typeOnePackets = typeOnePackets;
      this.typeTwoPackets = typeTwoPackets;

    endfunction

    task run();

      for(int i = 0; i < this.typeOnePackets; i++) begin
        PacketOne = new();
        PacketPointer = PacketOne;
        outChan.put(PacketPointer);
        $display("Source: Sent Packet of ID: %0d", PacketPointer.packetID);
      end

      for(int i = 0; i < this.typeTwoPackets; i++) begin
        PacketTwo = new();
        PacketPointer = PacketTwo;
        outChan.put(PacketPointer);
        $display("Source: Sent Packet of ID: %0d", PacketPointer.packetID);
      end

    endtask

  endclass

endpackage