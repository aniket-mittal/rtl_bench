// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_017407 dut (
    .clk(clk),
    .rst_n(in_vec[21:21]),
    .j_en(in_vec[20:20]),
    .bgtz_en(in_vec[19:19]),
    .PCSrc(in_vec[18:18]),
    .offset(in_vec[17:0]),
    .pc(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h179ddf;
    stim[1] = 22'h1ae2f6;
    stim[2] = 22'h2d3fe8;
    stim[3] = 22'h269be4;
    stim[4] = 22'h2c044d;
    stim[5] = 22'h270d60;
    stim[6] = 22'h2e21f1;
    stim[7] = 22'h3c740a;
    stim[8] = 22'h283197;
    stim[9] = 22'h28e02e;
    stim[10] = 22'h37cd51;
    stim[11] = 22'h366ba2;
    stim[12] = 22'h34619e;
    stim[13] = 22'h2ddf6e;
    stim[14] = 22'h0c3976;
    stim[15] = 22'h222482;
    stim[16] = 22'h30000f;
    stim[17] = 22'h388043;
    stim[18] = 22'h33193b;
    stim[19] = 22'h34ea3e;
    stim[20] = 22'h046eb7;
    stim[21] = 22'h3b45c6;
    stim[22] = 22'h2226c4;
    stim[23] = 22'h255af2;
    stim[24] = 22'h2cb3a2;
    stim[25] = 22'h3275ae;
    stim[26] = 22'h34858e;
    stim[27] = 22'h38b5dc;
    stim[28] = 22'h229c1f;
    stim[29] = 22'h2eb38e;
    stim[30] = 22'h204f63;
    stim[31] = 22'h2b0559;
    stim[32] = 22'h3605d0;
    stim[33] = 22'h32c780;
    stim[34] = 22'h3e7b7d;
    stim[35] = 22'h3694c0;
    stim[36] = 22'h2c5dd1;
    stim[37] = 22'h301c46;
    stim[38] = 22'h255c24;
    stim[39] = 22'h3676c2;
    stim[40] = 22'h391d89;
    stim[41] = 22'h334449;
    stim[42] = 22'h2f736d;
    stim[43] = 22'h38857c;
    stim[44] = 22'h2269fb;
    stim[45] = 22'h3955bc;
    stim[46] = 22'h3ed99e;
    stim[47] = 22'h35669b;
    stim[48] = 22'h325499;
    stim[49] = 22'h3152ee;
    stim[50] = 22'h356cbf;
    stim[51] = 22'h3e45fa;
    stim[52] = 22'h34da05;
    stim[53] = 22'h297116;
    stim[54] = 22'h3ec571;
    stim[55] = 22'h3feae5;
    stim[56] = 22'h3a3f1d;
    stim[57] = 22'h28f955;
    stim[58] = 22'h32108e;
    stim[59] = 22'h2b1427;
    stim[60] = 22'h276ee2;
    stim[61] = 22'h38f1b2;
    stim[62] = 22'h2b9b64;
    stim[63] = 22'h27386c;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00013fe8;
      expv[4] = 32'h00013fe8;
      expv[5] = 32'h00014435;
      expv[6] = 32'h00014435;
      expv[7] = 32'h00032244;
      expv[8] = 32'h1d05a244;
      expv[9] = 32'h1d05a244;
      expv[10] = 32'h1d05a244;
      expv[11] = 32'h1059e244;
      expv[12] = 32'hab426244;
      expv[13] = 32'hc3a9e244;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000004;
      expv[18] = 32'h00000004;
      expv[19] = 32'h00000004;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000004;
      expv[24] = 32'h00000004;
      expv[25] = 32'h0000b3a6;
      expv[26] = 32'h0000b3a6;
      expv[27] = 32'h216433a6;
      expv[28] = 32'h216433a6;
      expv[29] = 32'h216433a6;
      expv[30] = 32'h21658018;
      expv[31] = 32'h2165801c;
      expv[32] = 32'h2165801c;
      expv[33] = 32'ha2d9801c;
      expv[34] = 32'ha2d9801c;
      expv[35] = 32'h41b8c01c;
      expv[36] = 32'he6e8c01c;
      expv[37] = 32'he6e91ded;
      expv[38] = 32'he6e91ded;
      expv[39] = 32'he6e91ded;
      expv[40] = 32'h84999ded;
      expv[41] = 32'h84999ded;
      expv[42] = 32'h84999ded;
      expv[43] = 32'h849a2a80;
      expv[44] = 32'h849a2a80;
      expv[45] = 32'h849a2a80;
      expv[46] = 32'h849a2a80;
      expv[47] = 32'h3b01aa80;
      expv[48] = 32'h94a86a80;
      expv[49] = 32'h94a86a80;
      expv[50] = 32'h94a86a80;
      expv[51] = 32'hefd82a80;
      expv[52] = 32'h8156aa80;
      expv[53] = 32'hb7d7ea80;
      expv[54] = 32'hb7d7ea80;
      expv[55] = 32'h69342a80;
      expv[56] = 32'h63ed6a80;
      expv[57] = 32'h63ed6a80;
      expv[58] = 32'h63ed6a80;
      expv[59] = 32'h63ed6a84;
      expv[60] = 32'h63ed6a84;
      expv[61] = 32'h63ed6a84;
      expv[62] = 32'h63ed6a84;
      expv[63] = 32'h63ed6a88;
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
