module rtlpp_01787(data_o, data_i, data_load, key_load, clk_i);

  output wire [63:0] data_o;
  input  wire [79:0] data_i;
  input  wire clk_i;
  input  wire key_load;
  input  wire data_load;

  reg  [63:0] state;
  reg  [4:0]  round_counter;
  reg  [79:0] key;

  wire [63:0] round_key;
  wire [63:0] sub_per_input;
  wire [63:0] sub_per_output;
  wire [79:0] key_update_output;

  // Embedded sub_per logic
  function [63:0] sub_per;
    input [63:0] data_i;
    integer i;
    reg [3:0] sbox [0:15];
    reg [63:0] sb_data;
  begin
    // Example S-box (needs to be replaced with actual S-box values)
    sbox[0] = 4'h0;
    sbox[1] = 4'h1;
    sbox[2] = 4'h2;
    sbox[3] = 4'h3;
    sbox[4] = 4'h4;
    sbox[5] = 4'h5;
    sbox[6] = 4'h6;
    sbox[7] = 4'h7;
    sbox[8] = 4'h8;
    sbox[9] = 4'h9;
    sbox[10] = 4'hA;
    sbox[11] = 4'hB;
    sbox[12] = 4'hC;
    sbox[13] = 4'hD;
    sbox[14] = 4'hE;
    sbox[15] = 4'hF;

    for (i = 0; i < 16; i = i + 1) begin
      sb_data[i*4 +: 4] = sbox[data_i[i*4 +: 4]];
    end
    sub_per = sb_data; // Assuming no permutation is applied, just S-box substitution
  end
  endfunction

  // Embedded key_update logic
  function [79:0] key_update;
    input [79:0] key;
    input [4:0]  round_counter;
    reg [79:0]  new_key;
  begin
    // Simple rotation and XOR with round_counter logic (replace with actual key schedule algorithm)
    new_key = {key[18:0], key[79:19]}; // rotate key by 19 to the left
    new_key[79:76] = new_key[79:76] ^ round_counter; // XORing part of key with round_counter
    key_update = new_key;
  end
  endfunction

  assign round_key = key[79:16];
  assign sub_per_input = state ^ round_key;
  assign sub_per_output = sub_per(sub_per_input);
  assign key_update_output = key_update(key, round_counter);
  assign data_o = sub_per_input;

  always @(posedge clk_i) begin
    if (key_load) begin
      key <= data_i;
    end else if (!key_load) begin
      if (data_load) begin
        state <= data_i[63:0];
        round_counter <= 5'b00001;
      end else if (!data_load) begin
        round_counter <= round_counter + 1'b1;
        state <= sub_per_output;
        key <= key_update_output;
      end
    end
  end

endmodule