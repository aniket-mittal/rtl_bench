// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09808 dut (
    .clk(clk),
    .op(in_vec[23:20]),
    .right(in_vec[19:19]),
    .AI(in_vec[18:11]),
    .BI(in_vec[10:3]),
    .CI(in_vec[2:2]),
    .BCD(in_vec[1:1]),
    .RDY(in_vec[0:0]),
    .CO(out_vec[12:12]),
    .OUT(out_vec[11:4]),
    .V(out_vec[3:3]),
    .Z(out_vec[2:2]),
    .N(out_vec[1:1]),
    .HC(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h75c0f6;
    stim[1] = 24'ha8a616;
    stim[2] = 24'hb09bc8;
    stim[3] = 24'hc54fa6;
    stim[4] = 24'hf8fded;
    stim[5] = 24'h051840;
    stim[6] = 24'h21307c;
    stim[7] = 24'hc1332c;
    stim[8] = 24'h3a3ba4;
    stim[9] = 24'h8405c4;
    stim[10] = 24'h1c1b62;
    stim[11] = 24'h344789;
    stim[12] = 24'hbd6a67;
    stim[13] = 24'h251bb4;
    stim[14] = 24'ha07f46;
    stim[15] = 24'h1f94ee;
    stim[16] = 24'h0c9429;
    stim[17] = 24'hf4612d;
    stim[18] = 24'hc0b5a2;
    stim[19] = 24'h0783ac;
    stim[20] = 24'h100d38;
    stim[21] = 24'ha1c193;
    stim[22] = 24'h8a8aca;
    stim[23] = 24'h9b8fd4;
    stim[24] = 24'hcb7241;
    stim[25] = 24'h214877;
    stim[26] = 24'h8bb8fe;
    stim[27] = 24'h5f572d;
    stim[28] = 24'h4b5d95;
    stim[29] = 24'h54ab9a;
    stim[30] = 24'h5b5e22;
    stim[31] = 24'h7cabd7;
    stim[32] = 24'h6838b7;
    stim[33] = 24'habcc2d;
    stim[34] = 24'hbdfe91;
    stim[35] = 24'h4da8a7;
    stim[36] = 24'h89ebee;
    stim[37] = 24'h31cdbd;
    stim[38] = 24'h24a8f6;
    stim[39] = 24'h754fec;
    stim[40] = 24'h4d0d32;
    stim[41] = 24'hc98f21;
    stim[42] = 24'hc074c4;
    stim[43] = 24'h7dcdc3;
    stim[44] = 24'h7c5371;
    stim[45] = 24'h1f7780;
    stim[46] = 24'hbdb8b7;
    stim[47] = 24'hf7b6f7;
    stim[48] = 24'hc3b3fe;
    stim[49] = 24'hba8d79;
    stim[50] = 24'h1bc880;
    stim[51] = 24'hcf7a84;
    stim[52] = 24'h024399;
    stim[53] = 24'h5991d8;
    stim[54] = 24'h410059;
    stim[55] = 24'h89eb4a;
    stim[56] = 24'hcd510f;
    stim[57] = 24'h57363f;
    stim[58] = 24'h3b7118;
    stim[59] = 24'hc7d3bf;
    stim[60] = 24'ha27682;
    stim[61] = 24'hbaaaae;
    stim[62] = 24'h71e9cb;
    stim[63] = 24'hfde437;
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
      expv[0] = 13'hxxxx;
      expv[1] = 13'hxxxx;
      expv[2] = 13'hxxxx;
      expv[3] = 13'hxxxx;
      expv[4] = 13'hxxxx;
      expv[5] = 13'h18f2;
      expv[6] = 13'h18f2;
      expv[7] = 13'h18f2;
      expv[8] = 13'h18f2;
      expv[9] = 13'h18f2;
      expv[10] = 13'h18f2;
      expv[11] = 13'h18f2;
      expv[12] = 13'h1798;
      expv[13] = 13'h1bc3;
      expv[14] = 13'h1bc3;
      expv[15] = 13'h1bc3;
      expv[16] = 13'h1bc3;
      expv[17] = 13'h0cea;
      expv[18] = 13'h08c2;
      expv[19] = 13'h08c2;
      expv[20] = 13'h08c2;
      expv[21] = 13'h08c2;
      expv[22] = 13'h0141;
      expv[23] = 13'h0141;
      expv[24] = 13'h0141;
      expv[25] = 13'h0370;
      expv[26] = 13'h0361;
      expv[27] = 13'h0361;
      expv[28] = 13'h10f0;
      expv[29] = 13'h0021;
      expv[30] = 13'h0021;
      expv[31] = 13'h0021;
      expv[32] = 13'h05f1;
      expv[33] = 13'h07c9;
      expv[34] = 13'h0789;
      expv[35] = 13'h1beb;
      expv[36] = 13'h1c53;
      expv[37] = 13'h1c53;
      expv[38] = 13'h0f13;
      expv[39] = 13'h0f13;
      expv[40] = 13'h0f13;
      expv[41] = 13'h0f13;
      expv[42] = 13'h1188;
      expv[43] = 13'h1188;
      expv[44] = 13'h1a3b;
      expv[45] = 13'h0d6a;
      expv[46] = 13'h0d6a;
      expv[47] = 13'h1b63;
      expv[48] = 13'h1f6a;
      expv[49] = 13'h1f6a;
      expv[50] = 13'h1509;
      expv[51] = 13'h1509;
      expv[52] = 13'h1509;
      expv[53] = 13'h0eea;
      expv[54] = 13'h0eea;
      expv[55] = 13'h11f0;
      expv[56] = 13'h11f0;
      expv[57] = 13'h1d5a;
      expv[58] = 13'h10f1;
      expv[59] = 13'h10f1;
      expv[60] = 13'h10f1;
      expv[61] = 13'h10f1;
      expv[62] = 13'h10f1;
      expv[63] = 13'h1031;
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
