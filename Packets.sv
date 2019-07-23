package Packets;

  virtual class Packet;
    byte unsigned payload[];
    byte unsigned crc;
    byte unsigned generatedCRC;
    int packetID;
    static int numberOfPackets = 0;
    
    function new();
      packetID = ++numberOfPackets;
    endfunction
    
    pure virtual function void genCRC(); //endfunction

    function bit checkCRC();

      if(generatedCRC == crc)
        return 1;
      else
        return 0;
    
    endfunction
    
    function void printPayload();
      for (int i = 0; i < payload.size(); i++)
        $display(payload[i]);
    endfunction
    
    function void initPacket(int payloadSize);
      payload = new[payloadSize];
      for (int i = 0; i < payloadSize; i++)
        payload[i] = $urandom_range(1, 1000); //Edited so it doesn't generate any zeros.
      genCRC();    
      //crc++; // insert error by uncommenting this line
      //$display("genCRC = %0d, CRC = %0d", generatedCRC, crc);
    endfunction 
  endclass

  class PacketTypeOne extends Packet;


    function void genCRC();

      generatedCRC = 0;

      foreach(payload[i]) begin
        generatedCRC += payload[i];
        //$display("typeOne CRC = %0d", generatedCRC);
      end

      crc = generatedCRC;
    endfunction

  endclass

  class PacketTypeTwo extends Packet;

    function void genCRC();

      generatedCRC = 1;

      foreach(payload[i]) begin
        generatedCRC *= payload[i];
        //$display("typeTwo CRC = %0d", generatedCRC);
      end

      crc = generatedCRC;
    endfunction

  endclass

endpackage
