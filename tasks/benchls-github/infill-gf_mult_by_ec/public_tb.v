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

  gf_mult_by_ec dut (
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
    stim[0] = 8'hb6;
    stim[1] = 8'h99;
    stim[2] = 8'hbb;
    stim[3] = 8'hc3;
    stim[4] = 8'hd4;
    stim[5] = 8'hdb;
    stim[6] = 8'hbc;
    stim[7] = 8'h41;
    stim[8] = 8'h64;
    stim[9] = 8'h21;
    stim[10] = 8'hdd;
    stim[11] = 8'h4c;
    stim[12] = 8'h86;
    stim[13] = 8'h49;
    stim[14] = 8'h06;
    stim[15] = 8'hc7;
    stim[16] = 8'he6;
    stim[17] = 8'h0f;
    stim[18] = 8'h9b;
    stim[19] = 8'hab;
    stim[20] = 8'h8f;
    stim[21] = 8'h51;
    stim[22] = 8'h6a;
    stim[23] = 8'hb4;
    stim[24] = 8'h73;
    stim[25] = 8'hbc;
    stim[26] = 8'h28;
    stim[27] = 8'he1;
    stim[28] = 8'h87;
    stim[29] = 8'ha9;
    stim[30] = 8'h85;
    stim[31] = 8'he1;
    stim[32] = 8'hb8;
    stim[33] = 8'h36;
    stim[34] = 8'h43;
    stim[35] = 8'hd5;
    stim[36] = 8'h45;
    stim[37] = 8'h1d;
    stim[38] = 8'h60;
    stim[39] = 8'hc4;
    stim[40] = 8'hcd;
    stim[41] = 8'h32;
    stim[42] = 8'h2b;
    stim[43] = 8'h50;
    stim[44] = 8'hc3;
    stim[45] = 8'hf4;
    stim[46] = 8'h99;
    stim[47] = 8'hcf;
    stim[48] = 8'hae;
    stim[49] = 8'hc8;
    stim[50] = 8'h56;
    stim[51] = 8'h5f;
    stim[52] = 8'hf4;
    stim[53] = 8'h9f;
    stim[54] = 8'h83;
    stim[55] = 8'h39;
    stim[56] = 8'hea;
    stim[57] = 8'h3e;
    stim[58] = 8'hed;
    stim[59] = 8'hc6;
    stim[60] = 8'h73;
    stim[61] = 8'h2e;
    stim[62] = 8'he3;
    stim[63] = 8'hf3;
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
      expv[0] = 8'hef;
      expv[1] = 8'hae;
      expv[2] = 8'ha7;
      expv[3] = 8'hbb;
      expv[4] = 8'h63;
      expv[5] = 8'hee;
      expv[6] = 8'h19;
      expv[7] = 8'h69;
      expv[8] = 8'hde;
      expv[9] = 8'h20;
      expv[10] = 8'hbc;
      expv[11] = 8'h21;
      expv[12] = 8'h45;
      expv[13] = 8'h5a;
      expv[14] = 8'h52;
      expv[15] = 8'h2c;
      expv[16] = 8'h0c;
      expv[17] = 8'h8d;
      expv[18] = 8'h6b;
      expv[19] = 8'hc1;
      expv[20] = 8'h9a;
      expv[21] = 8'h0f;
      expv[22] = 8'hbf;
      expv[23] = 8'h2a;
      expv[24] = 8'h06;
      expv[25] = 8'h19;
      expv[26] = 8'hff;
      expv[27] = 8'hb2;
      expv[28] = 8'ha9;
      expv[29] = 8'h04;
      expv[30] = 8'h6c;
      expv[31] = 8'hb2;
      expv[32] = 8'h8e;
      expv[33] = 8'hf8;
      expv[34] = 8'hac;
      expv[35] = 8'h8f;
      expv[36] = 8'hfe;
      expv[37] = 8'h2e;
      expv[38] = 8'h49;
      expv[39] = 8'h05;
      expv[40] = 8'hda;
      expv[41] = 8'h6f;
      expv[42] = 8'hd6;
      expv[43] = 8'he3;
      expv[44] = 8'hbb;
      expv[45] = 8'haf;
      expv[46] = 8'hae;
      expv[47] = 8'h1f;
      expv[48] = 8'hba;
      expv[49] = 8'ha1;
      expv[50] = 8'hb1;
      expv[51] = 8'h6e;
      expv[52] = 8'haf;
      expv[53] = 8'hfc;
      expv[54] = 8'h3e;
      expv[55] = 8'h75;
      expv[56] = 8'ha8;
      expv[57] = 8'hcb;
      expv[58] = 8'h16;
      expv[59] = 8'hc0;
      expv[60] = 8'h06;
      expv[61] = 8'had;
      expv[62] = 8'h77;
      expv[63] = 8'h11;
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
