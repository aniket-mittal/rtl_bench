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

  gf_mult_by_9e dut (
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
    stim[0] = 8'h17;
    stim[1] = 8'hde;
    stim[2] = 8'h9d;
    stim[3] = 8'hb6;
    stim[4] = 8'h07;
    stim[5] = 8'h31;
    stim[6] = 8'hc9;
    stim[7] = 8'ha8;
    stim[8] = 8'heb;
    stim[9] = 8'h70;
    stim[10] = 8'h87;
    stim[11] = 8'h17;
    stim[12] = 8'hac;
    stim[13] = 8'h3b;
    stim[14] = 8'h80;
    stim[15] = 8'hbe;
    stim[16] = 8'h0f;
    stim[17] = 8'he9;
    stim[18] = 8'hf4;
    stim[19] = 8'h1a;
    stim[20] = 8'h53;
    stim[21] = 8'h39;
    stim[22] = 8'hfd;
    stim[23] = 8'h74;
    stim[24] = 8'hf0;
    stim[25] = 8'h1b;
    stim[26] = 8'h8b;
    stim[27] = 8'h68;
    stim[28] = 8'h8c;
    stim[29] = 8'h9d;
    stim[30] = 8'h40;
    stim[31] = 8'h99;
    stim[32] = 8'hbc;
    stim[33] = 8'h21;
    stim[34] = 8'hf8;
    stim[35] = 8'h55;
    stim[36] = 8'he5;
    stim[37] = 8'hcb;
    stim[38] = 8'h4d;
    stim[39] = 8'hc9;
    stim[40] = 8'h26;
    stim[41] = 8'hd6;
    stim[42] = 8'h35;
    stim[43] = 8'h88;
    stim[44] = 8'hb0;
    stim[45] = 8'he0;
    stim[46] = 8'hea;
    stim[47] = 8'h7b;
    stim[48] = 8'hca;
    stim[49] = 8'h4e;
    stim[50] = 8'h3a;
    stim[51] = 8'ha1;
    stim[52] = 8'h4a;
    stim[53] = 8'h38;
    stim[54] = 8'h70;
    stim[55] = 8'h60;
    stim[56] = 8'h25;
    stim[57] = 8'h49;
    stim[58] = 8'hc5;
    stim[59] = 8'hf1;
    stim[60] = 8'h54;
    stim[61] = 8'he4;
    stim[62] = 8'h36;
    stim[63] = 8'ha2;
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
      expv[0] = 8'he8;
      expv[1] = 8'h0e;
      expv[2] = 8'he5;
      expv[3] = 8'hf4;
      expv[4] = 8'hfd;
      expv[5] = 8'ha1;
      expv[6] = 8'he6;
      expv[7] = 8'h06;
      expv[8] = 8'hed;
      expv[9] = 8'h6b;
      expv[10] = 8'h55;
      expv[11] = 8'he8;
      expv[12] = 8'h44;
      expv[13] = 8'h04;
      expv[14] = 8'ha8;
      expv[15] = 8'h70;
      expv[16] = 8'h79;
      expv[17] = 8'hcc;
      expv[18] = 8'h81;
      expv[19] = 8'hb0;
      expv[20] = 8'hfe;
      expv[21] = 8'h25;
      expv[22] = 8'h9b;
      expv[23] = 8'h29;
      expv[24] = 8'hc3;
      expv[25] = 8'h2e;
      expv[26] = 8'h93;
      expv[27] = 8'hfa;
      expv[28] = 8'h6e;
      expv[29] = 8'he5;
      expv[30] = 8'h54;
      expv[31] = 8'ha7;
      expv[32] = 8'h51;
      expv[33] = 8'hb4;
      expv[34] = 8'h47;
      expv[35] = 8'h9d;
      expv[36] = 8'h0a;
      expv[37] = 8'hc7;
      expv[38] = 8'h0c;
      expv[39] = 8'he6;
      expv[40] = 8'h49;
      expv[41] = 8'h8a;
      expv[42] = 8'he3;
      expv[43] = 8'h2c;
      expv[44] = 8'h97;
      expv[45] = 8'hd6;
      expv[46] = 8'h73;
      expv[47] = 8'h50;
      expv[48] = 8'h59;
      expv[49] = 8'hb3;
      expv[50] = 8'h9a;
      expv[51] = 8'h1c;
      expv[52] = 8'hf1;
      expv[53] = 8'hbb;
      expv[54] = 8'h6b;
      expv[55] = 8'h7e;
      expv[56] = 8'hf6;
      expv[57] = 8'h4e;
      expv[58] = 8'h20;
      expv[59] = 8'h5d;
      expv[60] = 8'h03;
      expv[61] = 8'h94;
      expv[62] = 8'h5c;
      expv[63] = 8'ha3;
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
