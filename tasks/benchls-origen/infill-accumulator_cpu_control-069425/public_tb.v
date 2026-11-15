// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_069425 dut (
    .clk(clk),
    .reset(in_vec[11:11]),
    .start(in_vec[10:10]),
    .instr(in_vec[9:2]),
    .zero(in_vec[1:1]),
    .pos(in_vec[0:0]),
    .PCSrc(out_vec[11:11]),
    .PCWrite(out_vec[10:10]),
    .IorD(out_vec[9:9]),
    .MemWrite(out_vec[8:8]),
    .IRWrite(out_vec[7:7]),
    .OutWrite(out_vec[6:6]),
    .AccSrc(out_vec[5:4]),
    .ALUControl(out_vec[3:1]),
    .AccWrite(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'he9e;
    stim[1] = 12'hef4;
    stim[2] = 12'h60b;
    stim[3] = 12'h270;
    stim[4] = 12'h627;
    stim[5] = 12'h32e;
    stim[6] = 12'h43a;
    stim[7] = 12'h15f;
    stim[8] = 12'h462;
    stim[9] = 12'h6e1;
    stim[10] = 12'h318;
    stim[11] = 12'h009;
    stim[12] = 12'h70a;
    stim[13] = 12'h216;
    stim[14] = 12'h7d2;
    stim[15] = 12'h33e;
    stim[16] = 12'h026;
    stim[17] = 12'h30c;
    stim[18] = 12'h5ef;
    stim[19] = 12'h476;
    stim[20] = 12'h5e6;
    stim[21] = 12'h690;
    stim[22] = 12'h19d;
    stim[23] = 12'h5a8;
    stim[24] = 12'h0b7;
    stim[25] = 12'h311;
    stim[26] = 12'h4df;
    stim[27] = 12'h3be;
    stim[28] = 12'h48f;
    stim[29] = 12'h2a9;
    stim[30] = 12'h665;
    stim[31] = 12'h6bd;
    stim[32] = 12'h271;
    stim[33] = 12'h693;
    stim[34] = 12'h744;
    stim[35] = 12'h32e;
    stim[36] = 12'h47f;
    stim[37] = 12'hf25;
    stim[38] = 12'h163;
    stim[39] = 12'h608;
    stim[40] = 12'h31e;
    stim[41] = 12'h47d;
    stim[42] = 12'h0fc;
    stim[43] = 12'h1f3;
    stim[44] = 12'h454;
    stim[45] = 12'h45f;
    stim[46] = 12'h2d0;
    stim[47] = 12'h4fe;
    stim[48] = 12'h456;
    stim[49] = 12'h6c2;
    stim[50] = 12'h6b4;
    stim[51] = 12'h18e;
    stim[52] = 12'h2c0;
    stim[53] = 12'h548;
    stim[54] = 12'h7ce;
    stim[55] = 12'h6dd;
    stim[56] = 12'h66a;
    stim[57] = 12'h47f;
    stim[58] = 12'h455;
    stim[59] = 12'h702;
    stim[60] = 12'h7cf;
    stim[61] = 12'hccd;
    stim[62] = 12'h0ea;
    stim[63] = 12'h625;
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
      expv[0] = 12'h480;
      expv[1] = 12'h480;
      expv[2] = 12'h480;
      expv[3] = 12'h000;
      expv[4] = 12'h025;
      expv[5] = 12'h000;
      expv[6] = 12'h480;
      expv[7] = 12'h000;
      expv[8] = 12'h021;
      expv[9] = 12'h480;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h000;
      expv[13] = 12'h000;
      expv[14] = 12'h000;
      expv[15] = 12'h000;
      expv[16] = 12'h000;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h000;
      expv[21] = 12'h000;
      expv[22] = 12'h000;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h000;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h000;
      expv[30] = 12'h000;
      expv[31] = 12'h000;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h480;
      expv[38] = 12'h000;
      expv[39] = 12'h480;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h000;
      expv[45] = 12'h000;
      expv[46] = 12'h000;
      expv[47] = 12'h000;
      expv[48] = 12'h000;
      expv[49] = 12'h000;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h000;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h000;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h000;
      expv[59] = 12'h000;
      expv[60] = 12'h000;
      expv[61] = 12'h480;
      expv[62] = 12'h000;
      expv[63] = 12'h480;
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
