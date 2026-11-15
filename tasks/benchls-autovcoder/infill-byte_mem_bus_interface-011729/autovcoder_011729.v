module autovcoder_011729 (
    input logic clk,
    input logic [31:0] address,
    input logic write,
    input logic read,
    output logic waitrequest,
    input logic [31:0] writedata,
    input logic [3:0] byteenable,
    output logic [31:0] readdata
);
  // Memory (256 x 4 x 8-bit bytes) address is 32 bits (used only 11), word is 32 bits
  // Full memory supposed to be able to store 2^30 words but we reduce it to store 2^9 (512) words.
  // 11 bits used for address as it is byte addressing.

  parameter ROM_INIT_FILE = "";
  parameter address_bit_size = 11;
  parameter reset_vector = 128; // this is word addressing. 128 * 4 = 32'h00000200 which is mapped to 0xbfc00000

  // instructions start at word 128

  // If address > BFC00000, it is instruction address and needs to be mapped to start at word 128
  // otherwise, it is a data address (keep the same)

  logic [address_bit_size - 1:0] mapped_address;

  assign mapped_address = (address >=32'hBFC00000) ? address[address_bit_size-1:0] - 32'hBFC00000+32'h00000200 : address[address_bit_size-1:0];

  // Update readdata - only available one cycle after read request

  logic [7:0] bytes[0:(2**address_bit_size-1)*4];

  assign waitrequest = 0;
  //write writedata to mapped_address word
  [MASKED]

  //Initialise memory:

  initial begin
    if (ROM_INIT_FILE != "") begin  // instruction memory
      $readmemh(ROM_INIT_FILE, bytes, reset_vector * 4);  // multiply by 4 to get byte addressing
    end
  end


endmodule

