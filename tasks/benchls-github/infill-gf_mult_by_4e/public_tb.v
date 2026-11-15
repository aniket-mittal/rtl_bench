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

  gf_mult_by_4e dut (
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
    stim[0] = 8'he6;
    stim[1] = 8'hbc;
    stim[2] = 8'h6e;
    stim[3] = 8'hd9;
    stim[4] = 8'h4a;
    stim[5] = 8'h5a;
    stim[6] = 8'h03;
    stim[7] = 8'h2b;
    stim[8] = 8'h57;
    stim[9] = 8'h00;
    stim[10] = 8'h16;
    stim[11] = 8'h26;
    stim[12] = 8'h0a;
    stim[13] = 8'h26;
    stim[14] = 8'h21;
    stim[15] = 8'he7;
    stim[16] = 8'h07;
    stim[17] = 8'h8a;
    stim[18] = 8'he3;
    stim[19] = 8'h1f;
    stim[20] = 8'h15;
    stim[21] = 8'hfe;
    stim[22] = 8'ha6;
    stim[23] = 8'h9a;
    stim[24] = 8'h85;
    stim[25] = 8'hfc;
    stim[26] = 8'hd9;
    stim[27] = 8'hed;
    stim[28] = 8'h5b;
    stim[29] = 8'he3;
    stim[30] = 8'hdc;
    stim[31] = 8'h9a;
    stim[32] = 8'ha8;
    stim[33] = 8'ha1;
    stim[34] = 8'h2a;
    stim[35] = 8'h5a;
    stim[36] = 8'h4c;
    stim[37] = 8'hc4;
    stim[38] = 8'ha9;
    stim[39] = 8'h84;
    stim[40] = 8'hc1;
    stim[41] = 8'h07;
    stim[42] = 8'h3d;
    stim[43] = 8'h79;
    stim[44] = 8'h16;
    stim[45] = 8'hec;
    stim[46] = 8'h33;
    stim[47] = 8'hf3;
    stim[48] = 8'hcf;
    stim[49] = 8'hf5;
    stim[50] = 8'h1a;
    stim[51] = 8'h79;
    stim[52] = 8'h59;
    stim[53] = 8'h69;
    stim[54] = 8'h08;
    stim[55] = 8'h84;
    stim[56] = 8'h85;
    stim[57] = 8'hfe;
    stim[58] = 8'h76;
    stim[59] = 8'hd2;
    stim[60] = 8'he2;
    stim[61] = 8'h41;
    stim[62] = 8'h4d;
    stim[63] = 8'he7;
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
      expv[0] = 8'h32;
      expv[1] = 8'h1a;
      expv[2] = 8'hac;
      expv[3] = 8'h2e;
      expv[4] = 8'hbc;
      expv[5] = 8'h28;
      expv[6] = 8'hd2;
      expv[7] = 8'had;
      expv[8] = 8'h09;
      expv[9] = 8'h00;
      expv[10] = 8'h2d;
      expv[11] = 8'h8c;
      expv[12] = 8'hd6;
      expv[13] = 8'h8c;
      expv[14] = 8'h7b;
      expv[15] = 8'h7c;
      expv[16] = 8'hf7;
      expv[17] = 8'h02;
      expv[18] = 8'h59;
      expv[19] = 8'h29;
      expv[20] = 8'hff;
      expv[21] = 8'hec;
      expv[22] = 8'h58;
      expv[23] = 8'h96;
      expv[24] = 8'hbf;
      expv[25] = 8'h70;
      expv[26] = 8'h2e;
      expv[27] = 8'haa;
      expv[28] = 8'h66;
      expv[29] = 8'h59;
      expv[30] = 8'h45;
      expv[31] = 8'h96;
      expv[32] = 8'hab;
      expv[33] = 8'haf;
      expv[34] = 8'he3;
      expv[35] = 8'h28;
      expv[36] = 8'h05;
      expv[37] = 8'h9b;
      expv[38] = 8'he5;
      expv[39] = 8'hf1;
      expv[40] = 8'hf0;
      expv[41] = 8'hf7;
      expv[42] = 8'h80;
      expv[43] = 8'hcf;
      expv[44] = 8'h2d;
      expv[45] = 8'he4;
      expv[46] = 8'h73;
      expv[47] = 8'hcd;
      expv[48] = 8'h03;
      expv[49] = 8'h74;
      expv[50] = 8'h42;
      expv[51] = 8'hcf;
      expv[52] = 8'hfa;
      expv[53] = 8'h5b;
      expv[54] = 8'h4a;
      expv[55] = 8'hf1;
      expv[56] = 8'hbf;
      expv[57] = 8'hec;
      expv[58] = 8'h72;
      expv[59] = 8'hb6;
      expv[60] = 8'h17;
      expv[61] = 8'h24;
      expv[62] = 8'h4b;
      expv[63] = 8'h7c;
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
