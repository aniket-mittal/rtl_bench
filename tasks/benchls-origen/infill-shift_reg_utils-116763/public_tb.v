// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116763 dut (
    .clk(clk),
    .reset_n(in_vec[9:9]),
    .enable(in_vec[8:8]),
    .din(in_vec[7:0]),
    .dout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h05e;
    stim[1] = 10'h015;
    stim[2] = 10'h349;
    stim[3] = 10'h2e3;
    stim[4] = 10'h337;
    stim[5] = 10'h309;
    stim[6] = 10'h235;
    stim[7] = 10'h24c;
    stim[8] = 10'h3e0;
    stim[9] = 10'h257;
    stim[10] = 10'h2b8;
    stim[11] = 10'h2dd;
    stim[12] = 10'h371;
    stim[13] = 10'h378;
    stim[14] = 10'h310;
    stim[15] = 10'h246;
    stim[16] = 10'h246;
    stim[17] = 10'h202;
    stim[18] = 10'h35c;
    stim[19] = 10'h3ba;
    stim[20] = 10'h386;
    stim[21] = 10'h21d;
    stim[22] = 10'h221;
    stim[23] = 10'h3b2;
    stim[24] = 10'h293;
    stim[25] = 10'h335;
    stim[26] = 10'h252;
    stim[27] = 10'h373;
    stim[28] = 10'h372;
    stim[29] = 10'h3f6;
    stim[30] = 10'h3cf;
    stim[31] = 10'h3fd;
    stim[32] = 10'h2da;
    stim[33] = 10'h3a3;
    stim[34] = 10'h3eb;
    stim[35] = 10'h28f;
    stim[36] = 10'h3dd;
    stim[37] = 10'h2c6;
    stim[38] = 10'h22d;
    stim[39] = 10'h2e8;
    stim[40] = 10'h3e7;
    stim[41] = 10'h3f6;
    stim[42] = 10'h272;
    stim[43] = 10'h35a;
    stim[44] = 10'h2ac;
    stim[45] = 10'h3b4;
    stim[46] = 10'h2f5;
    stim[47] = 10'h226;
    stim[48] = 10'h2a0;
    stim[49] = 10'h0d1;
    stim[50] = 10'h2ff;
    stim[51] = 10'h250;
    stim[52] = 10'h364;
    stim[53] = 10'h2ea;
    stim[54] = 10'h33b;
    stim[55] = 10'h2e3;
    stim[56] = 10'h39d;
    stim[57] = 10'h27b;
    stim[58] = 10'h255;
    stim[59] = 10'h30d;
    stim[60] = 10'h383;
    stim[61] = 10'h3f2;
    stim[62] = 10'h364;
    stim[63] = 10'h272;
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
      expv[3] = 8'h49;
      expv[4] = 8'h49;
      expv[5] = 8'h37;
      expv[6] = 8'h09;
      expv[7] = 8'h09;
      expv[8] = 8'h09;
      expv[9] = 8'he0;
      expv[10] = 8'he0;
      expv[11] = 8'he0;
      expv[12] = 8'he0;
      expv[13] = 8'h71;
      expv[14] = 8'h78;
      expv[15] = 8'h10;
      expv[16] = 8'h10;
      expv[17] = 8'h10;
      expv[18] = 8'h10;
      expv[19] = 8'h5c;
      expv[20] = 8'hba;
      expv[21] = 8'h86;
      expv[22] = 8'h86;
      expv[23] = 8'h86;
      expv[24] = 8'hb2;
      expv[25] = 8'hb2;
      expv[26] = 8'h35;
      expv[27] = 8'h35;
      expv[28] = 8'h73;
      expv[29] = 8'h72;
      expv[30] = 8'hf6;
      expv[31] = 8'hcf;
      expv[32] = 8'hfd;
      expv[33] = 8'hfd;
      expv[34] = 8'ha3;
      expv[35] = 8'heb;
      expv[36] = 8'heb;
      expv[37] = 8'hdd;
      expv[38] = 8'hdd;
      expv[39] = 8'hdd;
      expv[40] = 8'hdd;
      expv[41] = 8'he7;
      expv[42] = 8'hf6;
      expv[43] = 8'hf6;
      expv[44] = 8'h5a;
      expv[45] = 8'h5a;
      expv[46] = 8'hb4;
      expv[47] = 8'hb4;
      expv[48] = 8'hb4;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h64;
      expv[54] = 8'h64;
      expv[55] = 8'h3b;
      expv[56] = 8'h3b;
      expv[57] = 8'h9d;
      expv[58] = 8'h9d;
      expv[59] = 8'h9d;
      expv[60] = 8'h0d;
      expv[61] = 8'h83;
      expv[62] = 8'hf2;
      expv[63] = 8'h64;
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
