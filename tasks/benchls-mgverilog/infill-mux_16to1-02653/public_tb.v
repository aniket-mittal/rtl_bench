// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02653 dut (
    .D(in_vec[19:4]),
    .S(in_vec[3:0]),
    .Y(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h771df;
    stim[1] = 20'h44f17;
    stim[2] = 20'hd6faf;
    stim[3] = 20'h3b3cc;
    stim[4] = 20'ha8838;
    stim[5] = 20'hb4c56;
    stim[6] = 20'h61e39;
    stim[7] = 20'hba9ff;
    stim[8] = 20'he34a9;
    stim[9] = 20'h1b7a8;
    stim[10] = 20'h141a8;
    stim[11] = 20'hdc243;
    stim[12] = 20'hd5a89;
    stim[13] = 20'h973cb;
    stim[14] = 20'h3e680;
    stim[15] = 20'hc36fc;
    stim[16] = 20'h95183;
    stim[17] = 20'h743ff;
    stim[18] = 20'hd61a5;
    stim[19] = 20'h09333;
    stim[20] = 20'hedb2b;
    stim[21] = 20'ha8727;
    stim[22] = 20'h61c49;
    stim[23] = 20'had0a0;
    stim[24] = 20'hf3dfc;
    stim[25] = 20'hfc618;
    stim[26] = 20'h0cd75;
    stim[27] = 20'hc07b9;
    stim[28] = 20'h0df65;
    stim[29] = 20'h286c0;
    stim[30] = 20'h1475d;
    stim[31] = 20'h2ca3d;
    stim[32] = 20'hcd308;
    stim[33] = 20'h935ec;
    stim[34] = 20'h66075;
    stim[35] = 20'h90ffb;
    stim[36] = 20'h30239;
    stim[37] = 20'h00603;
    stim[38] = 20'he4fd9;
    stim[39] = 20'hc25f8;
    stim[40] = 20'hc014e;
    stim[41] = 20'ha6812;
    stim[42] = 20'h39736;
    stim[43] = 20'h79896;
    stim[44] = 20'h97058;
    stim[45] = 20'h9dadf;
    stim[46] = 20'h38ed8;
    stim[47] = 20'he93da;
    stim[48] = 20'hf2110;
    stim[49] = 20'h4a2d3;
    stim[50] = 20'h6195d;
    stim[51] = 20'h0db4d;
    stim[52] = 20'hdbd13;
    stim[53] = 20'hd4cac;
    stim[54] = 20'h0d558;
    stim[55] = 20'h612ca;
    stim[56] = 20'h00d00;
    stim[57] = 20'haa196;
    stim[58] = 20'h0408f;
    stim[59] = 20'h84a91;
    stim[60] = 20'hd6304;
    stim[61] = 20'h8b2b9;
    stim[62] = 20'he6cb4;
    stim[63] = 20'ha2dc2;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 1'h0;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h1;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h1;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
