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

  origen_153358 dut (
    .clk(clk),
    .s0(in_vec[31:28]),
    .s1(in_vec[27:23]),
    .s2(in_vec[22:17]),
    .s3(in_vec[16:11]),
    .random_no(in_vec[10:5]),
    .enable(in_vec[4:4]),
    .r0(in_vec[3:3]),
    .r1(in_vec[2:2]),
    .r2(in_vec[1:1]),
    .r3(in_vec[0:0]),
    .gr0(out_vec[3:3]),
    .gr1(out_vec[2:2]),
    .gr2(out_vec[1:1]),
    .gr3(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h647348cf;
    stim[1] = 32'h9ba11cf2;
    stim[2] = 32'h8f6c01c5;
    stim[3] = 32'he5cc8ad5;
    stim[4] = 32'hd19f6a10;
    stim[5] = 32'he046d38e;
    stim[6] = 32'hfc7756b8;
    stim[7] = 32'h45428371;
    stim[8] = 32'h28381b77;
    stim[9] = 32'hcce1de0c;
    stim[10] = 32'hcaa85e46;
    stim[11] = 32'h4ff4ffb2;
    stim[12] = 32'hc5c39430;
    stim[13] = 32'h5144f1ad;
    stim[14] = 32'hf3ab92f5;
    stim[15] = 32'he73c159a;
    stim[16] = 32'h43a7f587;
    stim[17] = 32'hdd64a98d;
    stim[18] = 32'hec135190;
    stim[19] = 32'ha4a06211;
    stim[20] = 32'h08b618d7;
    stim[21] = 32'hbce4a1b7;
    stim[22] = 32'h00114953;
    stim[23] = 32'hd45fc380;
    stim[24] = 32'h2fc410ef;
    stim[25] = 32'h71b5066b;
    stim[26] = 32'hdb3e6d08;
    stim[27] = 32'h7d24f03f;
    stim[28] = 32'h2ed74092;
    stim[29] = 32'h87c6980c;
    stim[30] = 32'h73d811a3;
    stim[31] = 32'hfd8da644;
    stim[32] = 32'h8a93d381;
    stim[33] = 32'h61cdc9a0;
    stim[34] = 32'hb4537aeb;
    stim[35] = 32'h67a8e4e3;
    stim[36] = 32'hec7191ba;
    stim[37] = 32'h819df833;
    stim[38] = 32'h7a9a5225;
    stim[39] = 32'h0d5666a9;
    stim[40] = 32'h4c4b0c8d;
    stim[41] = 32'h76e5e8a4;
    stim[42] = 32'h23a9fe66;
    stim[43] = 32'hfa788963;
    stim[44] = 32'he3978296;
    stim[45] = 32'ha3ed5564;
    stim[46] = 32'h9628c8b5;
    stim[47] = 32'hba63fc79;
    stim[48] = 32'h55ee7f96;
    stim[49] = 32'hc6d337ed;
    stim[50] = 32'h65104b4b;
    stim[51] = 32'h5e197cd4;
    stim[52] = 32'h47df3b7f;
    stim[53] = 32'h5871307d;
    stim[54] = 32'h993dd52c;
    stim[55] = 32'h991a5b64;
    stim[56] = 32'haa595bff;
    stim[57] = 32'h5cfea24c;
    stim[58] = 32'hc68856f5;
    stim[59] = 32'h3929b0a2;
    stim[60] = 32'h14b1a8c9;
    stim[61] = 32'h8d20ca1e;
    stim[62] = 32'h52a1d058;
    stim[63] = 32'hb256ba9a;
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
      expv[0] = 4'hx;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h2;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h1;
      expv[16] = 4'h1;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h4;
      expv[22] = 4'h4;
      expv[23] = 4'h1;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h8;
      expv[29] = 4'h8;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h8;
      expv[38] = 4'h8;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h2;
      expv[54] = 4'h8;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h2;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h4;
      expv[63] = 4'h8;
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
