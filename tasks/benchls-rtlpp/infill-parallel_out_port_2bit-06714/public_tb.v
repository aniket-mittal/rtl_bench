// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06714 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[33:32]),
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
    stim[0] = 37'h1115837461;
    stim[1] = 37'h1d5b6ffe4f;
    stim[2] = 37'h1f9ea8111b;
    stim[3] = 37'h0a08a6d568;
    stim[4] = 37'h1ebc70e1f1;
    stim[5] = 37'h03edb952a6;
    stim[6] = 37'h179c3a21d6;
    stim[7] = 37'h0ac6062569;
    stim[8] = 37'h132ccf60bb;
    stim[9] = 37'h128928a8f6;
    stim[10] = 37'h0af17b93fa;
    stim[11] = 37'h0f0dc1644b;
    stim[12] = 37'h1fd7781159;
    stim[13] = 37'h02629c9e0c;
    stim[14] = 37'h1ae3519f65;
    stim[15] = 37'h1baec6f77a;
    stim[16] = 37'h1ab87a01cf;
    stim[17] = 37'h0e70222c7a;
    stim[18] = 37'h1e00753044;
    stim[19] = 37'h1e20bbe516;
    stim[20] = 37'h0ee28cfd9a;
    stim[21] = 37'h1b867bf9bf;
    stim[22] = 37'h1fdc8b87d2;
    stim[23] = 37'h1a987c115e;
    stim[24] = 37'h13e13b60e6;
    stim[25] = 37'h1b530f18f9;
    stim[26] = 37'h1ad844c72c;
    stim[27] = 37'h03e60403d0;
    stim[28] = 37'h030f090b0d;
    stim[29] = 37'h1a3f74e643;
    stim[30] = 37'h1ad3569ee2;
    stim[31] = 37'h0688f1e7e4;
    stim[32] = 37'h0a0baac29c;
    stim[33] = 37'h1611d9e093;
    stim[34] = 37'h0f76866d2f;
    stim[35] = 37'h1eb92ee4ed;
    stim[36] = 37'h06abd15dc1;
    stim[37] = 37'h037d74a8f4;
    stim[38] = 37'h1a00e02395;
    stim[39] = 37'h1e3b2dfa2a;
    stim[40] = 37'h1f48e8d001;
    stim[41] = 37'h1a50d33568;
    stim[42] = 37'h1a6c486cc2;
    stim[43] = 37'h1b002c7b66;
    stim[44] = 37'h175d3207dd;
    stim[45] = 37'h1bcd44a0b1;
    stim[46] = 37'h12b0dfb88c;
    stim[47] = 37'h0aca761801;
    stim[48] = 37'h0ef3725259;
    stim[49] = 37'h0b69d49df5;
    stim[50] = 37'h17e5b00b2a;
    stim[51] = 37'h0a28e52368;
    stim[52] = 37'h0e163c962c;
    stim[53] = 37'h1b67d8357d;
    stim[54] = 37'h036a97314b;
    stim[55] = 37'h126563f433;
    stim[56] = 37'h0eabd172c4;
    stim[57] = 37'h0b0b3f3bad;
    stim[58] = 37'h062b701311;
    stim[59] = 37'h1addccadf8;
    stim[60] = 37'h1bd00def16;
    stim[61] = 37'h0a491f0917;
    stim[62] = 37'h02e2846920;
    stim[63] = 37'h0a672dec18;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h000000000;
      expv[6] = 34'h000000000;
      expv[7] = 34'h000000000;
      expv[8] = 34'h000000000;
      expv[9] = 34'h000000000;
      expv[10] = 34'h000000000;
      expv[11] = 34'h000000000;
      expv[12] = 34'h000000000;
      expv[13] = 34'h000000000;
      expv[14] = 34'h000000000;
      expv[15] = 34'h000000000;
      expv[16] = 34'h000000000;
      expv[17] = 34'h000000000;
      expv[18] = 34'h000000000;
      expv[19] = 34'h000000000;
      expv[20] = 34'h000000000;
      expv[21] = 34'h000000000;
      expv[22] = 34'h000000000;
      expv[23] = 34'h000000000;
      expv[24] = 34'h000000000;
      expv[25] = 34'h000000000;
      expv[26] = 34'h000000000;
      expv[27] = 34'h000000000;
      expv[28] = 34'h000000000;
      expv[29] = 34'h000000000;
      expv[30] = 34'h000000000;
      expv[31] = 34'h000000000;
      expv[32] = 34'h000000000;
      expv[33] = 34'h000000000;
      expv[34] = 34'h000000000;
      expv[35] = 34'h000000000;
      expv[36] = 34'h000000000;
      expv[37] = 34'h100000001;
      expv[38] = 34'h100000001;
      expv[39] = 34'h100000001;
      expv[40] = 34'h100000001;
      expv[41] = 34'h100000001;
      expv[42] = 34'h100000001;
      expv[43] = 34'h100000001;
      expv[44] = 34'h100000001;
      expv[45] = 34'h100000001;
      expv[46] = 34'h100000001;
      expv[47] = 34'h100000001;
      expv[48] = 34'h100000001;
      expv[49] = 34'h100000001;
      expv[50] = 34'h100000001;
      expv[51] = 34'h100000001;
      expv[52] = 34'h100000001;
      expv[53] = 34'h100000001;
      expv[54] = 34'h100000001;
      expv[55] = 34'h100000001;
      expv[56] = 34'h100000001;
      expv[57] = 34'h100000001;
      expv[58] = 34'h100000001;
      expv[59] = 34'h100000001;
      expv[60] = 34'h100000001;
      expv[61] = 34'h100000001;
      expv[62] = 34'h100000001;
      expv[63] = 34'h100000001;
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
