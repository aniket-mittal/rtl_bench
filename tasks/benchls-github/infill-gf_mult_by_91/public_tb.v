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

  gf_mult_by_91 dut (
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
    stim[0] = 8'h0e;
    stim[1] = 8'h5a;
    stim[2] = 8'h55;
    stim[3] = 8'hf7;
    stim[4] = 8'h8a;
    stim[5] = 8'h11;
    stim[6] = 8'h9b;
    stim[7] = 8'hdd;
    stim[8] = 8'h42;
    stim[9] = 8'h5d;
    stim[10] = 8'h54;
    stim[11] = 8'hfc;
    stim[12] = 8'hae;
    stim[13] = 8'hc1;
    stim[14] = 8'h4c;
    stim[15] = 8'h80;
    stim[16] = 8'h32;
    stim[17] = 8'h4c;
    stim[18] = 8'h1c;
    stim[19] = 8'h9b;
    stim[20] = 8'hcc;
    stim[21] = 8'h6f;
    stim[22] = 8'h17;
    stim[23] = 8'hfe;
    stim[24] = 8'h0d;
    stim[25] = 8'h43;
    stim[26] = 8'h91;
    stim[27] = 8'h34;
    stim[28] = 8'h2f;
    stim[29] = 8'h56;
    stim[30] = 8'h24;
    stim[31] = 8'h4c;
    stim[32] = 8'h8b;
    stim[33] = 8'hb1;
    stim[34] = 8'hda;
    stim[35] = 8'h1c;
    stim[36] = 8'hae;
    stim[37] = 8'hab;
    stim[38] = 8'h4a;
    stim[39] = 8'he5;
    stim[40] = 8'h6c;
    stim[41] = 8'hc1;
    stim[42] = 8'heb;
    stim[43] = 8'h5e;
    stim[44] = 8'h2c;
    stim[45] = 8'hfa;
    stim[46] = 8'h45;
    stim[47] = 8'he6;
    stim[48] = 8'hd0;
    stim[49] = 8'h2c;
    stim[50] = 8'h2f;
    stim[51] = 8'hf6;
    stim[52] = 8'hea;
    stim[53] = 8'hf6;
    stim[54] = 8'h0a;
    stim[55] = 8'h82;
    stim[56] = 8'h3d;
    stim[57] = 8'hab;
    stim[58] = 8'h3e;
    stim[59] = 8'h58;
    stim[60] = 8'h97;
    stim[61] = 8'hf2;
    stim[62] = 8'h75;
    stim[63] = 8'hfd;
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
      expv[0] = 8'hbd;
      expv[1] = 8'h95;
      expv[2] = 8'hb9;
      expv[3] = 8'h2a;
      expv[4] = 8'hb8;
      expv[5] = 8'h74;
      expv[6] = 8'hcc;
      expv[7] = 8'h3e;
      expv[8] = 8'h8c;
      expv[9] = 8'h45;
      expv[10] = 8'h28;
      expv[11] = 8'h78;
      expv[12] = 8'h11;
      expv[13] = 8'h59;
      expv[14] = 8'h31;
      expv[15] = 8'h7b;
      expv[16] = 8'h0d;
      expv[17] = 8'h31;
      expv[18] = 8'h67;
      expv[19] = 8'hcc;
      expv[20] = 8'h4a;
      expv[21] = 8'h48;
      expv[22] = 8'h35;
      expv[23] = 8'h47;
      expv[24] = 8'h13;
      expv[25] = 8'h1d;
      expv[26] = 8'h0f;
      expv[27] = 8'h4c;
      expv[28] = 8'hfb;
      expv[29] = 8'h17;
      expv[30] = 8'ha9;
      expv[31] = 8'h31;
      expv[32] = 8'h29;
      expv[33] = 8'hd8;
      expv[34] = 8'hee;
      expv[35] = 8'h67;
      expv[36] = 8'h11;
      expv[37] = 8'hfe;
      expv[38] = 8'h70;
      expv[39] = 8'hf0;
      expv[40] = 8'he6;
      expv[41] = 8'h59;
      expv[42] = 8'h4d;
      expv[43] = 8'heb;
      expv[44] = 8'h55;
      expv[45] = 8'h39;
      expv[46] = 8'h5c;
      expv[47] = 8'h5e;
      expv[48] = 8'h2d;
      expv[49] = 8'h55;
      expv[50] = 8'hfb;
      expv[51] = 8'hbb;
      expv[52] = 8'hdc;
      expv[53] = 8'hbb;
      expv[54] = 8'hc3;
      expv[55] = 8'h44;
      expv[56] = 8'h21;
      expv[57] = 8'hfe;
      expv[58] = 8'h8f;
      expv[59] = 8'haa;
      expv[60] = 8'h4e;
      expv[61] = 8'hc5;
      expv[62] = 8'h6e;
      expv[63] = 8'he9;
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
