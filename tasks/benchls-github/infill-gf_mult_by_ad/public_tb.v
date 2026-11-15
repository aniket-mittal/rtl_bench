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

  gf_mult_by_ad dut (
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
    stim[0] = 8'hcc;
    stim[1] = 8'haf;
    stim[2] = 8'h83;
    stim[3] = 8'h56;
    stim[4] = 8'hfd;
    stim[5] = 8'h4f;
    stim[6] = 8'h95;
    stim[7] = 8'h6c;
    stim[8] = 8'hfa;
    stim[9] = 8'h92;
    stim[10] = 8'h31;
    stim[11] = 8'h24;
    stim[12] = 8'hc4;
    stim[13] = 8'h3b;
    stim[14] = 8'h23;
    stim[15] = 8'h83;
    stim[16] = 8'h0c;
    stim[17] = 8'hf1;
    stim[18] = 8'h4b;
    stim[19] = 8'h90;
    stim[20] = 8'ha7;
    stim[21] = 8'heb;
    stim[22] = 8'h76;
    stim[23] = 8'hbf;
    stim[24] = 8'h60;
    stim[25] = 8'h31;
    stim[26] = 8'h5c;
    stim[27] = 8'hb1;
    stim[28] = 8'h1f;
    stim[29] = 8'h9a;
    stim[30] = 8'hf3;
    stim[31] = 8'h1e;
    stim[32] = 8'h2d;
    stim[33] = 8'hd1;
    stim[34] = 8'h9c;
    stim[35] = 8'h70;
    stim[36] = 8'hd1;
    stim[37] = 8'h8d;
    stim[38] = 8'ha8;
    stim[39] = 8'hdc;
    stim[40] = 8'h5b;
    stim[41] = 8'h2d;
    stim[42] = 8'h2c;
    stim[43] = 8'h5d;
    stim[44] = 8'h87;
    stim[45] = 8'hda;
    stim[46] = 8'h91;
    stim[47] = 8'h83;
    stim[48] = 8'h65;
    stim[49] = 8'h9f;
    stim[50] = 8'he1;
    stim[51] = 8'h33;
    stim[52] = 8'ha6;
    stim[53] = 8'h18;
    stim[54] = 8'hfe;
    stim[55] = 8'h23;
    stim[56] = 8'hd8;
    stim[57] = 8'hf1;
    stim[58] = 8'h0a;
    stim[59] = 8'hf8;
    stim[60] = 8'hd2;
    stim[61] = 8'h2c;
    stim[62] = 8'he6;
    stim[63] = 8'hba;
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
      expv[0] = 8'h97;
      expv[1] = 8'h71;
      expv[2] = 8'hfa;
      expv[3] = 8'hc3;
      expv[4] = 8'h3c;
      expv[5] = 8'h6d;
      expv[6] = 8'h31;
      expv[7] = 8'h83;
      expv[8] = 8'h58;
      expv[9] = 8'h55;
      expv[10] = 8'hab;
      expv[11] = 8'h8a;
      expv[12] = 8'h96;
      expv[13] = 8'hed;
      expv[14] = 8'hee;
      expv[15] = 8'hfa;
      expv[16] = 8'h8f;
      expv[17] = 8'hb3;
      expv[18] = 8'he3;
      expv[19] = 8'h12;
      expv[20] = 8'h70;
      expv[21] = 8'hf7;
      expv[22] = 8'hc7;
      expv[23] = 8'h73;
      expv[24] = 8'h0c;
      expv[25] = 8'hab;
      expv[26] = 8'h85;
      expv[27] = 8'hbb;
      expv[28] = 8'h67;
      expv[29] = 8'h54;
      expv[30] = 8'hf4;
      expv[31] = 8'hca;
      expv[32] = 8'h26;
      expv[33] = 8'hb7;
      expv[34] = 8'h9d;
      expv[35] = 8'h0e;
      expv[36] = 8'hb7;
      expv[37] = 8'h32;
      expv[38] = 8'h15;
      expv[39] = 8'h95;
      expv[40] = 8'he1;
      expv[41] = 8'h26;
      expv[42] = 8'h8b;
      expv[43] = 8'h28;
      expv[44] = 8'h74;
      expv[45] = 8'h5c;
      expv[46] = 8'hbf;
      expv[47] = 8'hfa;
      expv[48] = 8'h2f;
      expv[49] = 8'h77;
      expv[50] = 8'hb1;
      expv[51] = 8'hec;
      expv[52] = 8'hdd;
      expv[53] = 8'h03;
      expv[54] = 8'hd6;
      expv[55] = 8'hee;
      expv[56] = 8'h1b;
      expv[57] = 8'hb3;
      expv[58] = 8'h46;
      expv[59] = 8'h1f;
      expv[60] = 8'h5d;
      expv[61] = 8'h8b;
      expv[62] = 8'hd5;
      expv[63] = 8'h50;
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
