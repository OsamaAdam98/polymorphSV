package Packets;

  virtual class Packet;
    byte unsigned payload[];
    byte unsigned crc;
    int packetID;
    static int numberOfPackets = 0;
    
    function new();
      packetID = ++numberOfPackets;
    endfunction
    
    pure virtual function void genCRC(); //endfunction
    pure virtual function bit checkCRC(); //endfunction
    
    function void printPayload();
      for (int i = 0; i < payload.size(); i++)
        $display(payload[i]);
    endfunction
    
    function void initPacket(int payloadSize);
      payload = new[payloadSize];
      for (int i = 0; i < payloadSize; i++)
        payload[i] = $random() % 256;
      gen_crc();    
  //    crc++; // insert error by uncommenting this line
    endfunction 
  endclass

  class PacketTypeOne extends Packet;

    function void genCRC();

      foreach(payload[i])
        crc += payload[i]

    endfunction

  endclass

  class PacketTypeTwo extends Packet;

    function void genCRC();

      foreach(payload[i])
        crc *= payload[i]

    endfunction

  endclass

endpackage
