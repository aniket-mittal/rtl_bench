// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_041830 dut (
    .clk(clk),
    .alu_op_mul(in_vec[66:66]),
    .ex_freeze(in_vec[65:65]),
    .reset(in_vec[64:64]),
    .a_in(in_vec[63:32]),
    .b_in(in_vec[31:0]),
    .mul_prod_r(out_vec[64:1]),
    .mul_stall(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h53562235b19e35920;
    stim[1] = 67'h7639c86782b7257d0;
    stim[2] = 67'h0e21d2eeef023338c;
    stim[3] = 67'h477269b6884aa0515;
    stim[4] = 67'h6bf31e8748c101e9b;
    stim[5] = 67'h4f72837b1591a691f;
    stim[6] = 67'h0245cf38dc0031eae;
    stim[7] = 67'h60e1d97fd24c20f88;
    stim[8] = 67'h68a33c87af53976c3;
    stim[9] = 67'h6b269acd0ae65f81a;
    stim[10] = 67'h6a3c2b8e4f0aaebbe;
    stim[11] = 67'h31ff9eb89d5dbc8a4;
    stim[12] = 67'h05ab4f380b8059e22;
    stim[13] = 67'h48d6dfaf4d9de6770;
    stim[14] = 67'h2ff272ab825e3939c;
    stim[15] = 67'h6f55781f6b451b54e;
    stim[16] = 67'h0753586b678e3a48f;
    stim[17] = 67'h4694dc4373cdcbda1;
    stim[18] = 67'h2ec47676d7791f225;
    stim[19] = 67'h203ff2f93b84aadb7;
    stim[20] = 67'h03fe90b99b8b767cb;
    stim[21] = 67'h48362453cb14fd10d;
    stim[22] = 67'h7013bc4efb1a6c3f6;
    stim[23] = 67'h68222a432ffc9b344;
    stim[24] = 67'h0603fd0186c94852a;
    stim[25] = 67'h4753b718c24f4db37;
    stim[26] = 67'h4cf43b47cf9f75ce7;
    stim[27] = 67'h285b8c9e201e866e5;
    stim[28] = 67'h0e863c4b02668b5ef;
    stim[29] = 67'h6ad8d0f7fca35f76c;
    stim[30] = 67'h2c9ff1433aa90b37f;
    stim[31] = 67'h63c535c7c739497d1;
    stim[32] = 67'h6c736204d08a20240;
    stim[33] = 67'h203217f21c3d55b9b;
    stim[34] = 67'h27d474254c3370c70;
    stim[35] = 67'h29813ca46cf96156e;
    stim[36] = 67'h450d9b1096546ac89;
    stim[37] = 67'h27bd8ff97056282fc;
    stim[38] = 67'h0ad4725b74e6e1faa;
    stim[39] = 67'h25cd33bbf91fd81a2;
    stim[40] = 67'h4fe35085c9edaea91;
    stim[41] = 67'h0a1f89a89bce3854f;
    stim[42] = 67'h0d78a17458de00b64;
    stim[43] = 67'h298335fed89996994;
    stim[44] = 67'h0310ded5edfa8ba43;
    stim[45] = 67'h04095afd15e52b20e;
    stim[46] = 67'h419656e0874e55656;
    stim[47] = 67'h2c5e909b2f1c3f7e5;
    stim[48] = 67'h0f6f371e2efc5c27f;
    stim[49] = 67'h6aac30102abb6e305;
    stim[50] = 67'h247a4edf6f69cf0cf;
    stim[51] = 67'h08bebf0c88b9660fa;
    stim[52] = 67'h6abe6f3467abdcc56;
    stim[53] = 67'h0498d859b8a962127;
    stim[54] = 67'h6774ce83b8d516232;
    stim[55] = 67'h24aeb68b3ea5df1d6;
    stim[56] = 67'h6d0dd826271935ef4;
    stim[57] = 67'h6056a8f181471d514;
    stim[58] = 67'h4a2bb825341265c72;
    stim[59] = 67'h45e2bc650dfdb116a;
    stim[60] = 67'h2f10553d976b4dcd1;
    stim[61] = 67'h605feb14cd004ad91;
    stim[62] = 67'h058e64dbf281e309b;
    stim[63] = 67'h06a2bd428b29d8a36;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 65'h00000000000000001;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000001;
      expv[4] = 65'h00000000109540a2b;
      expv[5] = 65'h00000000109540a2b;
      expv[6] = 65'h00000000109540a2b;
      expv[7] = 65'h00000000084aa0515;
      expv[8] = 65'h00000000084aa0515;
      expv[9] = 65'h00000000084aa0515;
      expv[10] = 65'h00000000084aa0515;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000001;
      expv[14] = 65'h000000001b3bccee1;
      expv[15] = 65'h000000001b3bccee1;
      expv[16] = 65'h000000001b3bccee1;
      expv[17] = 65'h000000001b3bccee1;
      expv[18] = 65'h000000000d9de6771;
      expv[19] = 65'h000000000d9de6771;
      expv[20] = 65'h000000000d9de6771;
      expv[21] = 65'h000000000d9de6771;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000001;
      expv[26] = 65'h00000000049e9b66f;
      expv[27] = 65'h00000000024f4db37;
      expv[28] = 65'h00000000024f4db37;
      expv[29] = 65'h00000000024f4db37;
      expv[30] = 65'h00000000024f4db37;
      expv[31] = 65'h00000000024f4db37;
      expv[32] = 65'h00000000024f4db37;
      expv[33] = 65'h00000000024f4db37;
      expv[34] = 65'h00000000024f4db37;
      expv[35] = 65'h00000000024f4db37;
      expv[36] = 65'h00000000024f4db37;
      expv[37] = 65'h00000000024f4db37;
      expv[38] = 65'h00000000024f4db37;
      expv[39] = 65'h00000000024f4db37;
      expv[40] = 65'h00000000024f4db37;
      expv[41] = 65'h00000000024f4db37;
      expv[42] = 65'h000000000127a6d9b;
      expv[43] = 65'h000000000093d36cd;
      expv[44] = 65'h000000000093d36cd;
      expv[45] = 65'h000000000093d36cd;
      expv[46] = 65'h000000000049e9b67;
      expv[47] = 65'h000000000024f4db3;
      expv[48] = 65'h000000000024f4db3;
      expv[49] = 65'h000000000024f4db3;
      expv[50] = 65'h000000000024f4db3;
      expv[51] = 65'h000000000024f4db3;
      expv[52] = 65'h000000000024f4db3;
      expv[53] = 65'h000000000024f4db3;
      expv[54] = 65'h000000000024f4db3;
      expv[55] = 65'h000000000024f4db3;
      expv[56] = 65'h000000000024f4db3;
      expv[57] = 65'h000000000024f4db3;
      expv[58] = 65'h000000000024f4db3;
      expv[59] = 65'h000000000024f4db3;
      expv[60] = 65'h0000000000127a6d9;
      expv[61] = 65'h0000000000127a6d9;
      expv[62] = 65'h0000000000127a6d9;
      expv[63] = 65'h0000000000127a6d9;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
