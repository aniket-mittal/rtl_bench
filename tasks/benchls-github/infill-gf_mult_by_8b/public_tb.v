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

  gf_mult_by_8b dut (
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
    stim[0] = 8'h30;
    stim[1] = 8'h3f;
    stim[2] = 8'h2d;
    stim[3] = 8'h4a;
    stim[4] = 8'h92;
    stim[5] = 8'h0a;
    stim[6] = 8'h62;
    stim[7] = 8'h8d;
    stim[8] = 8'h47;
    stim[9] = 8'hcc;
    stim[10] = 8'ha9;
    stim[11] = 8'h3c;
    stim[12] = 8'hdc;
    stim[13] = 8'h94;
    stim[14] = 8'he1;
    stim[15] = 8'h1f;
    stim[16] = 8'h25;
    stim[17] = 8'h12;
    stim[18] = 8'h03;
    stim[19] = 8'hdd;
    stim[20] = 8'h31;
    stim[21] = 8'h9d;
    stim[22] = 8'hc1;
    stim[23] = 8'hb4;
    stim[24] = 8'hb2;
    stim[25] = 8'h8a;
    stim[26] = 8'hbb;
    stim[27] = 8'hae;
    stim[28] = 8'heb;
    stim[29] = 8'h41;
    stim[30] = 8'h5c;
    stim[31] = 8'hb5;
    stim[32] = 8'hbb;
    stim[33] = 8'h96;
    stim[34] = 8'hf0;
    stim[35] = 8'hf5;
    stim[36] = 8'h1f;
    stim[37] = 8'h34;
    stim[38] = 8'h0b;
    stim[39] = 8'h84;
    stim[40] = 8'h54;
    stim[41] = 8'h2a;
    stim[42] = 8'h9a;
    stim[43] = 8'h78;
    stim[44] = 8'h56;
    stim[45] = 8'h45;
    stim[46] = 8'hd5;
    stim[47] = 8'h4a;
    stim[48] = 8'h9e;
    stim[49] = 8'hd5;
    stim[50] = 8'heb;
    stim[51] = 8'hf1;
    stim[52] = 8'hff;
    stim[53] = 8'h5c;
    stim[54] = 8'h52;
    stim[55] = 8'h6d;
    stim[56] = 8'hd5;
    stim[57] = 8'h77;
    stim[58] = 8'h2c;
    stim[59] = 8'h81;
    stim[60] = 8'hf0;
    stim[61] = 8'h73;
    stim[62] = 8'h02;
    stim[63] = 8'hf9;
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
      expv[1] = 8'h52;
      expv[2] = 8'h01;
      expv[3] = 8'h5a;
      expv[4] = 8'ha9;
      expv[5] = 8'h27;
      expv[6] = 8'hc6;
      expv[7] = 8'h4b;
      expv[8] = 8'heb;
      expv[9] = 8'hbd;
      expv[10] = 8'hed;
      expv[11] = 8'hd2;
      expv[12] = 8'he5;
      expv[13] = 8'hb4;
      expv[14] = 8'hbc;
      expv[15] = 8'he2;
      expv[16] = 8'h2d;
      expv[17] = 8'h53;
      expv[18] = 8'h80;
      expv[19] = 8'h6e;
      expv[20] = 8'h63;
      expv[21] = 8'h13;
      expv[22] = 8'h0c;
      expv[23] = 8'h04;
      expv[24] = 8'h19;
      expv[25] = 8'hdd;
      expv[26] = 8'hbe;
      expv[27] = 8'h7b;
      expv[28] = 8'h9b;
      expv[29] = 8'hf6;
      expv[30] = 8'h1f;
      expv[31] = 8'h8f;
      expv[32] = 8'hbe;
      expv[33] = 8'hbf;
      expv[34] = 8'h6f;
      expv[35] = 8'hf2;
      expv[36] = 8'he2;
      expv[37] = 8'hfe;
      expv[38] = 8'hac;
      expv[39] = 8'hec;
      expv[40] = 8'h33;
      expv[41] = 8'h97;
      expv[42] = 8'h85;
      expv[43] = 8'hb9;
      expv[44] = 8'h38;
      expv[45] = 8'he0;
      expv[46] = 8'h42;
      expv[47] = 8'h5a;
      expv[48] = 8'h93;
      expv[49] = 8'h42;
      expv[50] = 8'h9b;
      expv[51] = 8'he4;
      expv[52] = 8'hd5;
      expv[53] = 8'h1f;
      expv[54] = 8'h2e;
      expv[55] = 8'h7c;
      expv[56] = 8'h42;
      expv[57] = 8'h03;
      expv[58] = 8'h8a;
      expv[59] = 8'h71;
      expv[60] = 8'h6f;
      expv[61] = 8'h15;
      expv[62] = 8'h0b;
      expv[63] = 8'hc8;
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
