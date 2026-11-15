// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059425 dut (
    .clk(clk),
    .rst_n(in_vec[18:18]),
    .write_req(in_vec[17:17]),
    .fifo_write_data(in_vec[16:1]),
    .read_req(in_vec[0:0]),
    .fifo_read_data(out_vec[20:5]),
    .left_sig(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h1e343;
    stim[1] = 19'h1076b;
    stim[2] = 19'h71fba;
    stim[3] = 19'h42b4c;
    stim[4] = 19'h738e8;
    stim[5] = 19'h58576;
    stim[6] = 19'h6c9a4;
    stim[7] = 19'h4c58d;
    stim[8] = 19'h5c798;
    stim[9] = 19'h75300;
    stim[10] = 19'h6e7fc;
    stim[11] = 19'h60261;
    stim[12] = 19'h54765;
    stim[13] = 19'h7d607;
    stim[14] = 19'h62e24;
    stim[15] = 19'h4f36a;
    stim[16] = 19'h4fb70;
    stim[17] = 19'h65861;
    stim[18] = 19'h5c6c0;
    stim[19] = 19'h6134a;
    stim[20] = 19'h58c69;
    stim[21] = 19'h41a1a;
    stim[22] = 19'h62496;
    stim[23] = 19'h4d462;
    stim[24] = 19'h5b482;
    stim[25] = 19'h5bd60;
    stim[26] = 19'h75bd1;
    stim[27] = 19'h761e3;
    stim[28] = 19'h5a94b;
    stim[29] = 19'h585db;
    stim[30] = 19'h55ac7;
    stim[31] = 19'h64e4f;
    stim[32] = 19'h64b80;
    stim[33] = 19'h71b06;
    stim[34] = 19'h608f8;
    stim[35] = 19'h5b5f5;
    stim[36] = 19'h6ee22;
    stim[37] = 19'h501b4;
    stim[38] = 19'h74b05;
    stim[39] = 19'h61a2d;
    stim[40] = 19'h70e0b;
    stim[41] = 19'h44ea2;
    stim[42] = 19'h4484a;
    stim[43] = 19'h5e35a;
    stim[44] = 19'h686ef;
    stim[45] = 19'h701b8;
    stim[46] = 19'h4d4ad;
    stim[47] = 19'h6eae6;
    stim[48] = 19'h55c99;
    stim[49] = 19'h42c5d;
    stim[50] = 19'h564b3;
    stim[51] = 19'h5abbd;
    stim[52] = 19'h7e79d;
    stim[53] = 19'h5a856;
    stim[54] = 19'h5ae64;
    stim[55] = 19'h66e6d;
    stim[56] = 19'h490b9;
    stim[57] = 19'h5f08e;
    stim[58] = 19'h4e588;
    stim[59] = 19'h6897b;
    stim[60] = 19'h607e8;
    stim[61] = 19'h45be8;
    stim[62] = 19'h6bd67;
    stim[63] = 19'h73f80;
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
      expv[0] = 21'h000010;
      expv[1] = 21'h000010;
      expv[2] = 21'h000010;
      expv[3] = 21'h00000f;
      expv[4] = 21'h00000f;
      expv[5] = 21'h00000e;
      expv[6] = 21'h00000e;
      expv[7] = 21'h00000d;
      expv[8] = 21'h11fbae;
      expv[9] = 21'h11fbae;
      expv[10] = 21'h11fbad;
      expv[11] = 21'h11fbac;
      expv[12] = 21'h138e8c;
      expv[13] = 21'h0c9a4d;
      expv[14] = 21'h15300d;
      expv[15] = 21'h15300c;
      expv[16] = 21'h15300c;
      expv[17] = 21'h15300c;
      expv[18] = 21'h0e7fcc;
      expv[19] = 21'h0e7fcc;
      expv[20] = 21'h0e7fcb;
      expv[21] = 21'h00260c;
      expv[22] = 21'h00260c;
      expv[23] = 21'h00260b;
      expv[24] = 21'h00260b;
      expv[25] = 21'h00260b;
      expv[26] = 21'h00260b;
      expv[27] = 21'h1d606b;
      expv[28] = 21'h02e24b;
      expv[29] = 21'h05860c;
      expv[30] = 21'h0134ad;
      expv[31] = 21'h02496e;
      expv[32] = 21'h15bd0e;
      expv[33] = 21'h15bd0d;
      expv[34] = 21'h15bd0c;
      expv[35] = 21'h15bd0b;
      expv[36] = 21'h161e2c;
      expv[37] = 21'h161e2b;
      expv[38] = 21'h161e2b;
      expv[39] = 21'h04e4eb;
      expv[40] = 21'h04b80b;
      expv[41] = 21'h11b06b;
      expv[42] = 21'h11b06b;
      expv[43] = 21'h11b06b;
      expv[44] = 21'h11b06b;
      expv[45] = 21'h008f8b;
      expv[46] = 21'h008f8a;
      expv[47] = 21'h0ee22b;
      expv[48] = 21'h0ee22a;
      expv[49] = 21'h14b04b;
      expv[50] = 21'h01a2cc;
      expv[51] = 21'h10e0ad;
      expv[52] = 21'h086eee;
      expv[53] = 21'h101b8e;
      expv[54] = 21'h101b8e;
      expv[55] = 21'h101b8e;
      expv[56] = 21'h0eae6e;
      expv[57] = 21'h1e79cf;
      expv[58] = 21'h1e79cf;
      expv[59] = 21'h1e79cf;
      expv[60] = 21'h06e6cf;
      expv[61] = 21'h06e6ce;
      expv[62] = 21'h06e6ce;
      expv[63] = 21'h0897ae;
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
