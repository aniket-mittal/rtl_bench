module autovcoder_009438 (
    input wire [31:0] addr,
    output reg sel_ram = 0,
    output reg sel_IO = 0,
    output reg sel_read_shared = 0,
    output reg sel_write_shared = 0,
    output reg [2:0] read_select = 0
);

  always @(*) begin
    //remove the supervisor bit dummy
    case (addr[30:16])

      0: begin  //RAM select
        sel_ram <= 1;
        sel_IO <= 0;
        sel_read_shared <= 0;
        sel_write_shared <= 0;
        read_select <= 0;
      end

      1: begin  //Memory mapped IO select 
        sel_ram <= 0;
        sel_IO <= 1;
        sel_read_shared <= 0;
        sel_write_shared <= 0;
        read_select <= 1;
      end

      2: begin  //read block select
        sel_ram <= 0;
        sel_IO <= 0;
        sel_read_shared <= 1;
        sel_write_shared <= 0;
        read_select <= 2;
      end

      3: begin  //write block select 
        sel_ram <= 0;
        sel_IO <= 0;
        sel_read_shared <= 0;
        sel_write_shared <= 1;
        read_select <= 3;
      end

      default: begin  //this should never happen
        sel_ram <= 1;  //read from main mem? I could trigger error IRQ
        sel_IO <= 0;
        sel_read_shared <= 0;
        sel_write_shared <= 0;
        read_select <= 0;
      end
    endcase

  end
endmodule

