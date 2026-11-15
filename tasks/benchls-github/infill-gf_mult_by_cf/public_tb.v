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

  gf_mult_by_cf dut (
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
    stim[0] = 8'h44;
    stim[1] = 8'hff;
    stim[2] = 8'he7;
    stim[3] = 8'hc4;
    stim[4] = 8'hff;
    stim[5] = 8'h2c;
    stim[6] = 8'h97;
    stim[7] = 8'he0;
    stim[8] = 8'h29;
    stim[9] = 8'h6c;
    stim[10] = 8'ha1;
    stim[11] = 8'ha0;
    stim[12] = 8'hba;
    stim[13] = 8'h9d;
    stim[14] = 8'hef;
    stim[15] = 8'hc5;
    stim[16] = 8'h42;
    stim[17] = 8'h3b;
    stim[18] = 8'hb2;
    stim[19] = 8'hdf;
    stim[20] = 8'h8b;
    stim[21] = 8'he3;
    stim[22] = 8'h19;
    stim[23] = 8'h70;
    stim[24] = 8'h9e;
    stim[25] = 8'h5a;
    stim[26] = 8'hb5;
    stim[27] = 8'heb;
    stim[28] = 8'h0e;
    stim[29] = 8'hf3;
    stim[30] = 8'hfe;
    stim[31] = 8'h08;
    stim[32] = 8'hfb;
    stim[33] = 8'hfd;
    stim[34] = 8'h9a;
    stim[35] = 8'h6d;
    stim[36] = 8'h53;
    stim[37] = 8'h88;
    stim[38] = 8'h91;
    stim[39] = 8'h54;
    stim[40] = 8'hcf;
    stim[41] = 8'h80;
    stim[42] = 8'h5e;
    stim[43] = 8'hb0;
    stim[44] = 8'h24;
    stim[45] = 8'hbe;
    stim[46] = 8'h3e;
    stim[47] = 8'h57;
    stim[48] = 8'hba;
    stim[49] = 8'hf2;
    stim[50] = 8'hf8;
    stim[51] = 8'hce;
    stim[52] = 8'hea;
    stim[53] = 8'h6b;
    stim[54] = 8'h42;
    stim[55] = 8'h29;
    stim[56] = 8'h53;
    stim[57] = 8'hcc;
    stim[58] = 8'hfa;
    stim[59] = 8'ha4;
    stim[60] = 8'hb1;
    stim[61] = 8'he6;
    stim[62] = 8'hea;
    stim[63] = 8'hc9;
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
      expv[0] = 8'hb6;
      expv[1] = 8'h3f;
      expv[2] = 8'h65;
      expv[3] = 8'hf1;
      expv[4] = 8'h3f;
      expv[5] = 8'hf5;
      expv[6] = 8'h7c;
      expv[7] = 8'h32;
      expv[8] = 8'h21;
      expv[9] = 8'h58;
      expv[10] = 8'h50;
      expv[11] = 8'h9f;
      expv[12] = 8'h46;
      expv[13] = 8'hc9;
      expv[14] = 8'h53;
      expv[15] = 8'h3e;
      expv[16] = 8'h2e;
      expv[17] = 8'hce;
      expv[18] = 8'h70;
      expv[19] = 8'he7;
      expv[20] = 8'h3d;
      expv[21] = 8'h7e;
      expv[22] = 8'h95;
      expv[23] = 8'h19;
      expv[24] = 8'h85;
      expv[25] = 8'h74;
      expv[26] = 8'h27;
      expv[27] = 8'h48;
      expv[28] = 8'hae;
      expv[29] = 8'h12;
      expv[30] = 8'hf0;
      expv[31] = 8'h36;
      expv[32] = 8'h24;
      expv[33] = 8'hbc;
      expv[34] = 8'h9e;
      expv[35] = 8'h97;
      expv[36] = 8'h8d;
      expv[37] = 8'h71;
      expv[38] = 8'he4;
      expv[39] = 8'hda;
      expv[40] = 8'h8b;
      expv[41] = 8'h47;
      expv[42] = 8'h6f;
      expv[43] = 8'hf3;
      expv[44] = 8'hc3;
      expv[45] = 8'h5d;
      expv[46] = 8'h1a;
      expv[47] = 8'h96;
      expv[48] = 8'h46;
      expv[49] = 8'hdd;
      expv[50] = 8'h68;
      expv[51] = 8'h44;
      expv[52] = 8'h87;
      expv[53] = 8'h0f;
      expv[54] = 8'h2e;
      expv[55] = 8'h21;
      expv[56] = 8'h8d;
      expv[57] = 8'hc7;
      expv[58] = 8'heb;
      expv[59] = 8'h84;
      expv[60] = 8'h3c;
      expv[61] = 8'haa;
      expv[62] = 8'h87;
      expv[63] = 8'h13;
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
