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

  gf_mult_by_50 dut (
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
    stim[0] = 8'h3d;
    stim[1] = 8'hec;
    stim[2] = 8'hd6;
    stim[3] = 8'h40;
    stim[4] = 8'hc2;
    stim[5] = 8'hed;
    stim[6] = 8'hff;
    stim[7] = 8'h26;
    stim[8] = 8'hcf;
    stim[9] = 8'hcc;
    stim[10] = 8'h4b;
    stim[11] = 8'h3d;
    stim[12] = 8'h16;
    stim[13] = 8'ha4;
    stim[14] = 8'h84;
    stim[15] = 8'hc0;
    stim[16] = 8'h27;
    stim[17] = 8'he1;
    stim[18] = 8'h40;
    stim[19] = 8'h5f;
    stim[20] = 8'h2c;
    stim[21] = 8'h0c;
    stim[22] = 8'h9f;
    stim[23] = 8'h1a;
    stim[24] = 8'hd7;
    stim[25] = 8'hbb;
    stim[26] = 8'hee;
    stim[27] = 8'h2f;
    stim[28] = 8'h01;
    stim[29] = 8'h9d;
    stim[30] = 8'hf0;
    stim[31] = 8'h7b;
    stim[32] = 8'he3;
    stim[33] = 8'h31;
    stim[34] = 8'hdc;
    stim[35] = 8'h30;
    stim[36] = 8'h32;
    stim[37] = 8'h4f;
    stim[38] = 8'he3;
    stim[39] = 8'hf2;
    stim[40] = 8'h08;
    stim[41] = 8'hc1;
    stim[42] = 8'hbb;
    stim[43] = 8'hf9;
    stim[44] = 8'h35;
    stim[45] = 8'hcc;
    stim[46] = 8'h89;
    stim[47] = 8'h56;
    stim[48] = 8'h0e;
    stim[49] = 8'h82;
    stim[50] = 8'hf6;
    stim[51] = 8'h5d;
    stim[52] = 8'h3e;
    stim[53] = 8'h1a;
    stim[54] = 8'h34;
    stim[55] = 8'h3d;
    stim[56] = 8'hb5;
    stim[57] = 8'h90;
    stim[58] = 8'hf1;
    stim[59] = 8'hbd;
    stim[60] = 8'ha9;
    stim[61] = 8'h2e;
    stim[62] = 8'h61;
    stim[63] = 8'hbc;
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
      expv[0] = 8'h0c;
      expv[1] = 8'he3;
      expv[2] = 8'h42;
      expv[3] = 8'hb9;
      expv[4] = 8'h76;
      expv[5] = 8'hb3;
      expv[6] = 8'h7a;
      expv[7] = 8'h2f;
      expv[8] = 8'hc1;
      expv[9] = 8'h31;
      expv[10] = 8'hf3;
      expv[11] = 8'h0c;
      expv[12] = 8'h94;
      expv[13] = 8'he0;
      expv[14] = 8'h32;
      expv[15] = 8'hd6;
      expv[16] = 8'h7f;
      expv[17] = 8'h54;
      expv[18] = 8'hb9;
      expv[19] = 8'hc7;
      expv[20] = 8'h35;
      expv[21] = 8'he7;
      expv[22] = 8'h11;
      expv[23] = 8'h73;
      expv[24] = 8'h12;
      expv[25] = 8'h9e;
      expv[26] = 8'h43;
      expv[27] = 8'hc5;
      expv[28] = 8'h50;
      expv[29] = 8'hb1;
      expv[30] = 8'h6d;
      expv[31] = 8'h48;
      expv[32] = 8'hf4;
      expv[33] = 8'heb;
      expv[34] = 8'h58;
      expv[35] = 8'hbb;
      expv[36] = 8'h1b;
      expv[37] = 8'hae;
      expv[38] = 8'hf4;
      expv[39] = 8'hcd;
      expv[40] = 8'hba;
      expv[41] = 8'h86;
      expv[42] = 8'h9e;
      expv[43] = 8'h87;
      expv[44] = 8'hb6;
      expv[45] = 8'h31;
      expv[46] = 8'h85;
      expv[47] = 8'h2d;
      expv[48] = 8'h47;
      expv[49] = 8'hcf;
      expv[50] = 8'h90;
      expv[51] = 8'h67;
      expv[52] = 8'hfc;
      expv[53] = 8'h73;
      expv[54] = 8'he6;
      expv[55] = 8'h0c;
      expv[56] = 8'hd9;
      expv[57] = 8'h06;
      expv[58] = 8'h3d;
      expv[59] = 8'h63;
      expv[60] = 8'h57;
      expv[61] = 8'h95;
      expv[62] = 8'h3b;
      expv[63] = 8'h33;
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
