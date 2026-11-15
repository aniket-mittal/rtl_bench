// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00866 dut (
    .A(in_vec[32:17]),
    .B(in_vec[16:1]),
    .S(in_vec[0:0]),
    .MO(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0b3a30d85;
    stim[1] = 33'h13bda0f4f;
    stim[2] = 33'h1ebcffcf4;
    stim[3] = 33'h12600c12b;
    stim[4] = 33'h06c923bcd;
    stim[5] = 33'h123aa3267;
    stim[6] = 33'h1838239e0;
    stim[7] = 33'h0267c8e28;
    stim[8] = 33'h02a193555;
    stim[9] = 33'h0f4faaebd;
    stim[10] = 33'h00fee0b5e;
    stim[11] = 33'h04f8aaf42;
    stim[12] = 33'h1e9747e42;
    stim[13] = 33'h135c022ac;
    stim[14] = 33'h048897bc4;
    stim[15] = 33'h13bf0f64e;
    stim[16] = 33'h08669a318;
    stim[17] = 33'h0eaf0c13a;
    stim[18] = 33'h19c9c0e0c;
    stim[19] = 33'h0b362ae76;
    stim[20] = 33'h11026f216;
    stim[21] = 33'h02c5b6d44;
    stim[22] = 33'h0b1458206;
    stim[23] = 33'h03d5fbeb2;
    stim[24] = 33'h1d7115f1a;
    stim[25] = 33'h1448c42f0;
    stim[26] = 33'h013ddaa35;
    stim[27] = 33'h1875ac68b;
    stim[28] = 33'h173070256;
    stim[29] = 33'h0efb48f6b;
    stim[30] = 33'h025ba1758;
    stim[31] = 33'h105620150;
    stim[32] = 33'h01c4cae81;
    stim[33] = 33'h107ecad98;
    stim[34] = 33'h14fd66884;
    stim[35] = 33'h00b0c8c32;
    stim[36] = 33'h11f262eb0;
    stim[37] = 33'h0d1064704;
    stim[38] = 33'h0b685888e;
    stim[39] = 33'h1e2879543;
    stim[40] = 33'h10696212f;
    stim[41] = 33'h0a58662cd;
    stim[42] = 33'h017e31dad;
    stim[43] = 33'h1763c40d6;
    stim[44] = 33'h1c99816f3;
    stim[45] = 33'h130a0631d;
    stim[46] = 33'h12b970bcb;
    stim[47] = 33'h0cc0e5ef1;
    stim[48] = 33'h023fddd83;
    stim[49] = 33'h17b415a98;
    stim[50] = 33'h187e82711;
    stim[51] = 33'h08ffd92df;
    stim[52] = 33'h189fb5fde;
    stim[53] = 33'h09843f040;
    stim[54] = 33'h0fb5e6e59;
    stim[55] = 33'h0cadbc08c;
    stim[56] = 33'h07c61edc6;
    stim[57] = 33'h19ea659b2;
    stim[58] = 33'h0f5a66cef;
    stim[59] = 33'h09481eb77;
    stim[60] = 33'h1e5f8ecdb;
    stim[61] = 33'h1489fad38;
    stim[62] = 33'h0bb851fb8;
    stim[63] = 33'h008d55318;
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
      expv[0] = 16'h86c2;
      expv[1] = 16'h07a7;
      expv[2] = 16'hf5e7;
      expv[3] = 16'h6095;
      expv[4] = 16'h1de6;
      expv[5] = 16'h1933;
      expv[6] = 16'hc1c1;
      expv[7] = 16'h133e;
      expv[8] = 16'h9aaa;
      expv[9] = 16'h575e;
      expv[10] = 16'h07f7;
      expv[11] = 16'h27c5;
      expv[12] = 16'hf4ba;
      expv[13] = 16'h9ae0;
      expv[14] = 16'h2444;
      expv[15] = 16'h9df8;
      expv[16] = 16'h4334;
      expv[17] = 16'h7578;
      expv[18] = 16'hce4e;
      expv[19] = 16'h59b1;
      expv[20] = 16'h8813;
      expv[21] = 16'h162d;
      expv[22] = 16'h58a2;
      expv[23] = 16'h1eaf;
      expv[24] = 16'heb88;
      expv[25] = 16'ha246;
      expv[26] = 16'hd51a;
      expv[27] = 16'h6345;
      expv[28] = 16'hb983;
      expv[29] = 16'h47b5;
      expv[30] = 16'h12dd;
      expv[31] = 16'h82b1;
      expv[32] = 16'h5740;
      expv[33] = 16'h83f6;
      expv[34] = 16'ha7eb;
      expv[35] = 16'h0586;
      expv[36] = 16'h8f93;
      expv[37] = 16'h6883;
      expv[38] = 16'h5b42;
      expv[39] = 16'hcaa1;
      expv[40] = 16'h1097;
      expv[41] = 16'h3166;
      expv[42] = 16'h8ed6;
      expv[43] = 16'hbb1e;
      expv[44] = 16'h0b79;
      expv[45] = 16'h318e;
      expv[46] = 16'h85e5;
      expv[47] = 16'h2f78;
      expv[48] = 16'heec1;
      expv[49] = 16'hbda0;
      expv[50] = 16'h1388;
      expv[51] = 16'hc96f;
      expv[52] = 16'hc4fd;
      expv[53] = 16'h4c21;
      expv[54] = 16'h372c;
      expv[55] = 16'h656d;
      expv[56] = 16'h3e30;
      expv[57] = 16'hcf53;
      expv[58] = 16'h3677;
      expv[59] = 16'hf5bb;
      expv[60] = 16'h766d;
      expv[61] = 16'ha44f;
      expv[62] = 16'h5dc2;
      expv[63] = 16'h046a;
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
