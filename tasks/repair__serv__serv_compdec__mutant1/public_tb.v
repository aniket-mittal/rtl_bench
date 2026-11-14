// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .i_clk(clk),
    .i_instr(in_vec[32:1]),
    .i_ack(in_vec[0:0]),
    .o_instr(out_vec[32:1]),
    .o_iscomp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h09618701e;
    stim[1] = 33'h1db88ee02;
    stim[2] = 33'h19812c6de;
    stim[3] = 33'h0680b6877;
    stim[4] = 33'h1d2dbdf2c;
    stim[5] = 33'h15e016084;
    stim[6] = 33'h0726abec7;
    stim[7] = 33'h070a0b5ca;
    stim[8] = 33'h1bb5887e3;
    stim[9] = 33'h17a6cffba;
    stim[10] = 33'h1ddc388c1;
    stim[11] = 33'h17945278a;
    stim[12] = 33'h047a4e0e9;
    stim[13] = 33'h16fda3c33;
    stim[14] = 33'h0974ba071;
    stim[15] = 33'h0ca72cf63;
    stim[16] = 33'h1648ae975;
    stim[17] = 33'h00d8646e3;
    stim[18] = 33'h0aa352ccd;
    stim[19] = 33'h0bc0968e4;
    stim[20] = 33'h078f9b959;
    stim[21] = 33'h0dbfebce1;
    stim[22] = 33'h0d19c1b2d;
    stim[23] = 33'h144884be4;
    stim[24] = 33'h1ff6b7077;
    stim[25] = 33'h111cca3ed;
    stim[26] = 33'h02503437b;
    stim[27] = 33'h04d418d13;
    stim[28] = 33'h0ecba45b8;
    stim[29] = 33'h138b81cec;
    stim[30] = 33'h00cc73104;
    stim[31] = 33'h1cf3df6e6;
    stim[32] = 33'h1e4d28c83;
    stim[33] = 33'h0e255b50f;
    stim[34] = 33'h0d557f930;
    stim[35] = 33'h1d4004de3;
    stim[36] = 33'h19913c69c;
    stim[37] = 33'h0d2ab534c;
    stim[38] = 33'h123a1033b;
    stim[39] = 33'h0132ccae0;
    stim[40] = 33'h01cbf34e0;
    stim[41] = 33'h0cdd65d68;
    stim[42] = 33'h0825182f6;
    stim[43] = 33'h186296ac7;
    stim[44] = 33'h01f91f00f;
    stim[45] = 33'h0943bf5dc;
    stim[46] = 33'h043060d24;
    stim[47] = 33'h197dbefb5;
    stim[48] = 33'h0f583285f;
    stim[49] = 33'h05b7f182e;
    stim[50] = 33'h1e7bd728d;
    stim[51] = 33'h1e0b45166;
    stim[52] = 33'h19173bd64;
    stim[53] = 33'h0ab34766e;
    stim[54] = 33'h03836c619;
    stim[55] = 33'h1ac695aba;
    stim[56] = 33'h0394854e0;
    stim[57] = 33'h0283f308b;
    stim[58] = 33'h059f6a9c7;
    stim[59] = 33'h1baf0eb42;
    stim[60] = 33'h0851e8a07;
    stim[61] = 33'h0a525b8e1;
    stim[62] = 33'h06f7fd6ea;
    stim[63] = 33'h0f8a66159;
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
      expv[0] = 33'h09618701x;
      expv[1] = 33'h1fffc0e6x;
      expv[2] = 33'h19812c6dx;
      expv[3] = 33'h0680b687x;
      expv[4] = 33'h018a25c46;
      expv[5] = 33'h002000066;
      expv[6] = 33'h0726abec6;
      expv[7] = 33'h1ff201526;
      expv[8] = 33'h003800726;
      expv[9] = 33'h1fffeff6f;
      expv[10] = 33'h009084c47;
      expv[11] = 33'h0022faf27;
      expv[12] = 33'h00c884d07;
      expv[13] = 33'h1fcdc1c27;
      expv[14] = 33'h00dc84047;
      expv[15] = 33'h000018f6f;
      expv[16] = 33'h015824907;
      expv[17] = 33'h0b18001df;
      expv[18] = 33'h0032c0c67;
      expv[19] = 33'h003880867;
      expv[20] = 33'h00d695847;
      expv[21] = 33'h00f8c4c07;
      expv[22] = 33'h000bb3b27;
      expv[23] = 33'h0038b2b27;
      expv[24] = 33'h1ff6b7077;
      expv[25] = 33'h00f824306;
      expv[26] = 33'h08dc000df;
      expv[27] = 33'h0000d0ac7;
      expv[28] = 33'h028810f27;
      expv[29] = 33'h003bc3c27;
      expv[30] = 33'h0001101cf;
      expv[31] = 33'h1cf3df6e7;
      expv[32] = 33'h002000c27;
      expv[33] = 33'h0e255b50f;
      expv[34] = 33'h005c95846;
      expv[35] = 33'h0798001de;
      expv[36] = 33'h012624447;
      expv[37] = 33'h001201367;
      expv[38] = 33'h000ebab27;
      expv[39] = 33'h0098a4c07;
      expv[40] = 33'h01cbf34e1;
      expv[41] = 33'h06b010d27;
      expv[42] = 33'h0825182f7;
      expv[43] = 33'h186296ac7;
      expv[44] = 33'h01f91f00e;
      expv[45] = 33'h00f625446;
      expv[46] = 33'h0008d2d26;
      expv[47] = 33'h01ec24c46;
      expv[48] = 33'h0f583285f;
      expv[49] = 33'h05b7f182e;
      expv[50] = 33'h002321266;
      expv[51] = 33'h1e0b45167;
      expv[52] = 33'h00d825c47;
      expv[53] = 33'h0ab34766f;
      expv[54] = 33'h0000e4b07;
      expv[55] = 33'h0d6c000df;
      expv[56] = 33'h023810c27;
      expv[57] = 33'h1fe28e827;
      expv[58] = 33'h059f6a9c7;
      expv[59] = 33'h1fffd0b6e;
      expv[60] = 33'h0851e8a06;
      expv[61] = 33'h00d885c46;
      expv[62] = 33'h01c0e34c7;
      expv[63] = 33'h00d010b27;
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
