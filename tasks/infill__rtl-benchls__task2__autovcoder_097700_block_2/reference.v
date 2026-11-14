module autovcoder_097700 (
    input        clk,
    input        rst,
    input        crc_en_in,
    input [31:0] crc_in,

    output reg        crc_en_out,
    output reg [31:0] crc_out
);

  //*******************
  //DEFINE LOCAL PARAMETER
  //*******************
  //parameter(s)



  //*********************
  //INNER SIGNAL DECLARATION
  //*********************
  //REGS


  //WIRES


  //*********************
  //INSTANTCE MODULE
  //*********************

  function [7:0] reverse_8b;
    input [7:0] data;
    integer i;
    begin
      for (i = 0; i < 8; i = i + 1) begin
        reverse_8b[i] = data[7-i];
      end
    end
  endfunction


  //*********************
  //MAIN CORE
  //********************* 

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      crc_en_out <= 'b0  ;
      crc_out    <= 'b0  ;
    end else begin
      crc_en_out <= crc_en_in;
      crc_out <= {
        ~reverse_8b(crc_in[31:24]),
        ~reverse_8b(crc_in[23:16]),
        ~reverse_8b(crc_in[15:8]),
        ~reverse_8b(crc_in[7:0])
      };
    end
  end


  //*********************
endmodule

