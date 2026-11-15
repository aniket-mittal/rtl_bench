// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08310 dut (
    .clk(clk),
    .note(in_vec[6:0]),
    .adder(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h30;
    stim[1] = 7'h6a;
    stim[2] = 7'h1f;
    stim[3] = 7'h7c;
    stim[4] = 7'h51;
    stim[5] = 7'h3e;
    stim[6] = 7'h79;
    stim[7] = 7'h1a;
    stim[8] = 7'h25;
    stim[9] = 7'h09;
    stim[10] = 7'h52;
    stim[11] = 7'h2b;
    stim[12] = 7'h2f;
    stim[13] = 7'h24;
    stim[14] = 7'h63;
    stim[15] = 7'h48;
    stim[16] = 7'h0e;
    stim[17] = 7'h13;
    stim[18] = 7'h7f;
    stim[19] = 7'h43;
    stim[20] = 7'h15;
    stim[21] = 7'h41;
    stim[22] = 7'h34;
    stim[23] = 7'h5a;
    stim[24] = 7'h4c;
    stim[25] = 7'h1f;
    stim[26] = 7'h55;
    stim[27] = 7'h1f;
    stim[28] = 7'h36;
    stim[29] = 7'h48;
    stim[30] = 7'h5a;
    stim[31] = 7'h6d;
    stim[32] = 7'h3b;
    stim[33] = 7'h7f;
    stim[34] = 7'h44;
    stim[35] = 7'h78;
    stim[36] = 7'h37;
    stim[37] = 7'h19;
    stim[38] = 7'h58;
    stim[39] = 7'h7a;
    stim[40] = 7'h3f;
    stim[41] = 7'h02;
    stim[42] = 7'h70;
    stim[43] = 7'h3e;
    stim[44] = 7'h74;
    stim[45] = 7'h67;
    stim[46] = 7'h1e;
    stim[47] = 7'h6c;
    stim[48] = 7'h09;
    stim[49] = 7'h2b;
    stim[50] = 7'h08;
    stim[51] = 7'h74;
    stim[52] = 7'h7a;
    stim[53] = 7'h63;
    stim[54] = 7'h28;
    stim[55] = 7'h51;
    stim[56] = 7'h11;
    stim[57] = 7'h50;
    stim[58] = 7'h26;
    stim[59] = 7'h2c;
    stim[60] = 7'h66;
    stim[61] = 7'h05;
    stim[62] = 7'h4d;
    stim[63] = 7'h44;
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
      expv[0] = 32'h0xxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'h0000057c;
      expv[3] = 32'h0009c6b3;
      expv[4] = 32'h00008388;
      expv[5] = 32'h0000374d;
      expv[6] = 32'h00093a3b;
      expv[7] = 32'h00000628;
      expv[8] = 32'h00000ba0;
      expv[9] = 32'h0000018a;
      expv[10] = 32'h00005d01;
      expv[11] = 32'h00001274;
      expv[12] = 32'h0000138d;
      expv[13] = 32'h00001071;
      expv[14] = 32'h000296e1;
      expv[15] = 32'h000057c9;
      expv[16] = 32'h00000343;
      expv[17] = 32'h000002be;
      expv[18] = 32'h0006289a;
      expv[19] = 32'h000041c4;
      expv[20] = 32'h0000041c;
      expv[21] = 32'h000041c4;
      expv[22] = 32'h000024e8;
      expv[23] = 32'h0000ea5d;
      expv[24] = 32'h00006e9a;
      expv[25] = 32'h000007c2;
      expv[26] = 32'h0000dd35;
      expv[27] = 32'h00000838;
      expv[28] = 32'h00001740;
      expv[29] = 32'h00008388;
      expv[30] = 32'h0000f84c;
      expv[31] = 32'h0002be4b;
      expv[32] = 32'h00001f09;
      expv[33] = 32'h0005d01d;
      expv[34] = 32'h000052dc;
      expv[35] = 32'h00083882;
      expv[36] = 32'h000022d6;
      expv[37] = 32'h0000057c;
      expv[38] = 32'h00010710;
      expv[39] = 32'h0005d01d;
      expv[40] = 32'h0000374d;
      expv[41] = 32'h0000018a;
      expv[42] = 32'h0003432d;
      expv[43] = 32'h00003144;
      expv[44] = 32'h000374d6;
      expv[45] = 32'h00018a26;
      expv[46] = 32'h000008b5;
      expv[47] = 32'h00041c41;
      expv[48] = 32'h000001f0;
      expv[49] = 32'h00000af9;
      expv[50] = 32'h0000024e;
      expv[51] = 32'h00041c41;
      expv[52] = 32'h0008b5a6;
      expv[53] = 32'h00022d69;
      expv[54] = 32'h00000c51;
      expv[55] = 32'h00006865;
      expv[56] = 32'h00000374;
      expv[57] = 32'h000093a3;
      expv[58] = 32'h00000ea5;
      expv[59] = 32'h0000116b;
      expv[60] = 32'h00018a26;
      expv[61] = 32'h0000022d;
      expv[62] = 32'h00007c26;
      expv[63] = 32'h00003a97;
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
