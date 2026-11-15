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

  gf_mult_by_dd dut (
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
    stim[0] = 8'h09;
    stim[1] = 8'h40;
    stim[2] = 8'h83;
    stim[3] = 8'hb9;
    stim[4] = 8'h17;
    stim[5] = 8'hcf;
    stim[6] = 8'h1d;
    stim[7] = 8'had;
    stim[8] = 8'h77;
    stim[9] = 8'h80;
    stim[10] = 8'h9a;
    stim[11] = 8'h65;
    stim[12] = 8'h48;
    stim[13] = 8'hf5;
    stim[14] = 8'hbe;
    stim[15] = 8'hc0;
    stim[16] = 8'h8f;
    stim[17] = 8'hd5;
    stim[18] = 8'h29;
    stim[19] = 8'hc1;
    stim[20] = 8'h08;
    stim[21] = 8'h69;
    stim[22] = 8'h45;
    stim[23] = 8'hf4;
    stim[24] = 8'h86;
    stim[25] = 8'h40;
    stim[26] = 8'hbb;
    stim[27] = 8'h97;
    stim[28] = 8'h52;
    stim[29] = 8'hb1;
    stim[30] = 8'hea;
    stim[31] = 8'h79;
    stim[32] = 8'h59;
    stim[33] = 8'h8b;
    stim[34] = 8'h9f;
    stim[35] = 8'h14;
    stim[36] = 8'h33;
    stim[37] = 8'h92;
    stim[38] = 8'h87;
    stim[39] = 8'h20;
    stim[40] = 8'h36;
    stim[41] = 8'h5c;
    stim[42] = 8'hd2;
    stim[43] = 8'h2b;
    stim[44] = 8'hde;
    stim[45] = 8'h0c;
    stim[46] = 8'h45;
    stim[47] = 8'h53;
    stim[48] = 8'h45;
    stim[49] = 8'hbb;
    stim[50] = 8'h03;
    stim[51] = 8'h58;
    stim[52] = 8'h9c;
    stim[53] = 8'h59;
    stim[54] = 8'h7c;
    stim[55] = 8'h03;
    stim[56] = 8'h91;
    stim[57] = 8'h5b;
    stim[58] = 8'h76;
    stim[59] = 8'h59;
    stim[60] = 8'he5;
    stim[61] = 8'h95;
    stim[62] = 8'h5e;
    stim[63] = 8'h51;
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
      expv[0] = 8'h7b;
      expv[1] = 8'h59;
      expv[2] = 8'hc8;
      expv[3] = 8'h3a;
      expv[4] = 8'h78;
      expv[5] = 8'h64;
      expv[6] = 8'h79;
      expv[7] = 8'h38;
      expv[8] = 8'h83;
      expv[9] = 8'hb2;
      expv[10] = 8'he2;
      expv[11] = 8'h75;
      expv[12] = 8'hff;
      expv[13] = 8'h96;
      expv[14] = 8'h13;
      expv[15] = 8'heb;
      expv[16] = 8'h3d;
      expv[17] = 8'h34;
      expv[18] = 8'hd9;
      expv[19] = 8'h36;
      expv[20] = 8'ha6;
      expv[21] = 8'h80;
      expv[22] = 8'hd7;
      expv[23] = 8'h4b;
      expv[24] = 8'h46;
      expv[25] = 8'h59;
      expv[26] = 8'h9d;
      expv[27] = 8'hca;
      expv[28] = 8'haf;
      expv[29] = 8'h9c;
      expv[30] = 8'h48;
      expv[31] = 8'hd1;
      expv[32] = 8'h73;
      expv[33] = 8'h6e;
      expv[34] = 8'h6c;
      expv[35] = 8'h02;
      expv[36] = 8'h89;
      expv[37] = 8'h44;
      expv[38] = 8'h9b;
      expv[39] = 8'ha2;
      expv[40] = 8'h07;
      expv[41] = 8'hfd;
      expv[42] = 8'h1d;
      expv[43] = 8'h7e;
      expv[44] = 8'he8;
      expv[45] = 8'hf5;
      expv[46] = 8'hd7;
      expv[47] = 8'h72;
      expv[48] = 8'hd7;
      expv[49] = 8'h9d;
      expv[50] = 8'h7a;
      expv[51] = 8'hae;
      expv[52] = 8'h16;
      expv[53] = 8'h73;
      expv[54] = 8'h5f;
      expv[55] = 8'h7a;
      expv[56] = 8'h3e;
      expv[57] = 8'hd4;
      expv[58] = 8'h5e;
      expv[59] = 8'h73;
      expv[60] = 8'hc7;
      expv[61] = 8'h6d;
      expv[62] = 8'h5a;
      expv[63] = 8'hd5;
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
