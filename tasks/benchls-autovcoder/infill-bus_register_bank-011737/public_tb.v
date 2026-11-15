// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 49;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011737 dut (
    .i_Bus_Clk(clk),
    .i_Bus_Rst_L(in_vec[52:52]),
    .i_Bus_CS(in_vec[51:51]),
    .i_Bus_Wr_Rd_n(in_vec[50:50]),
    .i_Bus_Addr8(in_vec[49:48]),
    .i_Bus_Wr_Data(in_vec[47:32]),
    .i_Reg_00(in_vec[31:16]),
    .i_Reg_02(in_vec[15:0]),
    .o_Bus_Rd_Data(out_vec[48:33]),
    .o_Bus_Rd_DV(out_vec[32:32]),
    .o_Reg_00(out_vec[31:16]),
    .o_Reg_02(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h1eab8b951f6846;
    stim[1] = 53'h19f4a658355406;
    stim[2] = 53'h0c1f383fb3a579;
    stim[3] = 53'h00d6e1c092344b;
    stim[4] = 53'h12ee2d26e40554;
    stim[5] = 53'h0536dbbcffb095;
    stim[6] = 53'h02c975100686ef;
    stim[7] = 53'h0cc85dbf7231d4;
    stim[8] = 53'h07fcaacdd0a5c5;
    stim[9] = 53'h046d5c0f40a3fd;
    stim[10] = 53'h062e61c3f47d49;
    stim[11] = 53'h0a5e5ba210f573;
    stim[12] = 53'h06949b8e1c0a0a;
    stim[13] = 53'h0eb69bf6cd5269;
    stim[14] = 53'h0277f97092f8ce;
    stim[15] = 53'h0e9579897042ae;
    stim[16] = 53'h0303d2ac5faf2a;
    stim[17] = 53'h0cc7bfabffcffe;
    stim[18] = 53'h0a8d5978f74d02;
    stim[19] = 53'h0c3aaca40d1066;
    stim[20] = 53'h0a45d7ef6f4926;
    stim[21] = 53'h07000927178fea;
    stim[22] = 53'h047a359916ce35;
    stim[23] = 53'h006caf2f4ea951;
    stim[24] = 53'h07a20297659c84;
    stim[25] = 53'h03c50cbbc6d9ba;
    stim[26] = 53'h0ac81da2b21f7d;
    stim[27] = 53'h0c988cfae5c437;
    stim[28] = 53'h0bd9a76d744473;
    stim[29] = 53'h0ce63fea487d01;
    stim[30] = 53'h08591e6c89f19a;
    stim[31] = 53'h002e7d27841025;
    stim[32] = 53'h082e3e7e222ff1;
    stim[33] = 53'h00a70fc5f33ba2;
    stim[34] = 53'h0f45ab637f7213;
    stim[35] = 53'h0dcc621fe364d0;
    stim[36] = 53'h07f677476d8018;
    stim[37] = 53'h0551d2f883cbad;
    stim[38] = 53'h09cd25475c5a47;
    stim[39] = 53'h0d58cb44b5d699;
    stim[40] = 53'h002e9c4ae85c78;
    stim[41] = 53'h01bc00aa008ef0;
    stim[42] = 53'h0bab9b75b012c1;
    stim[43] = 53'h0c9b3f0c4db832;
    stim[44] = 53'h0cd118d9cc1ebe;
    stim[45] = 53'h071c558528c5bc;
    stim[46] = 53'h0707a0da1d7504;
    stim[47] = 53'h0522e42fecf4b6;
    stim[48] = 53'h01b4b2adf8e08d;
    stim[49] = 53'h042eb8fde10f62;
    stim[50] = 53'h00596210d8d4a6;
    stim[51] = 53'h0efc3e8b4c6348;
    stim[52] = 53'h0889c1b8262129;
    stim[53] = 53'h0df8e2fccd0364;
    stim[54] = 53'h05412cd0709ec7;
    stim[55] = 53'h0965f105c47b93;
    stim[56] = 53'h0e1c7f49c14636;
    stim[57] = 53'h00012cc3076d82;
    stim[58] = 53'h0c3ef13518fd17;
    stim[59] = 53'h0209de2a6c2ed3;
    stim[60] = 53'h0112dba5fcc0dc;
    stim[61] = 53'h0673b920b58e4b;
    stim[62] = 53'h0f03d5d4f584bc;
    stim[63] = 53'h08a008edff41d7;
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
      expv[0] = 49'hxxxxx00000000;
      expv[1] = 49'hxxxxx0000ab8b;
      expv[2] = 49'h0b06a00000000;
      expv[3] = 49'h0b06a00000000;
      expv[4] = 49'h0b06a00000000;
      expv[5] = 49'h0b06a00000000;
      expv[6] = 49'h0b06a00000000;
      expv[7] = 49'h0b06a00000000;
      expv[8] = 49'h0b06a00000000;
      expv[9] = 49'h0b06a00000000;
      expv[10] = 49'h0b06a00000000;
      expv[11] = 49'h0b06a00000000;
      expv[12] = 49'h0b06a00000000;
      expv[13] = 49'h0b06a00000000;
      expv[14] = 49'h0b06a00000000;
      expv[15] = 49'h0b06a00000000;
      expv[16] = 49'h0b06a00000000;
      expv[17] = 49'h0b06a00000000;
      expv[18] = 49'h0b06a00000000;
      expv[19] = 49'h0b06a00000000;
      expv[20] = 49'h0b06a00000000;
      expv[21] = 49'h0b06a00000000;
      expv[22] = 49'h0b06a00000000;
      expv[23] = 49'h0b06a00000000;
      expv[24] = 49'h0b06a00000000;
      expv[25] = 49'h0b06a00000000;
      expv[26] = 49'h0b06a00000000;
      expv[27] = 49'h0b06a00000000;
      expv[28] = 49'h0b06a00000000;
      expv[29] = 49'h0b06a00000000;
      expv[30] = 49'h0b06a00000000;
      expv[31] = 49'h0b06a00000000;
      expv[32] = 49'h0b06a00000000;
      expv[33] = 49'h0b06a00000000;
      expv[34] = 49'h0b06a00000000;
      expv[35] = 49'h0b06a00000000;
      expv[36] = 49'h0b06a00000000;
      expv[37] = 49'h0b06a00000000;
      expv[38] = 49'h0b06a00000000;
      expv[39] = 49'h0b06a00000000;
      expv[40] = 49'h0b06a00000000;
      expv[41] = 49'h0b06a00000000;
      expv[42] = 49'h0b06a00000000;
      expv[43] = 49'h0b06a00000000;
      expv[44] = 49'h0b06a00000000;
      expv[45] = 49'h0b06a00000000;
      expv[46] = 49'h0b06a00000000;
      expv[47] = 49'h0b06a00000000;
      expv[48] = 49'h0b06a00000000;
      expv[49] = 49'h0b06a00000000;
      expv[50] = 49'h0b06a00000000;
      expv[51] = 49'h0b06a00000000;
      expv[52] = 49'h0b06a00000000;
      expv[53] = 49'h0b06a00000000;
      expv[54] = 49'h0b06a00000000;
      expv[55] = 49'h0b06a00000000;
      expv[56] = 49'h0b06a00000000;
      expv[57] = 49'h0b06a00000000;
      expv[58] = 49'h0b06a00000000;
      expv[59] = 49'h0b06a00000000;
      expv[60] = 49'h0b06a00000000;
      expv[61] = 49'h0b06a00000000;
      expv[62] = 49'h0b06a00000000;
      expv[63] = 49'h0b06a00000000;
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
