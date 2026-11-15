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

  gf_mult_by_42 dut (
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
    stim[0] = 8'hfc;
    stim[1] = 8'hd5;
    stim[2] = 8'h8a;
    stim[3] = 8'h7d;
    stim[4] = 8'h66;
    stim[5] = 8'hc5;
    stim[6] = 8'h14;
    stim[7] = 8'h36;
    stim[8] = 8'h0b;
    stim[9] = 8'h5f;
    stim[10] = 8'ha8;
    stim[11] = 8'hce;
    stim[12] = 8'h31;
    stim[13] = 8'hf0;
    stim[14] = 8'hb8;
    stim[15] = 8'hdf;
    stim[16] = 8'h27;
    stim[17] = 8'h9d;
    stim[18] = 8'hf7;
    stim[19] = 8'h94;
    stim[20] = 8'h8f;
    stim[21] = 8'h7d;
    stim[22] = 8'h3a;
    stim[23] = 8'h64;
    stim[24] = 8'hc3;
    stim[25] = 8'h59;
    stim[26] = 8'ha2;
    stim[27] = 8'h9d;
    stim[28] = 8'hdc;
    stim[29] = 8'h66;
    stim[30] = 8'h7c;
    stim[31] = 8'hdd;
    stim[32] = 8'h9e;
    stim[33] = 8'h90;
    stim[34] = 8'hd7;
    stim[35] = 8'h96;
    stim[36] = 8'hcb;
    stim[37] = 8'h71;
    stim[38] = 8'hbb;
    stim[39] = 8'hbe;
    stim[40] = 8'h21;
    stim[41] = 8'h4b;
    stim[42] = 8'h64;
    stim[43] = 8'h99;
    stim[44] = 8'hcd;
    stim[45] = 8'h98;
    stim[46] = 8'hf1;
    stim[47] = 8'h36;
    stim[48] = 8'h79;
    stim[49] = 8'ha9;
    stim[50] = 8'h03;
    stim[51] = 8'hae;
    stim[52] = 8'hbd;
    stim[53] = 8'h2a;
    stim[54] = 8'hf3;
    stim[55] = 8'h1d;
    stim[56] = 8'h25;
    stim[57] = 8'h31;
    stim[58] = 8'h4b;
    stim[59] = 8'h6f;
    stim[60] = 8'h7d;
    stim[61] = 8'h59;
    stim[62] = 8'hd7;
    stim[63] = 8'hee;
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
      expv[0] = 8'h14;
      expv[1] = 8'hd4;
      expv[2] = 8'h34;
      expv[3] = 8'hcc;
      expv[4] = 8'h74;
      expv[5] = 8'h80;
      expv[6] = 8'h41;
      expv[7] = 8'h6d;
      expv[8] = 8'hec;
      expv[9] = 8'he0;
      expv[10] = 8'h18;
      expv[11] = 8'h6c;
      expv[12] = 8'hbe;
      expv[13] = 8'h2b;
      expv[14] = 8'h4c;
      expv[15] = 8'h7a;
      expv[16] = 8'h7b;
      expv[17] = 8'hb3;
      expv[18] = 8'hf8;
      expv[19] = 8'hdb;
      expv[20] = 8'h63;
      expv[21] = 8'hcc;
      expv[22] = 8'h52;
      expv[23] = 8'hf0;
      expv[24] = 8'h11;
      expv[25] = 8'h71;
      expv[26] = 8'hb6;
      expv[27] = 8'hb3;
      expv[28] = 8'hbc;
      expv[29] = 8'h74;
      expv[30] = 8'h8e;
      expv[31] = 8'hfe;
      expv[32] = 8'h75;
      expv[33] = 8'hce;
      expv[34] = 8'h50;
      expv[35] = 8'h5f;
      expv[36] = 8'h3b;
      expv[37] = 8'hf3;
      expv[38] = 8'h8a;
      expv[39] = 8'hdd;
      expv[40] = 8'hea;
      expv[41] = 8'ha1;
      expv[42] = 8'hf0;
      expv[43] = 8'ha6;
      expv[44] = 8'haa;
      expv[45] = 8'he4;
      expv[46] = 8'h69;
      expv[47] = 8'h6d;
      expv[48] = 8'hd9;
      expv[49] = 8'h5a;
      expv[50] = 8'hc6;
      expv[51] = 8'h89;
      expv[52] = 8'h1b;
      expv[53] = 8'h06;
      expv[54] = 8'hed;
      expv[55] = 8'h29;
      expv[56] = 8'hff;
      expv[57] = 8'hbe;
      expv[58] = 8'ha1;
      expv[59] = 8'h1c;
      expv[60] = 8'hcc;
      expv[61] = 8'h71;
      expv[62] = 8'h50;
      expv[63] = 8'hc4;
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
