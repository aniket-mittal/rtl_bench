// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00581 dut (
    .clk(clk),
    .enable(in_vec[7:7]),
    .val(in_vec[6:3]),
    .sidx(in_vec[2:0]),
    .digit(out_vec[15:8]),
    .segment(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h16;
    stim[1] = 8'h85;
    stim[2] = 8'hb2;
    stim[3] = 8'h19;
    stim[4] = 8'h8e;
    stim[5] = 8'hc3;
    stim[6] = 8'hfa;
    stim[7] = 8'hd9;
    stim[8] = 8'h93;
    stim[9] = 8'hde;
    stim[10] = 8'h88;
    stim[11] = 8'h3b;
    stim[12] = 8'hbc;
    stim[13] = 8'he7;
    stim[14] = 8'h72;
    stim[15] = 8'h39;
    stim[16] = 8'hd9;
    stim[17] = 8'h0d;
    stim[18] = 8'h42;
    stim[19] = 8'h4e;
    stim[20] = 8'h9e;
    stim[21] = 8'h7e;
    stim[22] = 8'h48;
    stim[23] = 8'h44;
    stim[24] = 8'h7e;
    stim[25] = 8'h56;
    stim[26] = 8'h9c;
    stim[27] = 8'hdd;
    stim[28] = 8'h9a;
    stim[29] = 8'h3e;
    stim[30] = 8'h05;
    stim[31] = 8'h65;
    stim[32] = 8'h91;
    stim[33] = 8'h5d;
    stim[34] = 8'h2e;
    stim[35] = 8'h9e;
    stim[36] = 8'hba;
    stim[37] = 8'h43;
    stim[38] = 8'hf3;
    stim[39] = 8'h5a;
    stim[40] = 8'h3e;
    stim[41] = 8'h71;
    stim[42] = 8'h33;
    stim[43] = 8'haf;
    stim[44] = 8'h1d;
    stim[45] = 8'h71;
    stim[46] = 8'hdd;
    stim[47] = 8'h77;
    stim[48] = 8'hb3;
    stim[49] = 8'h56;
    stim[50] = 8'h53;
    stim[51] = 8'h7e;
    stim[52] = 8'h78;
    stim[53] = 8'h57;
    stim[54] = 8'hed;
    stim[55] = 8'h1e;
    stim[56] = 8'hde;
    stim[57] = 8'hf8;
    stim[58] = 8'hea;
    stim[59] = 8'h4a;
    stim[60] = 8'h75;
    stim[61] = 8'hc6;
    stim[62] = 8'h40;
    stim[63] = 8'h3f;
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
      expv[2] = 16'hdf03;
      expv[3] = 16'hfb41;
      expv[4] = 16'hfb41;
      expv[5] = 16'hbf9f;
      expv[6] = 16'hf701;
      expv[7] = 16'hfbff;
      expv[8] = 16'hfdff;
      expv[9] = 16'hf725;
      expv[10] = 16'hbfff;
      expv[11] = 16'hfe9f;
      expv[12] = 16'hfe9f;
      expv[13] = 16'hef1f;
      expv[14] = 16'h7fff;
      expv[15] = 16'h7fff;
      expv[16] = 16'h7fff;
      expv[17] = 16'hfdff;
      expv[18] = 16'hfdff;
      expv[19] = 16'hfdff;
      expv[20] = 16'hfdff;
      expv[21] = 16'hbf0d;
      expv[22] = 16'hbf0d;
      expv[23] = 16'hbf0d;
      expv[24] = 16'hbf0d;
      expv[25] = 16'hbf0d;
      expv[26] = 16'hbf0d;
      expv[27] = 16'hef0d;
      expv[28] = 16'hdfff;
      expv[29] = 16'hfb0d;
      expv[30] = 16'hfb0d;
      expv[31] = 16'hfb0d;
      expv[32] = 16'hfb0d;
      expv[33] = 16'hfd25;
      expv[34] = 16'hfd25;
      expv[35] = 16'hfd25;
      expv[36] = 16'hbf0d;
      expv[37] = 16'hfb1f;
      expv[38] = 16'hfb1f;
      expv[39] = 16'hf7ff;
      expv[40] = 16'hf7ff;
      expv[41] = 16'hf7ff;
      expv[42] = 16'hf7ff;
      expv[43] = 16'hf7ff;
      expv[44] = 16'h7f49;
      expv[45] = 16'h7f49;
      expv[46] = 16'h7f49;
      expv[47] = 16'hdfff;
      expv[48] = 16'hdfff;
      expv[49] = 16'hf741;
      expv[50] = 16'hf741;
      expv[51] = 16'hf741;
      expv[52] = 16'hf741;
      expv[53] = 16'hf741;
      expv[54] = 16'hf741;
      expv[55] = 16'hdfff;
      expv[56] = 16'hdfff;
      expv[57] = 16'hbfff;
      expv[58] = 16'hfeff;
      expv[59] = 16'hfbff;
      expv[60] = 16'hfbff;
      expv[61] = 16'hfbff;
      expv[62] = 16'hbf01;
      expv[63] = 16'hbf01;
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
