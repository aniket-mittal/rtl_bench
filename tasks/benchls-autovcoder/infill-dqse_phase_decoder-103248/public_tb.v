// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_103248 dut (
    .avl_writedata(in_vec[31:0]),
    .dqse_phase(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h34708fba;
    stim[1] = 32'hfb5d5fce;
    stim[2] = 32'h5a3379d2;
    stim[3] = 32'h9f7cd0bf;
    stim[4] = 32'h259e2663;
    stim[5] = 32'h42d6f9e5;
    stim[6] = 32'h47e84375;
    stim[7] = 32'h6786c5ee;
    stim[8] = 32'heb74261e;
    stim[9] = 32'h4c32c85d;
    stim[10] = 32'ha1b7c88a;
    stim[11] = 32'he20594bb;
    stim[12] = 32'he55e37bf;
    stim[13] = 32'h01b27d81;
    stim[14] = 32'ha3247338;
    stim[15] = 32'h63b882fa;
    stim[16] = 32'hbf9aa14e;
    stim[17] = 32'h72603dc7;
    stim[18] = 32'h57da92b6;
    stim[19] = 32'hebc17b09;
    stim[20] = 32'h868b9b60;
    stim[21] = 32'hab3286e7;
    stim[22] = 32'h80e46e8e;
    stim[23] = 32'hdb577c5a;
    stim[24] = 32'h746ec6e7;
    stim[25] = 32'h165fbedb;
    stim[26] = 32'haead14fe;
    stim[27] = 32'hd9979d1a;
    stim[28] = 32'h558401d7;
    stim[29] = 32'h53b4188c;
    stim[30] = 32'h6018ef7d;
    stim[31] = 32'hed8c9d27;
    stim[32] = 32'h15b757ac;
    stim[33] = 32'hc09a158e;
    stim[34] = 32'h093457ad;
    stim[35] = 32'he05b9bb4;
    stim[36] = 32'h7025b4b5;
    stim[37] = 32'hb08f00f3;
    stim[38] = 32'h8fcb06e9;
    stim[39] = 32'hb8cc081c;
    stim[40] = 32'hcdd1e8b1;
    stim[41] = 32'haa10d32f;
    stim[42] = 32'h0363e450;
    stim[43] = 32'h62c03646;
    stim[44] = 32'h33c8b432;
    stim[45] = 32'h22b660c5;
    stim[46] = 32'h975eb199;
    stim[47] = 32'hd94e9951;
    stim[48] = 32'hc4b9aab2;
    stim[49] = 32'he1ecca44;
    stim[50] = 32'h79afdeab;
    stim[51] = 32'hf089f8ee;
    stim[52] = 32'h6137497d;
    stim[53] = 32'h86e36750;
    stim[54] = 32'h8ae0aa1b;
    stim[55] = 32'h7ebce162;
    stim[56] = 32'ha00f7d5a;
    stim[57] = 32'hb96bdf65;
    stim[58] = 32'h9f4bb81c;
    stim[59] = 32'hb57ed72a;
    stim[60] = 32'hf29bcf17;
    stim[61] = 32'hc3d66772;
    stim[62] = 32'h5c251a83;
    stim[63] = 32'h76fd8fd5;
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
      expv[0] = 4'h4;
      expv[1] = 4'h8;
      expv[2] = 4'h4;
      expv[3] = 4'h9;
      expv[4] = 4'h5;
      expv[5] = 4'hf;
      expv[6] = 4'hf;
      expv[7] = 4'h8;
      expv[8] = 4'h8;
      expv[9] = 4'hf;
      expv[10] = 4'h4;
      expv[11] = 4'h5;
      expv[12] = 4'h9;
      expv[13] = 4'h3;
      expv[14] = 4'h2;
      expv[15] = 4'h4;
      expv[16] = 4'h8;
      expv[17] = 4'h9;
      expv[18] = 4'h8;
      expv[19] = 4'h3;
      expv[20] = 4'h2;
      expv[21] = 4'h9;
      expv[22] = 4'h8;
      expv[23] = 4'h4;
      expv[24] = 4'h9;
      expv[25] = 4'h5;
      expv[26] = 4'h8;
      expv[27] = 4'h4;
      expv[28] = 4'h9;
      expv[29] = 4'h6;
      expv[30] = 4'hf;
      expv[31] = 4'h9;
      expv[32] = 4'h6;
      expv[33] = 4'h8;
      expv[34] = 4'hf;
      expv[35] = 4'h6;
      expv[36] = 4'hf;
      expv[37] = 4'h5;
      expv[38] = 4'h3;
      expv[39] = 4'h6;
      expv[40] = 4'h3;
      expv[41] = 4'h9;
      expv[42] = 4'h2;
      expv[43] = 4'h8;
      expv[44] = 4'h4;
      expv[45] = 4'hf;
      expv[46] = 4'h3;
      expv[47] = 4'h3;
      expv[48] = 4'h4;
      expv[49] = 4'h6;
      expv[50] = 4'h5;
      expv[51] = 4'h8;
      expv[52] = 4'hf;
      expv[53] = 4'h2;
      expv[54] = 4'h5;
      expv[55] = 4'h4;
      expv[56] = 4'h4;
      expv[57] = 4'hf;
      expv[58] = 4'h6;
      expv[59] = 4'h4;
      expv[60] = 4'h9;
      expv[61] = 4'h4;
      expv[62] = 4'h5;
      expv[63] = 4'hf;
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
