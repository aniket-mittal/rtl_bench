// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .sel(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0e09e;
    stim[1] = 17'h1008c;
    stim[2] = 17'h1489f;
    stim[3] = 17'h133a8;
    stim[4] = 17'h1ffa1;
    stim[5] = 17'h0b0f6;
    stim[6] = 17'h19928;
    stim[7] = 17'h01568;
    stim[8] = 17'h085b5;
    stim[9] = 17'h0c831;
    stim[10] = 17'h0bf10;
    stim[11] = 17'h042a9;
    stim[12] = 17'h03c1d;
    stim[13] = 17'h073c3;
    stim[14] = 17'h1e208;
    stim[15] = 17'h0a7f6;
    stim[16] = 17'h1c9a2;
    stim[17] = 17'h11a69;
    stim[18] = 17'h17b2c;
    stim[19] = 17'h10e29;
    stim[20] = 17'h05524;
    stim[21] = 17'h0ef5b;
    stim[22] = 17'h0d96c;
    stim[23] = 17'h1deb0;
    stim[24] = 17'h03a35;
    stim[25] = 17'h1eda9;
    stim[26] = 17'h07a57;
    stim[27] = 17'h18a88;
    stim[28] = 17'h0d403;
    stim[29] = 17'h0a7c7;
    stim[30] = 17'h0fef2;
    stim[31] = 17'h090d6;
    stim[32] = 17'h193a3;
    stim[33] = 17'h185a6;
    stim[34] = 17'h0bd99;
    stim[35] = 17'h03ef4;
    stim[36] = 17'h0cbe4;
    stim[37] = 17'h1235a;
    stim[38] = 17'h1bdbb;
    stim[39] = 17'h004d2;
    stim[40] = 17'h0926e;
    stim[41] = 17'h0e2ff;
    stim[42] = 17'h1450f;
    stim[43] = 17'h110ad;
    stim[44] = 17'h16ef2;
    stim[45] = 17'h0acdd;
    stim[46] = 17'h05dd7;
    stim[47] = 17'h1385b;
    stim[48] = 17'h0109c;
    stim[49] = 17'h1062c;
    stim[50] = 17'h064c2;
    stim[51] = 17'h1e543;
    stim[52] = 17'h0120d;
    stim[53] = 17'h05645;
    stim[54] = 17'h15220;
    stim[55] = 17'h1897d;
    stim[56] = 17'h07c09;
    stim[57] = 17'h1c52b;
    stim[58] = 17'h0bec0;
    stim[59] = 17'h175b8;
    stim[60] = 17'h0d6ce;
    stim[61] = 17'h1393e;
    stim[62] = 17'h030ce;
    stim[63] = 17'h15136;
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
      expv[0] = 8'h9e;
      expv[1] = 8'h00;
      expv[2] = 8'h12;
      expv[3] = 8'hcc;
      expv[4] = 8'hff;
      expv[5] = 8'hf6;
      expv[6] = 8'h99;
      expv[7] = 8'h68;
      expv[8] = 8'hb5;
      expv[9] = 8'h31;
      expv[10] = 8'h10;
      expv[11] = 8'ha9;
      expv[12] = 8'h1d;
      expv[13] = 8'hc3;
      expv[14] = 8'h47;
      expv[15] = 8'hf6;
      expv[16] = 8'h93;
      expv[17] = 8'h58;
      expv[18] = 8'hde;
      expv[19] = 8'h70;
      expv[20] = 8'h24;
      expv[21] = 8'h5b;
      expv[22] = 8'h6c;
      expv[23] = 8'h7b;
      expv[24] = 8'h35;
      expv[25] = 8'hb7;
      expv[26] = 8'h57;
      expv[27] = 8'h51;
      expv[28] = 8'h03;
      expv[29] = 8'hc7;
      expv[30] = 8'hf2;
      expv[31] = 8'hd6;
      expv[32] = 8'hc9;
      expv[33] = 8'ha1;
      expv[34] = 8'h99;
      expv[35] = 8'hf4;
      expv[36] = 8'he4;
      expv[37] = 8'hc4;
      expv[38] = 8'hbd;
      expv[39] = 8'hd2;
      expv[40] = 8'h6e;
      expv[41] = 8'hff;
      expv[42] = 8'ha2;
      expv[43] = 8'h08;
      expv[44] = 8'h76;
      expv[45] = 8'hdd;
      expv[46] = 8'hd7;
      expv[47] = 8'h1c;
      expv[48] = 8'h9c;
      expv[49] = 8'h60;
      expv[50] = 8'hc2;
      expv[51] = 8'ha7;
      expv[52] = 8'h0d;
      expv[53] = 8'h45;
      expv[54] = 8'h4a;
      expv[55] = 8'h91;
      expv[56] = 8'h09;
      expv[57] = 8'ha3;
      expv[58] = 8'hc0;
      expv[59] = 8'hae;
      expv[60] = 8'hce;
      expv[61] = 8'h9c;
      expv[62] = 8'hce;
      expv[63] = 8'h8a;
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
