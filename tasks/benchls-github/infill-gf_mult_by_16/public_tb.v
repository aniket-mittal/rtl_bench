// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gf_mult_by_16 dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h8a;
    stim[1] = 8'h67;
    stim[2] = 8'h79;
    stim[3] = 8'h2f;
    stim[4] = 8'h28;
    stim[5] = 8'hc2;
    stim[6] = 8'h1b;
    stim[7] = 8'hdf;
    stim[8] = 8'he0;
    stim[9] = 8'h2c;
    stim[10] = 8'hc3;
    stim[11] = 8'h17;
    stim[12] = 8'h5c;
    stim[13] = 8'hb5;
    stim[14] = 8'ha8;
    stim[15] = 8'hdc;
    stim[16] = 8'hc0;
    stim[17] = 8'he0;
    stim[18] = 8'h0f;
    stim[19] = 8'hf0;
    stim[20] = 8'hd9;
    stim[21] = 8'h2c;
    stim[22] = 8'h5e;
    stim[23] = 8'hd7;
    stim[24] = 8'h7e;
    stim[25] = 8'hd7;
    stim[26] = 8'h07;
    stim[27] = 8'hed;
    stim[28] = 8'h09;
    stim[29] = 8'h64;
    stim[30] = 8'h68;
    stim[31] = 8'hd8;
    stim[32] = 8'h58;
    stim[33] = 8'hb4;
    stim[34] = 8'h17;
    stim[35] = 8'hed;
    stim[36] = 8'h04;
    stim[37] = 8'h19;
    stim[38] = 8'hfc;
    stim[39] = 8'haa;
    stim[40] = 8'hf1;
    stim[41] = 8'hc2;
    stim[42] = 8'h10;
    stim[43] = 8'h03;
    stim[44] = 8'h60;
    stim[45] = 8'h7b;
    stim[46] = 8'hee;
    stim[47] = 8'h58;
    stim[48] = 8'h52;
    stim[49] = 8'hb5;
    stim[50] = 8'h96;
    stim[51] = 8'h3c;
    stim[52] = 8'he6;
    stim[53] = 8'h5b;
    stim[54] = 8'h7e;
    stim[55] = 8'h95;
    stim[56] = 8'ha1;
    stim[57] = 8'h1e;
    stim[58] = 8'ha9;
    stim[59] = 8'h7b;
    stim[60] = 8'he2;
    stim[61] = 8'hc0;
    stim[62] = 8'h99;
    stim[63] = 8'h7d;
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
      expv[0] = 8'h53;
      expv[1] = 8'h71;
      expv[2] = 8'hc8;
      expv[3] = 8'h28;
      expv[4] = 8'h4a;
      expv[5] = 8'h0a;
      expv[6] = 8'hf7;
      expv[7] = 8'h89;
      expv[8] = 8'hdc;
      expv[9] = 8'h12;
      expv[10] = 8'h1c;
      expv[11] = 8'h1f;
      expv[12] = 8'h7c;
      expv[13] = 8'h06;
      expv[14] = 8'h85;
      expv[15] = 8'hb3;
      expv[16] = 8'h26;
      expv[17] = 8'hdc;
      expv[18] = 8'hd2;
      expv[19] = 8'ha1;
      expv[20] = 8'hfd;
      expv[21] = 8'h12;
      expv[22] = 8'h50;
      expv[23] = 8'h39;
      expv[24] = 8'haa;
      expv[25] = 8'h39;
      expv[26] = 8'h62;
      expv[27] = 8'h22;
      expv[28] = 8'ha6;
      expv[29] = 8'h4b;
      expv[30] = 8'ha3;
      expv[31] = 8'heb;
      expv[32] = 8'h24;
      expv[33] = 8'h10;
      expv[34] = 8'h1f;
      expv[35] = 8'h22;
      expv[36] = 8'h58;
      expv[37] = 8'hdb;
      expv[38] = 8'h49;
      expv[39] = 8'ha9;
      expv[40] = 8'hb7;
      expv[41] = 8'h0a;
      expv[42] = 8'h7d;
      expv[43] = 8'h3a;
      expv[44] = 8'h13;
      expv[45] = 8'he4;
      expv[46] = 8'h18;
      expv[47] = 8'h24;
      expv[48] = 8'hb8;
      expv[49] = 8'h06;
      expv[50] = 8'hc6;
      expv[51] = 8'h6f;
      expv[52] = 8'ha8;
      expv[53] = 8'h1e;
      expv[54] = 8'haa;
      expv[55] = 8'hfc;
      expv[56] = 8'h23;
      expv[57] = 8'hb9;
      expv[58] = 8'h93;
      expv[59] = 8'he4;
      expv[60] = 8'hf0;
      expv[61] = 8'h26;
      expv[62] = 8'h14;
      expv[63] = 8'h90;
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
