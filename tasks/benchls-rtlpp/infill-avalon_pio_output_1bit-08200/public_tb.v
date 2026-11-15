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

  rtlpp_08200 dut (
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
    stim[0] = 37'h1c16e5794a;
    stim[1] = 37'h0ceeb7384f;
    stim[2] = 37'h0696c1f8fc;
    stim[3] = 37'h1e1be7b716;
    stim[4] = 37'h1f1d55f675;
    stim[5] = 37'h0311f31565;
    stim[6] = 37'h13e7c3954a;
    stim[7] = 37'h170f616293;
    stim[8] = 37'h1bc4038774;
    stim[9] = 37'h1e0d59c667;
    stim[10] = 37'h17d51b11a8;
    stim[11] = 37'h1fa0ae3575;
    stim[12] = 37'h0e10e1e225;
    stim[13] = 37'h07fd0752ee;
    stim[14] = 37'h0ebd5f7ccd;
    stim[15] = 37'h128004fa87;
    stim[16] = 37'h1fb623f9a6;
    stim[17] = 37'h17fd252697;
    stim[18] = 37'h13fc933b8e;
    stim[19] = 37'h16f7757d7a;
    stim[20] = 37'h1a715ecce2;
    stim[21] = 37'h0e6c99d0d2;
    stim[22] = 37'h0e2e9024c8;
    stim[23] = 37'h03539cb5a2;
    stim[24] = 37'h0b69637055;
    stim[25] = 37'h1e13fafc7e;
    stim[26] = 37'h029a1a5348;
    stim[27] = 37'h0f4ef6cf8b;
    stim[28] = 37'h0ef4cbf22d;
    stim[29] = 37'h165fd47807;
    stim[30] = 37'h074d95b08a;
    stim[31] = 37'h07743ee38d;
    stim[32] = 37'h1b7a2b1c42;
    stim[33] = 37'h1be9b9e794;
    stim[34] = 37'h1a341132f6;
    stim[35] = 37'h1bfc308c51;
    stim[36] = 37'h0e1c985deb;
    stim[37] = 37'h165b232ef2;
    stim[38] = 37'h1b36a3da3c;
    stim[39] = 37'h1ee60d8d31;
    stim[40] = 37'h1ed1fce18b;
    stim[41] = 37'h0ba7210692;
    stim[42] = 37'h1e7d656063;
    stim[43] = 37'h1abaf99355;
    stim[44] = 37'h16ef8981f4;
    stim[45] = 37'h036da917c2;
    stim[46] = 37'h03460663dd;
    stim[47] = 37'h0602d29c34;
    stim[48] = 37'h0f30bbeae2;
    stim[49] = 37'h0ea680509c;
    stim[50] = 37'h1a63ce9d14;
    stim[51] = 37'h0a82b11e50;
    stim[52] = 37'h02b50148a9;
    stim[53] = 37'h0792e7560c;
    stim[54] = 37'h16483937ab;
    stim[55] = 37'h03de301d96;
    stim[56] = 37'h179f993ce8;
    stim[57] = 37'h1acfd4128f;
    stim[58] = 37'h1e18547e87;
    stim[59] = 37'h0ef630831e;
    stim[60] = 37'h0abc1b1265;
    stim[61] = 37'h1fac6f690b;
    stim[62] = 37'h033f13059e;
    stim[63] = 37'h1a115d52d8;
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
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
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
