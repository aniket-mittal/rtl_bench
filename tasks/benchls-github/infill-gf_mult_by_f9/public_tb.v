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

  gf_mult_by_f9 dut (
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
    stim[0] = 8'h40;
    stim[1] = 8'ha7;
    stim[2] = 8'hd1;
    stim[3] = 8'h96;
    stim[4] = 8'h93;
    stim[5] = 8'h0a;
    stim[6] = 8'h68;
    stim[7] = 8'h0f;
    stim[8] = 8'ha0;
    stim[9] = 8'hb4;
    stim[10] = 8'hb4;
    stim[11] = 8'hf0;
    stim[12] = 8'h28;
    stim[13] = 8'hde;
    stim[14] = 8'h8f;
    stim[15] = 8'h1e;
    stim[16] = 8'he2;
    stim[17] = 8'h9c;
    stim[18] = 8'h53;
    stim[19] = 8'h34;
    stim[20] = 8'h3c;
    stim[21] = 8'h52;
    stim[22] = 8'hb8;
    stim[23] = 8'h8f;
    stim[24] = 8'h55;
    stim[25] = 8'h6a;
    stim[26] = 8'h63;
    stim[27] = 8'h45;
    stim[28] = 8'h83;
    stim[29] = 8'h14;
    stim[30] = 8'h25;
    stim[31] = 8'h06;
    stim[32] = 8'he5;
    stim[33] = 8'h93;
    stim[34] = 8'h2c;
    stim[35] = 8'h66;
    stim[36] = 8'hea;
    stim[37] = 8'h4f;
    stim[38] = 8'hdc;
    stim[39] = 8'h24;
    stim[40] = 8'hc1;
    stim[41] = 8'h8d;
    stim[42] = 8'h23;
    stim[43] = 8'h9a;
    stim[44] = 8'h53;
    stim[45] = 8'h83;
    stim[46] = 8'h77;
    stim[47] = 8'ha6;
    stim[48] = 8'h50;
    stim[49] = 8'h7a;
    stim[50] = 8'hda;
    stim[51] = 8'h83;
    stim[52] = 8'h87;
    stim[53] = 8'ha0;
    stim[54] = 8'hbd;
    stim[55] = 8'h38;
    stim[56] = 8'h57;
    stim[57] = 8'h47;
    stim[58] = 8'h2b;
    stim[59] = 8'h0d;
    stim[60] = 8'h73;
    stim[61] = 8'hd1;
    stim[62] = 8'hb0;
    stim[63] = 8'h44;
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
      expv[0] = 8'hac;
      expv[1] = 8'hc6;
      expv[2] = 8'h3b;
      expv[3] = 8'h42;
      expv[4] = 8'h78;
      expv[5] = 8'h74;
      expv[6] = 8'h61;
      expv[7] = 8'h4e;
      expv[8] = 8'h13;
      expv[9] = 8'hfb;
      expv[10] = 8'hfb;
      expv[11] = 8'h94;
      expv[12] = 8'hcd;
      expv[13] = 8'h75;
      expv[14] = 8'h0b;
      expv[15] = 8'h9c;
      expv[16] = 8'h50;
      expv[17] = 8'h36;
      expv[18] = 8'h91;
      expv[19] = 8'hbe;
      expv[20] = 8'h25;
      expv[21] = 8'h68;
      expv[22] = 8'ha3;
      expv[23] = 8'h0b;
      expv[24] = 8'hbd;
      expv[25] = 8'h8e;
      expv[26] = 8'hec;
      expv[27] = 8'h96;
      expv[28] = 8'h53;
      expv[29] = 8'he8;
      expv[30] = 8'h6c;
      expv[31] = 8'h2c;
      expv[32] = 8'h85;
      expv[33] = 8'h78;
      expv[34] = 8'h0e;
      expv[35] = 8'hd6;
      expv[36] = 8'hcb;
      expv[37] = 8'he2;
      expv[38] = 8'h9a;
      expv[39] = 8'h95;
      expv[40] = 8'h10;
      expv[41] = 8'he4;
      expv[42] = 8'h40;
      expv[43] = 8'h1a;
      expv[44] = 8'h91;
      expv[45] = 8'h53;
      expv[46] = 8'h04;
      expv[47] = 8'h3f;
      expv[48] = 8'h87;
      expv[49] = 8'ha5;
      expv[50] = 8'hb6;
      expv[51] = 8'h53;
      expv[52] = 8'h90;
      expv[53] = 8'h13;
      expv[54] = 8'h99;
      expv[55] = 8'he6;
      expv[56] = 8'h52;
      expv[57] = 8'h79;
      expv[58] = 8'hdb;
      expv[59] = 8'ha1;
      expv[60] = 8'hc7;
      expv[61] = 8'h3b;
      expv[62] = 8'h38;
      expv[63] = 8'h6f;
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
