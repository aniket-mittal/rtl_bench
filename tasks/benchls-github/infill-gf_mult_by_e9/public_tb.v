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

  gf_mult_by_e9 dut (
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
    stim[0] = 8'h9e;
    stim[1] = 8'h6c;
    stim[2] = 8'hd8;
    stim[3] = 8'hcf;
    stim[4] = 8'h3a;
    stim[5] = 8'he4;
    stim[6] = 8'h8c;
    stim[7] = 8'h8c;
    stim[8] = 8'h70;
    stim[9] = 8'h98;
    stim[10] = 8'h3f;
    stim[11] = 8'h8b;
    stim[12] = 8'hae;
    stim[13] = 8'hc9;
    stim[14] = 8'hf9;
    stim[15] = 8'h44;
    stim[16] = 8'h07;
    stim[17] = 8'hd9;
    stim[18] = 8'hdf;
    stim[19] = 8'h9d;
    stim[20] = 8'h91;
    stim[21] = 8'h80;
    stim[22] = 8'h2c;
    stim[23] = 8'hc5;
    stim[24] = 8'hf4;
    stim[25] = 8'h37;
    stim[26] = 8'h51;
    stim[27] = 8'ha1;
    stim[28] = 8'ha0;
    stim[29] = 8'h9b;
    stim[30] = 8'haf;
    stim[31] = 8'h6f;
    stim[32] = 8'h58;
    stim[33] = 8'h4b;
    stim[34] = 8'h36;
    stim[35] = 8'h69;
    stim[36] = 8'hc9;
    stim[37] = 8'hf1;
    stim[38] = 8'he6;
    stim[39] = 8'ha6;
    stim[40] = 8'hd8;
    stim[41] = 8'h6c;
    stim[42] = 8'h0a;
    stim[43] = 8'h5f;
    stim[44] = 8'ha9;
    stim[45] = 8'he8;
    stim[46] = 8'h9d;
    stim[47] = 8'hae;
    stim[48] = 8'h97;
    stim[49] = 8'h5f;
    stim[50] = 8'hc5;
    stim[51] = 8'hdc;
    stim[52] = 8'h36;
    stim[53] = 8'h3a;
    stim[54] = 8'h2f;
    stim[55] = 8'h6b;
    stim[56] = 8'h79;
    stim[57] = 8'hb4;
    stim[58] = 8'hfd;
    stim[59] = 8'hf2;
    stim[60] = 8'h38;
    stim[61] = 8'hfd;
    stim[62] = 8'h0b;
    stim[63] = 8'h6c;
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
      expv[0] = 8'hcc;
      expv[1] = 8'h2c;
      expv[2] = 8'h58;
      expv[3] = 8'hcb;
      expv[4] = 8'h8e;
      expv[5] = 8'h9a;
      expv[6] = 8'h35;
      expv[7] = 8'h35;
      expv[8] = 8'h82;
      expv[9] = 8'h80;
      expv[10] = 8'he4;
      expv[11] = 8'h90;
      expv[12] = 8'h96;
      expv[13] = 8'h87;
      expv[14] = 8'hdd;
      expv[15] = 8'h5b;
      expv[16] = 8'ha5;
      expv[17] = 8'hb1;
      expv[18] = 8'hfd;
      expv[19] = 8'hea;
      expv[20] = 8'h72;
      expv[21] = 8'had;
      expv[22] = 8'hf4;
      expv[23] = 8'h1f;
      expv[24] = 8'hac;
      expv[25] = 8'hff;
      expv[26] = 8'h07;
      expv[27] = 8'h28;
      expv[28] = 8'hc1;
      expv[29] = 8'ha6;
      expv[30] = 8'h7f;
      expv[31] = 8'h0a;
      expv[32] = 8'hf5;
      expv[33] = 8'he5;
      expv[34] = 8'h16;
      expv[35] = 8'h46;
      expv[36] = 8'h87;
      expv[37] = 8'hc6;
      expv[38] = 8'h55;
      expv[39] = 8'h8d;
      expv[40] = 8'h58;
      expv[41] = 8'h2c;
      expv[42] = 8'hd4;
      expv[43] = 8'h50;
      expv[44] = 8'h33;
      expv[45] = 8'h02;
      expv[46] = 8'hea;
      expv[47] = 8'h96;
      expv[48] = 8'h3e;
      expv[49] = 8'h50;
      expv[50] = 8'h1f;
      expv[51] = 8'hdb;
      expv[52] = 8'h16;
      expv[53] = 8'h8e;
      expv[54] = 8'hd2;
      expv[55] = 8'h89;
      expv[56] = 8'h70;
      expv[57] = 8'h74;
      expv[58] = 8'h5e;
      expv[59] = 8'he0;
      expv[60] = 8'h41;
      expv[61] = 8'h5e;
      expv[62] = 8'h3d;
      expv[63] = 8'h2c;
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
