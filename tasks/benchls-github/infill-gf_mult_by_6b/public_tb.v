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

  gf_mult_by_6b dut (
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
    stim[0] = 8'hea;
    stim[1] = 8'h86;
    stim[2] = 8'h82;
    stim[3] = 8'hd6;
    stim[4] = 8'ha5;
    stim[5] = 8'h42;
    stim[6] = 8'he8;
    stim[7] = 8'h3c;
    stim[8] = 8'h1f;
    stim[9] = 8'h6f;
    stim[10] = 8'h9d;
    stim[11] = 8'h75;
    stim[12] = 8'hd9;
    stim[13] = 8'hd1;
    stim[14] = 8'h33;
    stim[15] = 8'hcc;
    stim[16] = 8'ha9;
    stim[17] = 8'h54;
    stim[18] = 8'hef;
    stim[19] = 8'h57;
    stim[20] = 8'hed;
    stim[21] = 8'h88;
    stim[22] = 8'h0e;
    stim[23] = 8'h4e;
    stim[24] = 8'h0d;
    stim[25] = 8'h37;
    stim[26] = 8'he2;
    stim[27] = 8'h89;
    stim[28] = 8'h0c;
    stim[29] = 8'h7a;
    stim[30] = 8'h61;
    stim[31] = 8'h9c;
    stim[32] = 8'h46;
    stim[33] = 8'h43;
    stim[34] = 8'h0a;
    stim[35] = 8'hc3;
    stim[36] = 8'h97;
    stim[37] = 8'h94;
    stim[38] = 8'h1c;
    stim[39] = 8'he4;
    stim[40] = 8'h8c;
    stim[41] = 8'h88;
    stim[42] = 8'h80;
    stim[43] = 8'heb;
    stim[44] = 8'h46;
    stim[45] = 8'hcd;
    stim[46] = 8'h01;
    stim[47] = 8'h99;
    stim[48] = 8'h8f;
    stim[49] = 8'h03;
    stim[50] = 8'ha1;
    stim[51] = 8'hb1;
    stim[52] = 8'hf0;
    stim[53] = 8'h8a;
    stim[54] = 8'h50;
    stim[55] = 8'ha8;
    stim[56] = 8'h85;
    stim[57] = 8'h75;
    stim[58] = 8'h7d;
    stim[59] = 8'hfc;
    stim[60] = 8'h79;
    stim[61] = 8'h37;
    stim[62] = 8'h96;
    stim[63] = 8'haa;
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
      expv[0] = 8'h34;
      expv[1] = 8'hc4;
      expv[2] = 8'h75;
      expv[3] = 8'he5;
      expv[4] = 8'h98;
      expv[5] = 8'h09;
      expv[6] = 8'he2;
      expv[7] = 8'hd1;
      expv[8] = 8'h8d;
      expv[9] = 8'h4d;
      expv[10] = 8'hf8;
      expv[11] = 8'h1a;
      expv[12] = 8'h96;
      expv[13] = 8'he9;
      expv[14] = 8'ha2;
      expv[15] = 8'hb2;
      expv[16] = 8'h56;
      expv[17] = 8'h90;
      expv[18] = 8'hee;
      expv[19] = 8'h2d;
      expv[20] = 8'h38;
      expv[21] = 8'hdc;
      expv[22] = 8'h18;
      expv[23] = 8'hc7;
      expv[24] = 8'ha5;
      expv[25] = 8'h13;
      expv[26] = 8'h4b;
      expv[27] = 8'hb7;
      expv[28] = 8'hce;
      expv[29] = 8'h69;
      expv[30] = 8'h55;
      expv[31] = 8'h93;
      expv[32] = 8'hb8;
      expv[33] = 8'h62;
      expv[34] = 8'ha9;
      expv[35] = 8'hc1;
      expv[36] = 8'h51;
      expv[37] = 8'hec;
      expv[38] = 8'h30;
      expv[39] = 8'h2c;
      expv[40] = 8'h6d;
      expv[41] = 8'hdc;
      expv[42] = 8'ha3;
      expv[43] = 8'h5f;
      expv[44] = 8'hb8;
      expv[45] = 8'hd9;
      expv[46] = 8'h6b;
      expv[47] = 8'h49;
      expv[48] = 8'hd0;
      expv[49] = 8'hbd;
      expv[50] = 8'h29;
      expv[51] = 8'hd7;
      expv[52] = 8'h63;
      expv[53] = 8'h0a;
      expv[54] = 8'h21;
      expv[55] = 8'h3d;
      expv[56] = 8'h79;
      expv[57] = 8'h1a;
      expv[58] = 8'h65;
      expv[59] = 8'had;
      expv[60] = 8'hd4;
      expv[61] = 8'h13;
      expv[62] = 8'h3a;
      expv[63] = 8'heb;
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
