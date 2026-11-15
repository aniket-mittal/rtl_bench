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

  mg_02608 dut (
    .clk(clk),
    .en(in_vec[32:32]),
    .data_a(in_vec[31:16]),
    .data_b(in_vec[15:0]),
    .result(out_vec[32:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0bb27eac6;
    stim[1] = 33'h0ffee7358;
    stim[2] = 33'h0dd96a942;
    stim[3] = 33'h09d7ce083;
    stim[4] = 33'h1125c9732;
    stim[5] = 33'h066c39de4;
    stim[6] = 33'h0af2cd4eb;
    stim[7] = 33'h14c29a653;
    stim[8] = 33'h1255d55d5;
    stim[9] = 33'h1a393c2b6;
    stim[10] = 33'h041cf526f;
    stim[11] = 33'h129e3be8d;
    stim[12] = 33'h12659bae4;
    stim[13] = 33'h1906b3285;
    stim[14] = 33'h0a2a327dc;
    stim[15] = 33'h0133b8f18;
    stim[16] = 33'h1d1e7621c;
    stim[17] = 33'h0556389f1;
    stim[18] = 33'h1f0fc4ea0;
    stim[19] = 33'h1245902be;
    stim[20] = 33'h0e32a8bbe;
    stim[21] = 33'h0daaf25ac;
    stim[22] = 33'h03a0bc53b;
    stim[23] = 33'h084d0b20c;
    stim[24] = 33'h1d178471d;
    stim[25] = 33'h082a1ed54;
    stim[26] = 33'h02e11b612;
    stim[27] = 33'h1a6824748;
    stim[28] = 33'h07ada4998;
    stim[29] = 33'h0c4516c53;
    stim[30] = 33'h18fda3b08;
    stim[31] = 33'h1f6a12553;
    stim[32] = 33'h0793d4668;
    stim[33] = 33'h096da9299;
    stim[34] = 33'h1b9900b27;
    stim[35] = 33'h00624dada;
    stim[36] = 33'h1ad97a77a;
    stim[37] = 33'h180e6f55a;
    stim[38] = 33'h19135ce3a;
    stim[39] = 33'h1a2bac3aa;
    stim[40] = 33'h1ad28be1c;
    stim[41] = 33'h19eb28d5c;
    stim[42] = 33'h09dc7ba4d;
    stim[43] = 33'h1a919ca65;
    stim[44] = 33'h18aa39874;
    stim[45] = 33'h11320913a;
    stim[46] = 33'h1e953771e;
    stim[47] = 33'h1985059d1;
    stim[48] = 33'h1febe8d7e;
    stim[49] = 33'h18f99e832;
    stim[50] = 33'h05f36259c;
    stim[51] = 33'h0fef2c2db;
    stim[52] = 33'h0ad30ce00;
    stim[53] = 33'h0843676a6;
    stim[54] = 33'h16db83d6b;
    stim[55] = 33'h0d010606e;
    stim[56] = 33'h1034b724c;
    stim[57] = 33'h1ca53b3ac;
    stim[58] = 33'h1126f8ac1;
    stim[59] = 33'h16e0013da;
    stim[60] = 33'h196ffe427;
    stim[61] = 33'h086f43b18;
    stim[62] = 33'h0eee285d4;
    stim[63] = 33'h0514a0f29;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'hxxxxxxxxx;
      expv[2] = 33'hxxxxxxxxx;
      expv[3] = 33'hxxxxxxxxx;
      expv[4] = 33'hxxxxxxxxx;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h00004b990;
      expv[9] = 33'h0000e2cb0;
      expv[10] = 33'h0002112f0;
      expv[11] = 33'h0002112f0;
      expv[12] = 33'h0006cabf0;
      expv[13] = 33'h0006cabf0;
      expv[14] = 33'h0006cabf0;
      expv[15] = 33'h002c973f0;
      expv[16] = 33'h002c973f0;
      expv[17] = 33'h002c973f0;
      expv[18] = 33'h015afb3f0;
      expv[19] = 33'h015afb3f0;
      expv[20] = 33'h015afb3f0;
      expv[21] = 33'h015afb3f1;
      expv[22] = 33'h015afb3f1;
      expv[23] = 33'h015afb3f1;
      expv[24] = 33'h015afb3f0;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h0000471d0;
      expv[30] = 33'h0000d5570;
      expv[31] = 33'h0001f1cb0;
      expv[32] = 33'h00042ab30;
      expv[33] = 33'h00042ab30;
      expv[34] = 33'h000d0e530;
      expv[35] = 33'h000d0e530;
      expv[36] = 33'h000d0e530;
      expv[37] = 33'h000d0e530;
      expv[38] = 33'h009b48530;
      expv[39] = 33'h009b48530;
      expv[40] = 33'h02d430530;
      expv[41] = 33'h074600530;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000023570;
      expv[45] = 33'h000023570;
      expv[46] = 33'h000023570;
      expv[47] = 33'h00013e0f0;
      expv[48] = 33'h0003737f0;
      expv[49] = 33'h0003737f0;
      expv[50] = 33'h000c493f0;
      expv[51] = 33'h000c493f0;
      expv[52] = 33'h002fa03f0;
      expv[53] = 33'h00764e3f0;
      expv[54] = 33'h0103aa3f0;
      expv[55] = 33'h021e623f0;
      expv[56] = 33'h021e623f0;
      expv[57] = 33'h021e623f0;
      expv[58] = 33'h0af4223f0;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000011582;
      expv[61] = 33'h000034086;
      expv[62] = 33'h00007968e;
      expv[63] = 33'h00010429e;
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
