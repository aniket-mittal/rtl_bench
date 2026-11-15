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

  gf_mult_by_d5 dut (
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
    stim[0] = 8'hfe;
    stim[1] = 8'h26;
    stim[2] = 8'h8d;
    stim[3] = 8'h82;
    stim[4] = 8'hbe;
    stim[5] = 8'hd6;
    stim[6] = 8'h97;
    stim[7] = 8'he3;
    stim[8] = 8'h84;
    stim[9] = 8'hf3;
    stim[10] = 8'h3c;
    stim[11] = 8'h51;
    stim[12] = 8'hdb;
    stim[13] = 8'h61;
    stim[14] = 8'h80;
    stim[15] = 8'h78;
    stim[16] = 8'h96;
    stim[17] = 8'h11;
    stim[18] = 8'h65;
    stim[19] = 8'h8f;
    stim[20] = 8'h6f;
    stim[21] = 8'h67;
    stim[22] = 8'h13;
    stim[23] = 8'he0;
    stim[24] = 8'h17;
    stim[25] = 8'hd7;
    stim[26] = 8'h15;
    stim[27] = 8'h35;
    stim[28] = 8'h6e;
    stim[29] = 8'hae;
    stim[30] = 8'hfa;
    stim[31] = 8'heb;
    stim[32] = 8'h27;
    stim[33] = 8'hd2;
    stim[34] = 8'h02;
    stim[35] = 8'hf9;
    stim[36] = 8'h00;
    stim[37] = 8'h2c;
    stim[38] = 8'h5f;
    stim[39] = 8'hee;
    stim[40] = 8'hfd;
    stim[41] = 8'hea;
    stim[42] = 8'h6e;
    stim[43] = 8'h6a;
    stim[44] = 8'h3c;
    stim[45] = 8'h24;
    stim[46] = 8'hd0;
    stim[47] = 8'h46;
    stim[48] = 8'h9f;
    stim[49] = 8'he5;
    stim[50] = 8'h33;
    stim[51] = 8'h96;
    stim[52] = 8'h4c;
    stim[53] = 8'h6b;
    stim[54] = 8'he5;
    stim[55] = 8'hcc;
    stim[56] = 8'h0e;
    stim[57] = 8'h38;
    stim[58] = 8'h7b;
    stim[59] = 8'hf3;
    stim[60] = 8'h05;
    stim[61] = 8'h38;
    stim[62] = 8'h46;
    stim[63] = 8'h24;
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
      expv[0] = 8'he9;
      expv[1] = 8'h7b;
      expv[2] = 8'h86;
      expv[3] = 8'h71;
      expv[4] = 8'h8a;
      expv[5] = 8'hb0;
      expv[6] = 8'h06;
      expv[7] = 8'h78;
      expv[8] = 8'hb5;
      expv[9] = 8'ha9;
      expv[10] = 8'hfb;
      expv[11] = 8'h67;
      expv[12] = 8'hf0;
      expv[13] = 8'h09;
      expv[14] = 8'hc6;
      expv[15] = 8'heb;
      expv[16] = 8'hd3;
      expv[17] = 8'h04;
      expv[18] = 8'h7a;
      expv[19] = 8'h31;
      expv[20] = 8'h2b;
      expv[21] = 8'hcd;
      expv[22] = 8'hb3;
      expv[23] = 8'h1a;
      expv[24] = 8'hc0;
      expv[25] = 8'h65;
      expv[26] = 8'h77;
      expv[27] = 8'hc8;
      expv[28] = 8'hfe;
      expv[29] = 8'h5b;
      expv[30] = 8'h9a;
      expv[31] = 8'h9e;
      expv[32] = 8'hae;
      expv[33] = 8'hc3;
      expv[34] = 8'hb7;
      expv[35] = 8'hf8;
      expv[36] = 8'h00;
      expv[37] = 8'h2a;
      expv[38] = 8'h45;
      expv[39] = 8'h38;
      expv[40] = 8'h8b;
      expv[41] = 8'h4b;
      expv[42] = 8'hfe;
      expv[43] = 8'h8d;
      expv[44] = 8'hfb;
      expv[45] = 8'hcc;
      expv[46] = 8'h74;
      expv[47] = 8'ha7;
      expv[48] = 8'he0;
      expv[49] = 8'hbc;
      expv[50] = 8'h0c;
      expv[51] = 8'hd3;
      expv[52] = 8'hf6;
      expv[53] = 8'h58;
      expv[54] = 8'hbc;
      expv[55] = 8'h30;
      expv[56] = 8'h22;
      expv[57] = 8'h88;
      expv[58] = 8'h89;
      expv[59] = 8'ha9;
      expv[60] = 8'ha6;
      expv[61] = 8'h88;
      expv[62] = 8'ha7;
      expv[63] = 8'hcc;
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
