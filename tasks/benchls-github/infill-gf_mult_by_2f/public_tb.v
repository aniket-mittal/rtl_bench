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

  gf_mult_by_2f dut (
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
    stim[0] = 8'h20;
    stim[1] = 8'h48;
    stim[2] = 8'h98;
    stim[3] = 8'hc0;
    stim[4] = 8'h97;
    stim[5] = 8'h6b;
    stim[6] = 8'h35;
    stim[7] = 8'hf5;
    stim[8] = 8'h71;
    stim[9] = 8'h43;
    stim[10] = 8'h59;
    stim[11] = 8'h75;
    stim[12] = 8'h1b;
    stim[13] = 8'h81;
    stim[14] = 8'hd3;
    stim[15] = 8'hdc;
    stim[16] = 8'hfb;
    stim[17] = 8'h9c;
    stim[18] = 8'hf6;
    stim[19] = 8'ha9;
    stim[20] = 8'h51;
    stim[21] = 8'h6c;
    stim[22] = 8'h8d;
    stim[23] = 8'h88;
    stim[24] = 8'h66;
    stim[25] = 8'h46;
    stim[26] = 8'he6;
    stim[27] = 8'h55;
    stim[28] = 8'h0a;
    stim[29] = 8'hff;
    stim[30] = 8'h4d;
    stim[31] = 8'h12;
    stim[32] = 8'hc2;
    stim[33] = 8'h49;
    stim[34] = 8'h88;
    stim[35] = 8'h7c;
    stim[36] = 8'hab;
    stim[37] = 8'h32;
    stim[38] = 8'he7;
    stim[39] = 8'h3b;
    stim[40] = 8'hfb;
    stim[41] = 8'h3f;
    stim[42] = 8'h1e;
    stim[43] = 8'h24;
    stim[44] = 8'h9c;
    stim[45] = 8'hca;
    stim[46] = 8'h2c;
    stim[47] = 8'h42;
    stim[48] = 8'h31;
    stim[49] = 8'he1;
    stim[50] = 8'h53;
    stim[51] = 8'hcd;
    stim[52] = 8'hac;
    stim[53] = 8'h22;
    stim[54] = 8'h75;
    stim[55] = 8'h59;
    stim[56] = 8'haf;
    stim[57] = 8'h80;
    stim[58] = 8'h51;
    stim[59] = 8'h04;
    stim[60] = 8'hbe;
    stim[61] = 8'h53;
    stim[62] = 8'he6;
    stim[63] = 8'h50;
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
      expv[0] = 8'h89;
      expv[1] = 8'h6a;
      expv[2] = 8'hb1;
      expv[3] = 8'h11;
      expv[4] = 8'h19;
      expv[5] = 8'h92;
      expv[6] = 8'hd0;
      expv[7] = 8'hc1;
      expv[8] = 8'h63;
      expv[9] = 8'h7e;
      expv[10] = 8'h8f;
      expv[11] = 8'hdf;
      expv[12] = 8'hde;
      expv[13] = 8'h31;
      expv[14] = 8'haa;
      expv[15] = 8'h02;
      expv[16] = 8'h46;
      expv[17] = 8'h0d;
      expv[18] = 8'hb0;
      expv[19] = 8'hdd;
      expv[20] = 8'hea;
      expv[21] = 8'h5f;
      expv[22] = 8'he8;
      expv[23] = 8'h7b;
      expv[24] = 8'h64;
      expv[25] = 8'hed;
      expv[26] = 8'h7a;
      expv[27] = 8'h56;
      expv[28] = 8'h3b;
      expv[29] = 8'hfa;
      expv[30] = 8'hf9;
      expv[31] = 8'h94;
      expv[32] = 8'h4f;
      expv[33] = 8'h45;
      expv[34] = 8'h7b;
      expv[35] = 8'h95;
      expv[36] = 8'h83;
      expv[37] = 8'h1d;
      expv[38] = 8'h55;
      expv[39] = 8'h57;
      expv[40] = 8'h46;
      expv[41] = 8'heb;
      expv[42] = 8'h4d;
      expv[43] = 8'h35;
      expv[44] = 8'h0d;
      expv[45] = 8'h2a;
      expv[46] = 8'h50;
      expv[47] = 8'h51;
      expv[48] = 8'h6c;
      expv[49] = 8'hb7;
      expv[50] = 8'hb4;
      expv[51] = 8'he7;
      expv[52] = 8'h4e;
      expv[53] = 8'hd7;
      expv[54] = 8'hdf;
      expv[55] = 8'h8f;
      expv[56] = 8'h3f;
      expv[57] = 8'h1e;
      expv[58] = 8'hea;
      expv[59] = 8'hbc;
      expv[60] = 8'hda;
      expv[61] = 8'hb4;
      expv[62] = 8'h7a;
      expv[63] = 8'hc5;
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
