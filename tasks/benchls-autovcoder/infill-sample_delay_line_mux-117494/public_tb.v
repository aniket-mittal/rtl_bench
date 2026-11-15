// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_117494 dut (
    .clk(clk),
    .reset(in_vec[11:11]),
    .sel(in_vec[10:9]),
    .newt(in_vec[8:8]),
    .d(in_vec[7:0]),
    .x(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h9ca;
    stim[1] = 12'hd1a;
    stim[2] = 12'h2af;
    stim[3] = 12'h3db;
    stim[4] = 12'h5ec;
    stim[5] = 12'h30c;
    stim[6] = 12'h226;
    stim[7] = 12'h333;
    stim[8] = 12'h112;
    stim[9] = 12'h217;
    stim[10] = 12'h5a8;
    stim[11] = 12'h7fa;
    stim[12] = 12'h745;
    stim[13] = 12'h0b1;
    stim[14] = 12'h8c2;
    stim[15] = 12'h194;
    stim[16] = 12'h459;
    stim[17] = 12'h0b9;
    stim[18] = 12'h012;
    stim[19] = 12'h527;
    stim[20] = 12'h2b2;
    stim[21] = 12'h119;
    stim[22] = 12'h045;
    stim[23] = 12'h6ee;
    stim[24] = 12'h221;
    stim[25] = 12'h0b6;
    stim[26] = 12'h151;
    stim[27] = 12'h94d;
    stim[28] = 12'h024;
    stim[29] = 12'h716;
    stim[30] = 12'h284;
    stim[31] = 12'h69b;
    stim[32] = 12'h4fa;
    stim[33] = 12'h400;
    stim[34] = 12'h55b;
    stim[35] = 12'h398;
    stim[36] = 12'h69e;
    stim[37] = 12'h1d5;
    stim[38] = 12'h633;
    stim[39] = 12'h6f0;
    stim[40] = 12'h5b6;
    stim[41] = 12'h5d0;
    stim[42] = 12'h6f2;
    stim[43] = 12'h585;
    stim[44] = 12'hcaa;
    stim[45] = 12'h6bd;
    stim[46] = 12'h24f;
    stim[47] = 12'h0d4;
    stim[48] = 12'h61d;
    stim[49] = 12'h4e6;
    stim[50] = 12'h574;
    stim[51] = 12'h3f4;
    stim[52] = 12'h3d8;
    stim[53] = 12'h238;
    stim[54] = 12'h168;
    stim[55] = 12'h008;
    stim[56] = 12'h43f;
    stim[57] = 12'h539;
    stim[58] = 12'h3ee;
    stim[59] = 12'h16b;
    stim[60] = 12'h2e9;
    stim[61] = 12'h2e1;
    stim[62] = 12'h14d;
    stim[63] = 12'h3b0;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'hdb;
      expv[6] = 8'hec;
      expv[7] = 8'hec;
      expv[8] = 8'h33;
      expv[9] = 8'h33;
      expv[10] = 8'h0c;
      expv[11] = 8'h0c;
      expv[12] = 8'h33;
      expv[13] = 8'h45;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h94;
      expv[18] = 8'h94;
      expv[19] = 8'h00;
      expv[20] = 8'h94;
      expv[21] = 8'h27;
      expv[22] = 8'h19;
      expv[23] = 8'h00;
      expv[24] = 8'h27;
      expv[25] = 8'h19;
      expv[26] = 8'h19;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h16;
      expv[36] = 8'h00;
      expv[37] = 8'h98;
      expv[38] = 8'h16;
      expv[39] = 8'h16;
      expv[40] = 8'h5b;
      expv[41] = 8'h98;
      expv[42] = 8'h98;
      expv[43] = 8'hd5;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h74;
      expv[53] = 8'hf4;
      expv[54] = 8'hd8;
      expv[55] = 8'h68;
      expv[56] = 8'hf4;
      expv[57] = 8'hf4;
      expv[58] = 8'h68;
      expv[59] = 8'hee;
      expv[60] = 8'hee;
      expv[61] = 8'hee;
      expv[62] = 8'h6b;
      expv[63] = 8'h6b;
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
