// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  tern_node dut (
    .clk(clk),
    .a(in_vec[23:16]),
    .b(in_vec[15:8]),
    .c(in_vec[7:0]),
    .o(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hc68f3a;
    stim[1] = 24'h76641b;
    stim[2] = 24'h598b9a;
    stim[3] = 24'hc3fd72;
    stim[4] = 24'h307da5;
    stim[5] = 24'h11170f;
    stim[6] = 24'hbb1050;
    stim[7] = 24'hb4b5f3;
    stim[8] = 24'he4f459;
    stim[9] = 24'h9ffaf1;
    stim[10] = 24'h13fcc1;
    stim[11] = 24'h5bb05d;
    stim[12] = 24'h054237;
    stim[13] = 24'h9ff8d5;
    stim[14] = 24'h326b03;
    stim[15] = 24'h0de4a8;
    stim[16] = 24'ha222e5;
    stim[17] = 24'h876354;
    stim[18] = 24'hdb5583;
    stim[19] = 24'h2fb6cb;
    stim[20] = 24'h660761;
    stim[21] = 24'h2dad77;
    stim[22] = 24'hc32a78;
    stim[23] = 24'h419526;
    stim[24] = 24'h1c87b7;
    stim[25] = 24'h80da95;
    stim[26] = 24'h0e3dc4;
    stim[27] = 24'h396bd0;
    stim[28] = 24'hc0f206;
    stim[29] = 24'hcaa5dc;
    stim[30] = 24'h842701;
    stim[31] = 24'h8918f8;
    stim[32] = 24'hbc1129;
    stim[33] = 24'hc65439;
    stim[34] = 24'h2b5007;
    stim[35] = 24'hf7db55;
    stim[36] = 24'h52d84f;
    stim[37] = 24'h9f5237;
    stim[38] = 24'h3b95aa;
    stim[39] = 24'h5df131;
    stim[40] = 24'hdb1e98;
    stim[41] = 24'had36a9;
    stim[42] = 24'hec771b;
    stim[43] = 24'hb43207;
    stim[44] = 24'heb27e9;
    stim[45] = 24'hcffcf9;
    stim[46] = 24'h74637e;
    stim[47] = 24'h8079cc;
    stim[48] = 24'h942ee8;
    stim[49] = 24'h5a05c2;
    stim[50] = 24'h367408;
    stim[51] = 24'h7434c0;
    stim[52] = 24'hccd437;
    stim[53] = 24'h9400ce;
    stim[54] = 24'hfa02de;
    stim[55] = 24'h62079f;
    stim[56] = 24'hf19ee7;
    stim[57] = 24'h85e3d4;
    stim[58] = 24'hb7ee2f;
    stim[59] = 24'he794f1;
    stim[60] = 24'h84c2f4;
    stim[61] = 24'h8185c3;
    stim[62] = 24'hc78aa7;
    stim[63] = 24'h7a8764;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 10'hxxx;
      expv[1] = 10'h18f;
      expv[2] = 10'h0f5;
      expv[3] = 10'h17e;
      expv[4] = 10'h232;
      expv[5] = 10'h152;
      expv[6] = 10'h037;
      expv[7] = 10'h11b;
      expv[8] = 10'h25c;
      expv[9] = 10'h231;
      expv[10] = 10'h28a;
      expv[11] = 10'h1d0;
      expv[12] = 10'h168;
      expv[13] = 10'h07e;
      expv[14] = 10'h26c;
      expv[15] = 10'h0a0;
      expv[16] = 10'h199;
      expv[17] = 10'h1a9;
      expv[18] = 10'h13e;
      expv[19] = 10'h1b3;
      expv[20] = 10'h1b0;
      expv[21] = 10'h0ce;
      expv[22] = 10'h151;
      expv[23] = 10'h165;
      expv[24] = 10'h0fc;
      expv[25] = 10'h15a;
      expv[26] = 10'h1ef;
      expv[27] = 10'h10f;
      expv[28] = 10'h174;
      expv[29] = 10'h1b8;
      expv[30] = 10'h24b;
      expv[31] = 10'h0ac;
      expv[32] = 10'h199;
      expv[33] = 10'h0f6;
      expv[34] = 10'h153;
      expv[35] = 10'h082;
      expv[36] = 10'h227;
      expv[37] = 10'h179;
      expv[38] = 10'h128;
      expv[39] = 10'h17a;
      expv[40] = 10'h17f;
      expv[41] = 10'h191;
      expv[42] = 10'h18c;
      expv[43] = 10'h17e;
      expv[44] = 10'h0ed;
      expv[45] = 10'h1fb;
      expv[46] = 10'h2c4;
      expv[47] = 10'h155;
      expv[48] = 10'h1c5;
      expv[49] = 10'h1aa;
      expv[50] = 10'h121;
      expv[51] = 10'h0b2;
      expv[52] = 10'h168;
      expv[53] = 10'h1d7;
      expv[54] = 10'h162;
      expv[55] = 10'h1da;
      expv[56] = 10'h108;
      expv[57] = 10'h276;
      expv[58] = 10'h23c;
      expv[59] = 10'h1d4;
      expv[60] = 10'h26c;
      expv[61] = 10'h23a;
      expv[62] = 10'h1c9;
      expv[63] = 10'h1f8;
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
