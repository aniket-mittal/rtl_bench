// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002207 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h14fad6ce3;
    stim[1] = 33'h156da8cd2;
    stim[2] = 33'h021425831;
    stim[3] = 33'h08a356693;
    stim[4] = 33'h0a9d1bbfb;
    stim[5] = 33'h05f574f62;
    stim[6] = 33'h0e5ee6bf7;
    stim[7] = 33'h0ea579310;
    stim[8] = 33'h05d2fc5e6;
    stim[9] = 33'h149674833;
    stim[10] = 33'h072086920;
    stim[11] = 33'h03fb5c4c7;
    stim[12] = 33'h041bddac1;
    stim[13] = 33'h02b5cbab4;
    stim[14] = 33'h0424c8544;
    stim[15] = 33'h0705307bf;
    stim[16] = 33'h05b1ca355;
    stim[17] = 33'h0729708f0;
    stim[18] = 33'h0918de213;
    stim[19] = 33'h0afb6c2db;
    stim[20] = 33'h0999d205c;
    stim[21] = 33'h019283b8d;
    stim[22] = 33'h08c8f0a2c;
    stim[23] = 33'h08d914d0a;
    stim[24] = 33'h09f9d87d8;
    stim[25] = 33'h0ad15d6fb;
    stim[26] = 33'h00f3df2cf;
    stim[27] = 33'h0951e719e;
    stim[28] = 33'h090b6040e;
    stim[29] = 33'h1dba9138d;
    stim[30] = 33'h0b93867a7;
    stim[31] = 33'h023fa24e8;
    stim[32] = 33'h07ef6e134;
    stim[33] = 33'h052b3aca0;
    stim[34] = 33'h0492f013e;
    stim[35] = 33'h060eb9b12;
    stim[36] = 33'h0e597af6e;
    stim[37] = 33'h042c19ae6;
    stim[38] = 33'h0a0a8b316;
    stim[39] = 33'h07bc53db5;
    stim[40] = 33'h0a83c729d;
    stim[41] = 33'h013080ce9;
    stim[42] = 33'h047bc2187;
    stim[43] = 33'h08596a731;
    stim[44] = 33'h03f2c8bc3;
    stim[45] = 33'h0eb3b0a86;
    stim[46] = 33'h0cce7b5a0;
    stim[47] = 33'h1cdee0334;
    stim[48] = 33'h061326314;
    stim[49] = 33'h02e9aa261;
    stim[50] = 33'h0d5f256c4;
    stim[51] = 33'h04f93a93a;
    stim[52] = 33'h003543d1e;
    stim[53] = 33'h09b8223f7;
    stim[54] = 33'h05a5d53b2;
    stim[55] = 33'h06ef3e211;
    stim[56] = 33'h00a04a7fc;
    stim[57] = 33'h057e17def;
    stim[58] = 33'h16bf810bf;
    stim[59] = 33'h059cddeb5;
    stim[60] = 33'h005af0986;
    stim[61] = 33'h07b5e6559;
    stim[62] = 33'h0fd51adeb;
    stim[63] = 33'h01a32c9c6;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxxd2;
      expv[3] = 74'h00000000xxxxxxxxx31;
      expv[4] = 74'h00000000xxxxxxxxx31;
      expv[5] = 74'h0000000000000000031;
      expv[6] = 74'h0000000000000000031;
      expv[7] = 74'h0000000000000000131;
      expv[8] = 74'h0000000000000000010;
      expv[9] = 74'h0000000000000000010;
      expv[10] = 74'h0000000000000000110;
      expv[11] = 74'h0000000000000000020;
      expv[12] = 74'h0000000000000000020;
      expv[13] = 74'h0000000000000000020;
      expv[14] = 74'h0000000000000000020;
      expv[15] = 74'h0000000000000000120;
      expv[16] = 74'h00000000000000000bf;
      expv[17] = 74'h00000000000000000bf;
      expv[18] = 74'h00000000000000000bf;
      expv[19] = 74'h00000000000000000bf;
      expv[20] = 74'h00000000000000001bf;
      expv[21] = 74'h000000000000000005c;
      expv[22] = 74'h000000000000000005c;
      expv[23] = 74'h000000000000000005c;
      expv[24] = 74'h000000000000000005c;
      expv[25] = 74'h000000000000000015c;
      expv[26] = 74'h00000000000000000fb;
      expv[27] = 74'h00000000000000000fb;
      expv[28] = 74'h00000000000000000fb;
      expv[29] = 74'h00000000000000000fb;
      expv[30] = 74'h00000000000000001fb;
      expv[31] = 74'h00000000000000000a7;
      expv[32] = 74'h00000000000000000a7;
      expv[33] = 74'h00000000000000000a7;
      expv[34] = 74'h00000000000000000a7;
      expv[35] = 74'h00000000000000001a7;
      expv[36] = 74'h0000000000000000012;
      expv[37] = 74'h0000000000000000012;
      expv[38] = 74'h0000000000000000012;
      expv[39] = 74'h0000000000000000012;
      expv[40] = 74'h0000000000000000112;
      expv[41] = 74'h000000000000000009d;
      expv[42] = 74'h000000000000000009d;
      expv[43] = 74'h000000000000000009d;
      expv[44] = 74'h000000000000000009d;
      expv[45] = 74'h000000000000000019d;
      expv[46] = 74'h0000000000000000086;
      expv[47] = 74'h0000000000000000086;
      expv[48] = 74'h0000000000000000186;
      expv[49] = 74'h0000000000000000014;
      expv[50] = 74'h0000000000000000014;
      expv[51] = 74'h0000000000000000014;
      expv[52] = 74'h0000000000000000014;
      expv[53] = 74'h0000000000000000114;
      expv[54] = 74'h00000000000000000f7;
      expv[55] = 74'h00000000000000000f7;
      expv[56] = 74'h00000000000000000f7;
      expv[57] = 74'h00000000000000000f7;
      expv[58] = 74'h00000000000000001f7;
      expv[59] = 74'h00000000000000001bf;
      expv[60] = 74'h00000000000000000b5;
      expv[61] = 74'h00000000000000000b5;
      expv[62] = 74'h00000000000000000b5;
      expv[63] = 74'h00000000000000000b5;
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
