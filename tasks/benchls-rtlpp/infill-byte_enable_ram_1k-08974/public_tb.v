// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08974 dut (
    .clk(clk),
    .address(in_vec[48:39]),
    .byteenable(in_vec[38:35]),
    .chipselect(in_vec[34:34]),
    .clken(in_vec[33:33]),
    .write(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h02154d74d2d6a;
    stim[1] = 49'h1c3f7a0fedc4f;
    stim[2] = 49'h0c9dc8619a12b;
    stim[3] = 49'h06570c1373037;
    stim[4] = 49'h1c3b13775b15e;
    stim[5] = 49'h08c1f0e9bcb99;
    stim[6] = 49'h0c9ec3f330e15;
    stim[7] = 49'h0f54d79ee526d;
    stim[8] = 49'h0a50fb6940201;
    stim[9] = 49'h0047680bebf88;
    stim[10] = 49'h0364e98e11af4;
    stim[11] = 49'h19b6800712aef;
    stim[12] = 49'h1277e2b78a5f5;
    stim[13] = 49'h1f378c7e8cbd2;
    stim[14] = 49'h04d7184986d22;
    stim[15] = 49'h1716771ab96e6;
    stim[16] = 49'h0e4ccb5c2afdc;
    stim[17] = 49'h1cee76ab9187e;
    stim[18] = 49'h1f8c71d2001f8;
    stim[19] = 49'h01a1c5ecf4f2e;
    stim[20] = 49'h012191de18daf;
    stim[21] = 49'h0f0c734dcffd7;
    stim[22] = 49'h1fc05f37b319c;
    stim[23] = 49'h00d0402503b69;
    stim[24] = 49'h09a623abeb5ec;
    stim[25] = 49'h0f775a78cfe31;
    stim[26] = 49'h0f510740dba58;
    stim[27] = 49'h079dc64c16897;
    stim[28] = 49'h0cffddda0e0e5;
    stim[29] = 49'h1ef8c3db9afb0;
    stim[30] = 49'h0b42d827b655e;
    stim[31] = 49'h19868ceb499e6;
    stim[32] = 49'h0f0ddcc6c56d2;
    stim[33] = 49'h11c600c7dc8b9;
    stim[34] = 49'h003849baeda1f;
    stim[35] = 49'h1057155b89f0f;
    stim[36] = 49'h0ff3ac50e9bba;
    stim[37] = 49'h1b63de18f165f;
    stim[38] = 49'h1b1f4903bcc04;
    stim[39] = 49'h123a772029df2;
    stim[40] = 49'h0dc5fa4a2e3df;
    stim[41] = 49'h1c3931aac1244;
    stim[42] = 49'h152f0e4a6895a;
    stim[43] = 49'h1f648451e835b;
    stim[44] = 49'h003156e919ba7;
    stim[45] = 49'h1c48adb0fc841;
    stim[46] = 49'h1a023d15a042e;
    stim[47] = 49'h11578831ea168;
    stim[48] = 49'h1b6443760a1e6;
    stim[49] = 49'h1bf9f659c4422;
    stim[50] = 49'h006901b3f76a2;
    stim[51] = 49'h108e542085d4c;
    stim[52] = 49'h07d1e0931b254;
    stim[53] = 49'h199d0f9fcf917;
    stim[54] = 49'h047081c491e23;
    stim[55] = 49'h0fecf7105fb4b;
    stim[56] = 49'h152b95133c8c5;
    stim[57] = 49'h1022f0b8bf54a;
    stim[58] = 49'h1e4074c190e7b;
    stim[59] = 49'h1a2fc06d41746;
    stim[60] = 49'h1c23df2d1a0fe;
    stim[61] = 49'h0fa441cf4bdf6;
    stim[62] = 49'h0e2412f729203;
    stim[63] = 49'h14f8174b13bb9;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'ha0fedcxx;
      expv[43] = 32'ha0fedcxx;
      expv[44] = 32'ha0fedcxx;
      expv[45] = 32'ha0fedcxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'hxxxxxxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
