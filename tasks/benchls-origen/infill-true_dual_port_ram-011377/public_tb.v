// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011377 dut (
    .clka(clk),
    .clkb(in_vec[40:40]),
    .ena(in_vec[39:39]),
    .enb(in_vec[38:38]),
    .wea(in_vec[37:37]),
    .web(in_vec[36:36]),
    .addra(in_vec[35:26]),
    .addrb(in_vec[25:16]),
    .dia(in_vec[15:8]),
    .dib(in_vec[7:0]),
    .doa(out_vec[15:8]),
    .dob(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h11c93869a7d;
    stim[1] = 41'h0b86bfcc560;
    stim[2] = 41'h01cf51a4736;
    stim[3] = 41'h0c8565ecd61;
    stim[4] = 41'h0ab89513eaa;
    stim[5] = 41'h1baf5a0f5e3;
    stim[6] = 41'h1a5bca6ad16;
    stim[7] = 41'h013369c4b30;
    stim[8] = 41'h118510dcd5d;
    stim[9] = 41'h14b0e161196;
    stim[10] = 41'h198b4bfa602;
    stim[11] = 41'h1fcd81b3c59;
    stim[12] = 41'h1b66ecacc2b;
    stim[13] = 41'h1238ed59188;
    stim[14] = 41'h14f9d2cfc02;
    stim[15] = 41'h1e0216285e9;
    stim[16] = 41'h0bca3fb3739;
    stim[17] = 41'h1eb528d5f21;
    stim[18] = 41'h0b89f2c1b16;
    stim[19] = 41'h0d55cd0f5a2;
    stim[20] = 41'h1061908dcc2;
    stim[21] = 41'h1ecdf0d8074;
    stim[22] = 41'h0fc67600b89;
    stim[23] = 41'h09177fd02d9;
    stim[24] = 41'h1b4104ab536;
    stim[25] = 41'h1b6ff7b8da1;
    stim[26] = 41'h1824d4bbdf5;
    stim[27] = 41'h015575981f1;
    stim[28] = 41'h08fe397521e;
    stim[29] = 41'h06af27b50f1;
    stim[30] = 41'h0b2273cda36;
    stim[31] = 41'h11d5bf6cb8c;
    stim[32] = 41'h1fa486d3f5f;
    stim[33] = 41'h118247dfb14;
    stim[34] = 41'h177c43ae83d;
    stim[35] = 41'h179c0aa4da8;
    stim[36] = 41'h1db60323412;
    stim[37] = 41'h0b714a6dccf;
    stim[38] = 41'h1fc6bab4453;
    stim[39] = 41'h0fb59f86ce9;
    stim[40] = 41'h066829b1126;
    stim[41] = 41'h1e4c774c744;
    stim[42] = 41'h05e348fedb0;
    stim[43] = 41'h1749cbf98a6;
    stim[44] = 41'h0a548f9fea4;
    stim[45] = 41'h184e3ad94a7;
    stim[46] = 41'h059abed20ee;
    stim[47] = 41'h0c313d085ae;
    stim[48] = 41'h0d711adf4b0;
    stim[49] = 41'h1c78fe56d80;
    stim[50] = 41'h0e9116bc2fc;
    stim[51] = 41'h0117586c047;
    stim[52] = 41'h03715b1114b;
    stim[53] = 41'h0141a0916fc;
    stim[54] = 41'h134da7a1700;
    stim[55] = 41'h19dd0a2e2e5;
    stim[56] = 41'h09c3c791792;
    stim[57] = 41'h132eda6326a;
    stim[58] = 41'h0e2675bf447;
    stim[59] = 41'h10b2912115d;
    stim[60] = 41'h10c0284ef60;
    stim[61] = 41'h06a804ba919;
    stim[62] = 41'h19fbafcb148;
    stim[63] = 41'h10aa53495a6;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'h00xx;
      expv[3] = 16'h00xx;
      expv[4] = 16'h00xx;
      expv[5] = 16'h00xx;
      expv[6] = 16'h00xx;
      expv[7] = 16'h00xx;
      expv[8] = 16'h00xx;
      expv[9] = 16'h00xx;
      expv[10] = 16'h00xx;
      expv[11] = 16'h00xx;
      expv[12] = 16'h00xx;
      expv[13] = 16'h00xx;
      expv[14] = 16'h00xx;
      expv[15] = 16'h00xx;
      expv[16] = 16'h00xx;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
