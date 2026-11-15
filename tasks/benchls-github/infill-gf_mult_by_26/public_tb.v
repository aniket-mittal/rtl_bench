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

  gf_mult_by_26 dut (
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
    stim[0] = 8'h93;
    stim[1] = 8'h19;
    stim[2] = 8'h14;
    stim[3] = 8'he3;
    stim[4] = 8'h57;
    stim[5] = 8'h3c;
    stim[6] = 8'he0;
    stim[7] = 8'h51;
    stim[8] = 8'h3c;
    stim[9] = 8'h44;
    stim[10] = 8'h21;
    stim[11] = 8'h53;
    stim[12] = 8'h4d;
    stim[13] = 8'hf7;
    stim[14] = 8'h04;
    stim[15] = 8'he9;
    stim[16] = 8'hb1;
    stim[17] = 8'he5;
    stim[18] = 8'h0d;
    stim[19] = 8'ha9;
    stim[20] = 8'hc6;
    stim[21] = 8'h6c;
    stim[22] = 8'h97;
    stim[23] = 8'h10;
    stim[24] = 8'hd7;
    stim[25] = 8'h36;
    stim[26] = 8'hfc;
    stim[27] = 8'hfd;
    stim[28] = 8'hcc;
    stim[29] = 8'ha5;
    stim[30] = 8'h87;
    stim[31] = 8'h15;
    stim[32] = 8'h41;
    stim[33] = 8'h4a;
    stim[34] = 8'hea;
    stim[35] = 8'h66;
    stim[36] = 8'hd4;
    stim[37] = 8'h2b;
    stim[38] = 8'h0e;
    stim[39] = 8'ha3;
    stim[40] = 8'h6a;
    stim[41] = 8'h30;
    stim[42] = 8'hc1;
    stim[43] = 8'h64;
    stim[44] = 8'hd8;
    stim[45] = 8'h14;
    stim[46] = 8'h44;
    stim[47] = 8'h6b;
    stim[48] = 8'hfa;
    stim[49] = 8'hd7;
    stim[50] = 8'h0b;
    stim[51] = 8'h78;
    stim[52] = 8'h6f;
    stim[53] = 8'h21;
    stim[54] = 8'hb7;
    stim[55] = 8'h5e;
    stim[56] = 8'h5f;
    stim[57] = 8'h02;
    stim[58] = 8'h93;
    stim[59] = 8'h36;
    stim[60] = 8'h41;
    stim[61] = 8'h7c;
    stim[62] = 8'heb;
    stim[63] = 8'h90;
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
      expv[0] = 8'hda;
      expv[1] = 8'h51;
      expv[2] = 8'hc2;
      expv[3] = 8'h41;
      expv[4] = 8'hdd;
      expv[5] = 8'h5b;
      expv[6] = 8'h2b;
      expv[7] = 8'h09;
      expv[8] = 8'h5b;
      expv[9] = 8'hed;
      expv[10] = 8'h92;
      expv[11] = 8'h45;
      expv[12] = 8'he6;
      expv[13] = 8'h83;
      expv[14] = 8'h98;
      expv[15] = 8'h20;
      expv[16] = 8'h22;
      expv[17] = 8'h95;
      expv[18] = 8'h93;
      expv[19] = 8'h55;
      expv[20] = 8'h4b;
      expv[21] = 8'h74;
      expv[22] = 8'h42;
      expv[23] = 8'h5a;
      expv[24] = 8'h37;
      expv[25] = 8'h3a;
      expv[26] = 8'hc4;
      expv[27] = 8'he2;
      expv[28] = 8'h2a;
      expv[29] = 8'he0;
      expv[30] = 8'h18;
      expv[31] = 8'he4;
      expv[32] = 8'h53;
      expv[33] = 8'h14;
      expv[34] = 8'h4a;
      expv[35] = 8'h15;
      expv[36] = 8'h5d;
      expv[37] = 8'hf3;
      expv[38] = 8'hf9;
      expv[39] = 8'h34;
      expv[40] = 8'ha0;
      expv[41] = 8'hee;
      expv[42] = 8'hb9;
      expv[43] = 8'h59;
      expv[44] = 8'he8;
      expv[45] = 8'hc2;
      expv[46] = 8'hed;
      expv[47] = 8'h86;
      expv[48] = 8'h10;
      expv[49] = 8'h37;
      expv[50] = 8'h47;
      expv[51] = 8'hb6;
      expv[52] = 8'h1e;
      expv[53] = 8'h92;
      expv[54] = 8'hf6;
      expv[55] = 8'hd6;
      expv[56] = 8'hf0;
      expv[57] = 8'h4c;
      expv[58] = 8'hda;
      expv[59] = 8'h3a;
      expv[60] = 8'h53;
      expv[61] = 8'h2e;
      expv[62] = 8'h6c;
      expv[63] = 8'hb0;
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
