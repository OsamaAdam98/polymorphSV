package Source;  

  import Packets::*;
  
  class Source;

    mailbox #(Packet) outChan = new();
    int typeOnePackets, typeTwoPackets;
    Packet PacketPointer;
    PacketTypeOne PacketOne = new();
    PacketTypeTwo PacketTwo = new();

    function new(int typeOnePackets, typeTwoPackets);

      this.typeOnePackets = typeOnePackets;
      this.typeTwoPackets = typeTwoPackets;

    endfunction

    task run();

      PacketOne.initPacket(this.typeOnePackets);
      PacketTwo.initPacket(this.typeTwoPackets);

      PacketPointer = PacketOne;
      outChan.put(PacketPointer);
      PacketPointer = PacketTwo;
      outchat.put(PacketPointer);

    endtask

  endclass

endpackage