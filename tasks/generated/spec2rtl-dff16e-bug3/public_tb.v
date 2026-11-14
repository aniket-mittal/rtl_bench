// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .resetn(in_vec[18:18]),
    .byteena(in_vec[17:16]),
    .d(in_vec[15:0]),
    .q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h26885;
    stim[1] = 19'h2ad40;
    stim[2] = 19'h5349e;
    stim[3] = 19'h73fb8;
    stim[4] = 19'h6ecd7;
    stim[5] = 19'h4e22a;
    stim[6] = 19'h5e3e2;
    stim[7] = 19'h79d81;
    stim[8] = 19'h52336;
    stim[9] = 19'h72379;
    stim[10] = 19'h6f9af;
    stim[11] = 19'h79237;
    stim[12] = 19'h58e42;
    stim[13] = 19'h4e00a;
    stim[14] = 19'h44900;
    stim[15] = 19'h7cf43;
    stim[16] = 19'h50a00;
    stim[17] = 19'h6bc7d;
    stim[18] = 19'h512aa;
    stim[19] = 19'h772ec;
    stim[20] = 19'h67593;
    stim[21] = 19'h6bfdd;
    stim[22] = 19'h46801;
    stim[23] = 19'h5c93f;
    stim[24] = 19'h552e1;
    stim[25] = 19'h4127b;
    stim[26] = 19'h55339;
    stim[27] = 19'h61719;
    stim[28] = 19'h62ab4;
    stim[29] = 19'h71dc9;
    stim[30] = 19'h69b71;
    stim[31] = 19'h7c16f;
    stim[32] = 19'h23c2c;
    stim[33] = 19'h4e973;
    stim[34] = 19'h73353;
    stim[35] = 19'h3400c;
    stim[36] = 19'h6da6e;
    stim[37] = 19'h652a6;
    stim[38] = 19'h5cf60;
    stim[39] = 19'h63a7d;
    stim[40] = 19'h5fad5;
    stim[41] = 19'h7a813;
    stim[42] = 19'h6649f;
    stim[43] = 19'h76f71;
    stim[44] = 19'h449cf;
    stim[45] = 19'h44134;
    stim[46] = 19'h739f8;
    stim[47] = 19'h60050;
    stim[48] = 19'h6c204;
    stim[49] = 19'h795b2;
    stim[50] = 19'h67888;
    stim[51] = 19'h7b9e6;
    stim[52] = 19'h6a17a;
    stim[53] = 19'h45d6f;
    stim[54] = 19'h7d4a7;
    stim[55] = 19'h664ca;
    stim[56] = 19'h6684b;
    stim[57] = 19'h79885;
    stim[58] = 19'h52600;
    stim[59] = 19'h6f32b;
    stim[60] = 19'h7fae1;
    stim[61] = 19'h68d97;
    stim[62] = 19'h258de;
    stim[63] = 19'h5baa4;
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
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h3f00;
      expv[5] = 16'hecd7;
      expv[6] = 16'hec2a;
      expv[7] = 16'hec2a;
      expv[8] = 16'h9d2a;
      expv[9] = 16'h9d2a;
      expv[10] = 16'h232a;
      expv[11] = 16'hf9af;
      expv[12] = 16'h92af;
      expv[13] = 16'h92af;
      expv[14] = 16'h920a;
      expv[15] = 16'h9200;
      expv[16] = 16'hcf00;
      expv[17] = 16'hcf00;
      expv[18] = 16'hbc7d;
      expv[19] = 16'hbc7d;
      expv[20] = 16'h727d;
      expv[21] = 16'h7593;
      expv[22] = 16'hbfdd;
      expv[23] = 16'hbf01;
      expv[24] = 16'hbf01;
      expv[25] = 16'hbf01;
      expv[26] = 16'hbf7b;
      expv[27] = 16'hbf7b;
      expv[28] = 16'h1719;
      expv[29] = 16'h2ab4;
      expv[30] = 16'h1db4;
      expv[31] = 16'h9b71;
      expv[32] = 16'hc171;
      expv[33] = 16'h0000;
      expv[34] = 16'h0073;
      expv[35] = 16'h3373;
      expv[36] = 16'h0000;
      expv[37] = 16'hda6e;
      expv[38] = 16'h52a6;
      expv[39] = 16'h52a6;
      expv[40] = 16'h3a7d;
      expv[41] = 16'h3a7d;
      expv[42] = 16'ha87d;
      expv[43] = 16'h649f;
      expv[44] = 16'h6f9f;
      expv[45] = 16'h6fcf;
      expv[46] = 16'h6f34;
      expv[47] = 16'h3934;
      expv[48] = 16'h0050;
      expv[49] = 16'hc204;
      expv[50] = 16'h9504;
      expv[51] = 16'h7888;
      expv[52] = 16'hb988;
      expv[53] = 16'ha17a;
      expv[54] = 16'ha16f;
      expv[55] = 16'hd46f;
      expv[56] = 16'h64ca;
      expv[57] = 16'h684b;
      expv[58] = 16'h984b;
      expv[59] = 16'h984b;
      expv[60] = 16'hf32b;
      expv[61] = 16'hfa2b;
      expv[62] = 16'h8d97;
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
