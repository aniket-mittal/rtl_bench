// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06635 dut (
    .clk(clk),
    .Wr_Strobe(in_vec[36:36]),
    .Rd_Strobe(in_vec[35:35]),
    .AddrIn(in_vec[34:27]),
    .DataIn(in_vec[26:19]),
    .MotCtl(in_vec[18:11]),
    .MapVal(in_vec[10:9]),
    .reset(in_vec[8:8]),
    .BotConfig(in_vec[7:0]),
    .DataOut(out_vec[72:65]),
    .LocX(out_vec[64:57]),
    .LocY(out_vec[56:49]),
    .BotInfo(out_vec[48:41]),
    .Sensors(out_vec[40:33]),
    .LMDist(out_vec[32:25]),
    .RMDist(out_vec[24:17]),
    .MapX(out_vec[16:9]),
    .MapY(out_vec[8:1]),
    .upd_sysregs(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h12c5690128;
    stim[1] = 37'h0df31e0bcd;
    stim[2] = 37'h08b286046a;
    stim[3] = 37'h00eea7921a;
    stim[4] = 37'h0a8d409a73;
    stim[5] = 37'h0e5d79b00c;
    stim[6] = 37'h06731e8a29;
    stim[7] = 37'h0eaaf3a25c;
    stim[8] = 37'h1718235439;
    stim[9] = 37'h1460df7ac8;
    stim[10] = 37'h101dfbe28f;
    stim[11] = 37'h1a66933243;
    stim[12] = 37'h1e1c195a85;
    stim[13] = 37'h17129b72a9;
    stim[14] = 37'h019d8d82a9;
    stim[15] = 37'h0e643e1e1e;
    stim[16] = 37'h1de9efdc5a;
    stim[17] = 37'h10f3a6da46;
    stim[18] = 37'h02a923d8af;
    stim[19] = 37'h1fab934266;
    stim[20] = 37'h17610aa2a7;
    stim[21] = 37'h0aeb6222a1;
    stim[22] = 37'h13209e6031;
    stim[23] = 37'h05a6cc5694;
    stim[24] = 37'h1151aea861;
    stim[25] = 37'h071697da3d;
    stim[26] = 37'h0f83abae2b;
    stim[27] = 37'h0df4cc1aca;
    stim[28] = 37'h062bf17091;
    stim[29] = 37'h1f278952b1;
    stim[30] = 37'h13e81a5a10;
    stim[31] = 37'h0e6540ce29;
    stim[32] = 37'h1fb258de9b;
    stim[33] = 37'h044c181a47;
    stim[34] = 37'h0e23369cc8;
    stim[35] = 37'h08bdd70ce2;
    stim[36] = 37'h16993e6226;
    stim[37] = 37'h0a6d68ae03;
    stim[38] = 37'h1b37478653;
    stim[39] = 37'h1546fd7c4c;
    stim[40] = 37'h0dc80c1e1d;
    stim[41] = 37'h01ea78fedf;
    stim[42] = 37'h1c114f1e1c;
    stim[43] = 37'h11e7d788a6;
    stim[44] = 37'h1c2c6c1a4e;
    stim[45] = 37'h194d2388a2;
    stim[46] = 37'h1656965aae;
    stim[47] = 37'h13a389faa3;
    stim[48] = 37'h19742e0ce3;
    stim[49] = 37'h10da74603a;
    stim[50] = 37'h1a6aa33812;
    stim[51] = 37'h1ff34aa640;
    stim[52] = 37'h17e5b2428b;
    stim[53] = 37'h0b96286ca4;
    stim[54] = 37'h174ce25117;
    stim[55] = 37'h1d0c404eb9;
    stim[56] = 37'h14bf2ea430;
    stim[57] = 37'h12cfef8cbd;
    stim[58] = 37'h1f30232c24;
    stim[59] = 37'h0f736284d6;
    stim[60] = 37'h03b8ad8e0b;
    stim[61] = 37'h15f200b083;
    stim[62] = 37'h00b66d7035;
    stim[63] = 37'h1d117094a8;
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
      expv[0] = 73'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 73'hxxx00000000000xxxxx;
      expv[2] = 73'h00000000000000xxxxx;
      expv[3] = 73'h00000000000000xxxxx;
      expv[4] = 73'h00000000000000xxxxx;
      expv[5] = 73'h00000000000000xxxxx;
      expv[6] = 73'h00000000000000xxxxx;
      expv[7] = 73'h00000000000000xxxxx;
      expv[8] = 73'h00000000000000xxxxx;
      expv[9] = 73'h00000000000000xxxxx;
      expv[10] = 73'h00000000000000xxxxx;
      expv[11] = 73'h00800000800000xxxxx;
      expv[12] = 73'h00000017e00000xxxxx;
      expv[13] = 73'h17e00017e00000xxxxx;
      expv[14] = 73'h00000017e00000xxxxx;
      expv[15] = 73'h10600017e00000xxxxx;
      expv[16] = 73'h00000017e00000xxxxx;
      expv[17] = 73'h00000017e00000xxxxx;
      expv[18] = 73'h00000017e00000xxxxx;
      expv[19] = 73'h00000017e00000xxxxx;
      expv[20] = 73'h00000017e00000xxxxx;
      expv[21] = 73'h00000017e00e40xxxxx;
      expv[22] = 73'h00000a70600e40xxxxx;
      expv[23] = 73'h00000a70600e40xxxxx;
      expv[24] = 73'h02600a70626e40xxxxx;
      expv[25] = 73'h00000a70626e40xxxxx;
      expv[26] = 73'h0a600a70626e40xxxxx;
      expv[27] = 73'h0ea00a70626e40xxxxx;
      expv[28] = 73'h00000a70626e40xxxxx;
      expv[29] = 73'h0e400a70626e40xxxxx;
      expv[30] = 73'h02600a70626e40xxxxx;
      expv[31] = 73'h00000a707e2e40xxxxx;
      expv[32] = 73'h00000a707e2e40xxxxx;
      expv[33] = 73'h00000a707e2e40xxxxx;
      expv[34] = 73'hxxx00a707e2e40xxxxx;
      expv[35] = 73'h1e200a707e2e40xxxxx;
      expv[36] = 73'h1c400a707e2e40xxxxx;
      expv[37] = 73'h10600a707e2e40xxxxx;
      expv[38] = 73'h00000a64fe2e40xxxxx;
      expv[39] = 73'h09600a64fe2e40xxxxx;
      expv[40] = 73'hxxx00a64fe2e401bxxx;
      expv[41] = 73'hxxx00a64fe2e401bxxx;
      expv[42] = 73'h00000a64fe2e401bxxx;
      expv[43] = 73'h0a600a64fe2e401bxxx;
      expv[44] = 73'h00000524fe2e401bxxx;
      expv[45] = 73'h0e400524fe2e401bxxx;
      expv[46] = 73'hxxx00524fe2e401bf49;
      expv[47] = 73'h00200524fe2e401bf49;
      expv[48] = 73'h1e200524fe2e401bf49;
      expv[49] = 73'h00000524fe2e401bf48;
      expv[50] = 73'h00000524fe2e401bf48;
      expv[51] = 73'h00000524fe2e401bf48;
      expv[52] = 73'h00000524fe31bd1bf49;
      expv[53] = 73'h00000524fe31bd1bf49;
      expv[54] = 73'h05200524ee31bd1bf49;
      expv[55] = 73'h148000000000001bf48;
      expv[56] = 73'h000000000000001bf48;
      expv[57] = 73'h060000000000001bf48;
      expv[58] = 73'h148000000000001bffa;
      expv[59] = 73'h000000000000001bffa;
      expv[60] = 73'h000000000000001bffa;
      expv[61] = 73'h016000000000001bffa;
      expv[62] = 73'h000000000000001bffb;
      expv[63] = 73'h008000000000001bffb;
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
