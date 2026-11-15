// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_102827 dut (
    .in(in_vec[31:0]),
    .out(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h0e63d689;
    stim[1] = 32'h13559785;
    stim[2] = 32'h6e970051;
    stim[3] = 32'hf129bb0d;
    stim[4] = 32'h8c93292f;
    stim[5] = 32'h5ccd3465;
    stim[6] = 32'hbde94e1a;
    stim[7] = 32'hd0e3c91e;
    stim[8] = 32'h4abac6e2;
    stim[9] = 32'h42b6b2a6;
    stim[10] = 32'h3d3afc8f;
    stim[11] = 32'h4cd06d53;
    stim[12] = 32'hd543ead2;
    stim[13] = 32'hec2a5744;
    stim[14] = 32'hb3c863c5;
    stim[15] = 32'hb16c4a76;
    stim[16] = 32'h103e4fa8;
    stim[17] = 32'h9646cb19;
    stim[18] = 32'ha3b4bcbb;
    stim[19] = 32'h5697f109;
    stim[20] = 32'h51a12bcd;
    stim[21] = 32'h87e84c9b;
    stim[22] = 32'h2e2acc8f;
    stim[23] = 32'hd97aeb0b;
    stim[24] = 32'h26cdeb98;
    stim[25] = 32'h04618392;
    stim[26] = 32'h2278e604;
    stim[27] = 32'h7cc1b7fb;
    stim[28] = 32'haee3ce02;
    stim[29] = 32'h7c1399d7;
    stim[30] = 32'h8b219720;
    stim[31] = 32'he0798087;
    stim[32] = 32'he15c3b9e;
    stim[33] = 32'h5bc428f6;
    stim[34] = 32'h35b5d48b;
    stim[35] = 32'hde139e1e;
    stim[36] = 32'h72e5902d;
    stim[37] = 32'h77c0ac20;
    stim[38] = 32'hb65b64ca;
    stim[39] = 32'hac4930c4;
    stim[40] = 32'hac31815a;
    stim[41] = 32'h5ce5acca;
    stim[42] = 32'h17358f79;
    stim[43] = 32'h217dd939;
    stim[44] = 32'h3cf9e519;
    stim[45] = 32'h1ccbcdfe;
    stim[46] = 32'hcbf88970;
    stim[47] = 32'hf26a12bf;
    stim[48] = 32'h385bf776;
    stim[49] = 32'he3ce5d34;
    stim[50] = 32'hf31e7e3d;
    stim[51] = 32'he26976df;
    stim[52] = 32'h0a860cd2;
    stim[53] = 32'h1acaffaf;
    stim[54] = 32'h7ae2b9ef;
    stim[55] = 32'h34c54d3a;
    stim[56] = 32'h8f53033e;
    stim[57] = 32'hc49eddc1;
    stim[58] = 32'hb9454a25;
    stim[59] = 32'h19da76f0;
    stim[60] = 32'h29f1efa8;
    stim[61] = 32'hdf62e983;
    stim[62] = 32'h2bf5da14;
    stim[63] = 32'hed6f9efe;
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
      expv[0] = 2'h2;
      expv[1] = 2'h1;
      expv[2] = 2'h0;
      expv[3] = 2'h2;
      expv[4] = 2'h0;
      expv[5] = 2'h0;
      expv[6] = 2'h1;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h1;
      expv[10] = 2'h1;
      expv[11] = 2'h2;
      expv[12] = 2'h1;
      expv[13] = 2'h1;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h0;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h2;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h1;
      expv[37] = 2'h2;
      expv[38] = 2'h2;
      expv[39] = 2'h0;
      expv[40] = 2'h2;
      expv[41] = 2'h2;
      expv[42] = 2'h1;
      expv[43] = 2'h0;
      expv[44] = 2'h2;
      expv[45] = 2'h0;
      expv[46] = 2'h1;
      expv[47] = 2'h2;
      expv[48] = 2'h2;
      expv[49] = 2'h2;
      expv[50] = 2'h1;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h1;
      expv[54] = 2'h1;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h2;
      expv[59] = 2'h1;
      expv[60] = 2'h2;
      expv[61] = 2'h1;
      expv[62] = 2'h1;
      expv[63] = 2'h1;
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
