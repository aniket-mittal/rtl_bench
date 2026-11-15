// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03284 dut (
    .CLK(clk),
    .DATA_IN(in_vec[42:35]),
    .RESET(in_vec[34:34]),
    .START(in_vec[33:33]),
    .LOAD(in_vec[32:32]),
    .CRC_IN(in_vec[31:0]),
    .CRC_OUT(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h255f82a59bd;
    stim[1] = 43'h6a7430f460c;
    stim[2] = 43'h6d9ef086d69;
    stim[3] = 43'h1a1641917a2;
    stim[4] = 43'h5d38b981d2f;
    stim[5] = 43'h7138e4f2f52;
    stim[6] = 43'h0f0489f4c17;
    stim[7] = 43'h6001deaff91;
    stim[8] = 43'h3228cffd742;
    stim[9] = 43'h060219a4f85;
    stim[10] = 43'h60f1a6bc272;
    stim[11] = 43'h79845df9bf9;
    stim[12] = 43'h220a7745523;
    stim[13] = 43'h730cca77bd8;
    stim[14] = 43'h4d23c58254f;
    stim[15] = 43'h09a420e5378;
    stim[16] = 43'h58b8b3440b3;
    stim[17] = 43'h77ac9c77246;
    stim[18] = 43'h05993b0be5b;
    stim[19] = 43'h023dd3fdea0;
    stim[20] = 43'h6436bc20dd6;
    stim[21] = 43'h0e9f7466836;
    stim[22] = 43'h2db0b109ee5;
    stim[23] = 43'h448094e3bed;
    stim[24] = 43'h1c882ea1f1c;
    stim[25] = 43'h4fb592f3fac;
    stim[26] = 43'h72bd5eb7f57;
    stim[27] = 43'h018146e35e5;
    stim[28] = 43'h39b672ec61d;
    stim[29] = 43'h4b3ccd670fd;
    stim[30] = 43'h7c9af9d603e;
    stim[31] = 43'h34a26840407;
    stim[32] = 43'h7e907fbf789;
    stim[33] = 43'h01a174b7f37;
    stim[34] = 43'h380707c426f;
    stim[35] = 43'h399db451452;
    stim[36] = 43'h6735b4317d4;
    stim[37] = 43'h1f0450028c8;
    stim[38] = 43'h64a3380a3b4;
    stim[39] = 43'h4183140e7c2;
    stim[40] = 43'h053f0d289d1;
    stim[41] = 43'h7a90ec9b2f3;
    stim[42] = 43'h5b2abc0b786;
    stim[43] = 43'h378a23f282f;
    stim[44] = 43'h263d18b3d80;
    stim[45] = 43'h211ddf0e043;
    stim[46] = 43'h5b361479ed0;
    stim[47] = 43'h42bb85d75b6;
    stim[48] = 43'h4c8a4607508;
    stim[49] = 43'h2c2a5491490;
    stim[50] = 43'h62272bf1339;
    stim[51] = 43'h168ba8157f9;
    stim[52] = 43'h51a54cd84e7;
    stim[53] = 43'h6dacf659e95;
    stim[54] = 43'h2884b28f437;
    stim[55] = 43'h302c0420582;
    stim[56] = 43'h2615ce9afcf;
    stim[57] = 43'h2d21fc8cc38;
    stim[58] = 43'h5a312986a47;
    stim[59] = 43'h571407c6d2e;
    stim[60] = 43'h231b936f84f;
    stim[61] = 43'h040547591fd;
    stim[62] = 43'h41b99443704;
    stim[63] = 43'h07a5317a2d3;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h029f3b8d;
      expv[4] = 32'h641917a2;
      expv[5] = 32'h8b981d2f;
      expv[6] = 32'h48ee5eaf;
      expv[7] = 32'h30fb2a98;
      expv[8] = 32'h30fb2a98;
      expv[9] = 32'h30fb2a98;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h594b8b3e;
      expv[13] = 32'h594b8b3e;
      expv[14] = 32'h594b8b3e;
      expv[15] = 32'h594b8b3e;
      expv[16] = 32'h1b428e40;
      expv[17] = 32'h6486adf8;
      expv[18] = 32'h80f3de32;
      expv[19] = 32'h67344a5a;
      expv[20] = 32'hdd3fdea0;
      expv[21] = 32'h0c8c1d36;
      expv[22] = 32'hc293d67d;
      expv[23] = 32'h0b109ee5;
      expv[24] = 32'h68094c8f;
      expv[25] = 32'h68094c8f;
      expv[26] = 32'h592f3fac;
      expv[27] = 32'h68337703;
      expv[28] = 32'h6bb66145;
      expv[29] = 32'h672ec61d;
      expv[30] = 32'h71d3b00c;
      expv[31] = 32'h085e7d5c;
      expv[32] = 32'h085e7d5c;
      expv[33] = 32'hf6198420;
      expv[34] = 32'hf6198420;
      expv[35] = 32'h87f9b1d2;
      expv[36] = 32'hdb451452;
      expv[37] = 32'h5b4317d4;
      expv[38] = 32'h71cf804d;
      expv[39] = 32'h71cf804d;
      expv[40] = 32'h54b62816;
      expv[41] = 32'hf0d289d1;
      expv[42] = 32'h74bbfd17;
      expv[43] = 32'h74bbfd17;
      expv[44] = 32'heff5baff;
      expv[45] = 32'hd18b3d80;
      expv[46] = 32'h9fed39b5;
      expv[47] = 32'h61479ed0;
      expv[48] = 32'h4842cd4c;
      expv[49] = 32'h2e8a5c3a;
      expv[50] = 32'h2e8a5c3a;
      expv[51] = 32'h706e69ed;
      expv[52] = 32'hc0531312;
      expv[53] = 32'hc0531312;
      expv[54] = 32'hf2f5f15e;
      expv[55] = 32'h4f1b19a7;
      expv[56] = 32'h4f1b19a7;
      expv[57] = 32'hbb75ad25;
      expv[58] = 32'hbb75ad25;
      expv[59] = 32'hb4c519de;
      expv[60] = 32'hc519de00;
      expv[61] = 32'hb936f84f;
      expv[62] = 32'hb936f84f;
      expv[63] = 32'h99443704;
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
