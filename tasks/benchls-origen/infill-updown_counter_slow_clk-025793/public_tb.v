// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_025793 dut (
    .clk(clk),
    .load(in_vec[11:4]),
    .rstN(in_vec[3:3]),
    .up(in_vec[2:2]),
    .down(in_vec[1:1]),
    .plN(in_vec[0:0]),
    .LED(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'ha20;
    stim[1] = 12'hd73;
    stim[2] = 12'h96c;
    stim[3] = 12'h56d;
    stim[4] = 12'h2fd;
    stim[5] = 12'h8fe;
    stim[6] = 12'h5f9;
    stim[7] = 12'h4fc;
    stim[8] = 12'hcad;
    stim[9] = 12'h0da;
    stim[10] = 12'h2ee;
    stim[11] = 12'h99d;
    stim[12] = 12'h0cc;
    stim[13] = 12'h8c9;
    stim[14] = 12'h66c;
    stim[15] = 12'ha9f;
    stim[16] = 12'h3ca;
    stim[17] = 12'h7ba;
    stim[18] = 12'h818;
    stim[19] = 12'h168;
    stim[20] = 12'h35e;
    stim[21] = 12'h8fb;
    stim[22] = 12'h9ac;
    stim[23] = 12'h80e;
    stim[24] = 12'h70e;
    stim[25] = 12'haee;
    stim[26] = 12'h46f;
    stim[27] = 12'h20c;
    stim[28] = 12'h45d;
    stim[29] = 12'ha58;
    stim[30] = 12'h629;
    stim[31] = 12'h85e;
    stim[32] = 12'h67c;
    stim[33] = 12'hb4a;
    stim[34] = 12'h95b;
    stim[35] = 12'h288;
    stim[36] = 12'h9fd;
    stim[37] = 12'hd9a;
    stim[38] = 12'h40e;
    stim[39] = 12'h9da;
    stim[40] = 12'h28f;
    stim[41] = 12'h6db;
    stim[42] = 12'hefb;
    stim[43] = 12'ha38;
    stim[44] = 12'h87f;
    stim[45] = 12'h6e8;
    stim[46] = 12'h5fb;
    stim[47] = 12'h309;
    stim[48] = 12'he8f;
    stim[49] = 12'h51f;
    stim[50] = 12'h2db;
    stim[51] = 12'h68b;
    stim[52] = 12'h22f;
    stim[53] = 12'h519;
    stim[54] = 12'h608;
    stim[55] = 12'h9cc;
    stim[56] = 12'h95b;
    stim[57] = 12'h0fa;
    stim[58] = 12'h0cf;
    stim[59] = 12'ha6f;
    stim[60] = 12'h31f;
    stim[61] = 12'hab8;
    stim[62] = 12'h5cb;
    stim[63] = 12'hfbd;
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
      expv[0] = 16'ha200;
      expv[1] = 16'hd700;
      expv[2] = 16'h9600;
      expv[3] = 16'h5600;
      expv[4] = 16'h2f00;
      expv[5] = 16'h8f00;
      expv[6] = 16'h5f00;
      expv[7] = 16'h4f00;
      expv[8] = 16'hca00;
      expv[9] = 16'h0d00;
      expv[10] = 16'h2e00;
      expv[11] = 16'h9900;
      expv[12] = 16'h0c00;
      expv[13] = 16'h8c00;
      expv[14] = 16'h6600;
      expv[15] = 16'ha900;
      expv[16] = 16'h3c00;
      expv[17] = 16'h7b00;
      expv[18] = 16'h8100;
      expv[19] = 16'h1600;
      expv[20] = 16'h3500;
      expv[21] = 16'h8f00;
      expv[22] = 16'h9a00;
      expv[23] = 16'h8000;
      expv[24] = 16'h7000;
      expv[25] = 16'hae00;
      expv[26] = 16'h4600;
      expv[27] = 16'h2000;
      expv[28] = 16'h4500;
      expv[29] = 16'ha500;
      expv[30] = 16'h6200;
      expv[31] = 16'h8500;
      expv[32] = 16'h6700;
      expv[33] = 16'hb400;
      expv[34] = 16'h9500;
      expv[35] = 16'h2800;
      expv[36] = 16'h9f00;
      expv[37] = 16'hd900;
      expv[38] = 16'h4000;
      expv[39] = 16'h9d00;
      expv[40] = 16'h2800;
      expv[41] = 16'h6d00;
      expv[42] = 16'hef00;
      expv[43] = 16'ha300;
      expv[44] = 16'h8700;
      expv[45] = 16'h6e00;
      expv[46] = 16'h5f00;
      expv[47] = 16'h3000;
      expv[48] = 16'he800;
      expv[49] = 16'h5100;
      expv[50] = 16'h2d00;
      expv[51] = 16'h6800;
      expv[52] = 16'h2200;
      expv[53] = 16'h5100;
      expv[54] = 16'h6000;
      expv[55] = 16'h9c00;
      expv[56] = 16'h9500;
      expv[57] = 16'h0f00;
      expv[58] = 16'h0c00;
      expv[59] = 16'ha600;
      expv[60] = 16'h3100;
      expv[61] = 16'hab00;
      expv[62] = 16'h5c00;
      expv[63] = 16'hfb00;
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
