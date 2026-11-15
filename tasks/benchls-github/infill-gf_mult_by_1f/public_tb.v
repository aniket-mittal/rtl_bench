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

  gf_mult_by_1f dut (
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
    stim[0] = 8'h9b;
    stim[1] = 8'h79;
    stim[2] = 8'hf7;
    stim[3] = 8'hb3;
    stim[4] = 8'h7b;
    stim[5] = 8'h60;
    stim[6] = 8'ha4;
    stim[7] = 8'he4;
    stim[8] = 8'hc9;
    stim[9] = 8'hb8;
    stim[10] = 8'hc0;
    stim[11] = 8'h35;
    stim[12] = 8'h8f;
    stim[13] = 8'h01;
    stim[14] = 8'hea;
    stim[15] = 8'h5a;
    stim[16] = 8'hf0;
    stim[17] = 8'h79;
    stim[18] = 8'hf4;
    stim[19] = 8'h43;
    stim[20] = 8'h16;
    stim[21] = 8'h28;
    stim[22] = 8'h02;
    stim[23] = 8'h51;
    stim[24] = 8'h97;
    stim[25] = 8'h5f;
    stim[26] = 8'h16;
    stim[27] = 8'h5f;
    stim[28] = 8'haa;
    stim[29] = 8'hb5;
    stim[30] = 8'h9d;
    stim[31] = 8'h14;
    stim[32] = 8'haf;
    stim[33] = 8'h41;
    stim[34] = 8'h96;
    stim[35] = 8'h9a;
    stim[36] = 8'h5e;
    stim[37] = 8'h33;
    stim[38] = 8'h70;
    stim[39] = 8'h1a;
    stim[40] = 8'h43;
    stim[41] = 8'h87;
    stim[42] = 8'h68;
    stim[43] = 8'hec;
    stim[44] = 8'h4f;
    stim[45] = 8'h16;
    stim[46] = 8'h10;
    stim[47] = 8'h60;
    stim[48] = 8'h4c;
    stim[49] = 8'he7;
    stim[50] = 8'h15;
    stim[51] = 8'h0c;
    stim[52] = 8'hc8;
    stim[53] = 8'hff;
    stim[54] = 8'h8d;
    stim[55] = 8'hfd;
    stim[56] = 8'h20;
    stim[57] = 8'h8f;
    stim[58] = 8'h74;
    stim[59] = 8'hde;
    stim[60] = 8'h5b;
    stim[61] = 8'hfd;
    stim[62] = 8'hfb;
    stim[63] = 8'hc3;
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
      expv[0] = 8'h0f;
      expv[1] = 8'h5e;
      expv[2] = 8'hdf;
      expv[3] = 8'h30;
      expv[4] = 8'h60;
      expv[5] = 8'h54;
      expv[6] = 8'h80;
      expv[7] = 8'h13;
      expv[8] = 8'h4f;
      expv[9] = 8'he9;
      expv[10] = 8'ha8;
      expv[11] = 8'h49;
      expv[12] = 8'h9e;
      expv[13] = 8'h1f;
      expv[14] = 8'ha9;
      expv[15] = 8'hb8;
      expv[16] = 8'h82;
      expv[17] = 8'h5e;
      expv[18] = 8'hfe;
      expv[19] = 8'hb2;
      expv[20] = 8'haf;
      expv[21] = 8'h3f;
      expv[22] = 8'h3e;
      expv[23] = 8'h61;
      expv[24] = 8'h8b;
      expv[25] = 8'hdb;
      expv[26] = 8'haf;
      expv[27] = 8'hdb;
      expv[28] = 8'h3a;
      expv[29] = 8'h72;
      expv[30] = 8'h4d;
      expv[31] = 8'h91;
      expv[32] = 8'h59;
      expv[33] = 8'h8c;
      expv[34] = 8'h94;
      expv[35] = 8'h10;
      expv[36] = 8'hc4;
      expv[37] = 8'h0b;
      expv[38] = 8'hb9;
      expv[39] = 8'h2b;
      expv[40] = 8'hb2;
      expv[41] = 8'h66;
      expv[42] = 8'hac;
      expv[43] = 8'heb;
      expv[44] = 8'h36;
      expv[45] = 8'haf;
      expv[46] = 8'hed;
      expv[47] = 8'h54;
      expv[48] = 8'h17;
      expv[49] = 8'h32;
      expv[50] = 8'h8e;
      expv[51] = 8'h84;
      expv[52] = 8'h50;
      expv[53] = 8'h27;
      expv[54] = 8'ha0;
      expv[55] = 8'h19;
      expv[56] = 8'hc7;
      expv[57] = 8'h9e;
      expv[58] = 8'hc5;
      expv[59] = 8'hff;
      expv[60] = 8'ha7;
      expv[61] = 8'h19;
      expv[62] = 8'h5b;
      expv[63] = 8'h89;
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
