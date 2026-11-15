// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01345 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[32:32]),
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
    stim[0] = 37'h084e4840a3;
    stim[1] = 37'h1d2a7ebe61;
    stim[2] = 37'h0fc956d8e9;
    stim[3] = 37'h0b8df9d702;
    stim[4] = 37'h0b0928e15f;
    stim[5] = 37'h06b0c712a5;
    stim[6] = 37'h1acee686d0;
    stim[7] = 37'h17cb5b9fc3;
    stim[8] = 37'h1a185a848a;
    stim[9] = 37'h0fae2f776f;
    stim[10] = 37'h17cf9d5e5b;
    stim[11] = 37'h1ede4d3fd6;
    stim[12] = 37'h0399c3d719;
    stim[13] = 37'h16b1f423fa;
    stim[14] = 37'h07834b3739;
    stim[15] = 37'h177ca73765;
    stim[16] = 37'h1c5634fee8;
    stim[17] = 37'h1ea117ef80;
    stim[18] = 37'h0fdb3629bc;
    stim[19] = 37'h16fef03246;
    stim[20] = 37'h0be4d60416;
    stim[21] = 37'h031fc8cf45;
    stim[22] = 37'h0ef9b6a08b;
    stim[23] = 37'h1f0da8ed32;
    stim[24] = 37'h0f3975a1ea;
    stim[25] = 37'h1e30cab099;
    stim[26] = 37'h1b6b9445ec;
    stim[27] = 37'h1acbef2618;
    stim[28] = 37'h073faeeadc;
    stim[29] = 37'h1a809bc2fc;
    stim[30] = 37'h0740143637;
    stim[31] = 37'h1687750587;
    stim[32] = 37'h1af0fe3680;
    stim[33] = 37'h0bf96ffb68;
    stim[34] = 37'h03c9569807;
    stim[35] = 37'h0fd11050bb;
    stim[36] = 37'h02f1f840cc;
    stim[37] = 37'h13436aa192;
    stim[38] = 37'h0374e01a97;
    stim[39] = 37'h168d35ad1c;
    stim[40] = 37'h035f2d4a9c;
    stim[41] = 37'h075736009b;
    stim[42] = 37'h0a68f45735;
    stim[43] = 37'h07313995b8;
    stim[44] = 37'h1dc323d844;
    stim[45] = 37'h07f2d0c6ef;
    stim[46] = 37'h0678ce444e;
    stim[47] = 37'h1f370817ab;
    stim[48] = 37'h0abd267093;
    stim[49] = 37'h1ec5e7604f;
    stim[50] = 37'h1719cc665c;
    stim[51] = 37'h1a5506639b;
    stim[52] = 37'h1bd4608586;
    stim[53] = 37'h1e3c7f4623;
    stim[54] = 37'h0ff4aa1463;
    stim[55] = 37'h1f3bad9b30;
    stim[56] = 37'h07c7221928;
    stim[57] = 37'h0a0a5f94e3;
    stim[58] = 37'h1f6c64664c;
    stim[59] = 37'h16d4c79193;
    stim[60] = 37'h1a3e4e8d73;
    stim[61] = 37'h0e6299f0e8;
    stim[62] = 37'h1fee33a908;
    stim[63] = 37'h07a4cabb87;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h100000000;
      expv[7] = 33'h100000000;
      expv[8] = 33'h100000000;
      expv[9] = 33'h100000000;
      expv[10] = 33'h100000000;
      expv[11] = 33'h100000000;
      expv[12] = 33'h100000001;
      expv[13] = 33'h100000000;
      expv[14] = 33'h100000001;
      expv[15] = 33'h100000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
