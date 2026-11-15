// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_043864 dut (
    .CLK(clk),
    .Read_Enable(in_vec[19:19]),
    .Write_Enable(in_vec[18:18]),
    .Mode(in_vec[17:17]),
    .Busy(in_vec[16:16]),
    .Frame_Data(in_vec[15:0]),
    .Row_Data(out_vec[24:15]),
    .Col_Data(out_vec[14:5]),
    .Read(out_vec[4:4]),
    .Write(out_vec[3:3]),
    .Reset(out_vec[2:2]),
    .Address_Reset(out_vec[1:1]),
    .Pixel_select(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h6b01e;
    stim[1] = 20'h5eab4;
    stim[2] = 20'h75ab7;
    stim[3] = 20'h6a98f;
    stim[4] = 20'h97fe6;
    stim[5] = 20'h1b0f7;
    stim[6] = 20'h4367f;
    stim[7] = 20'h541be;
    stim[8] = 20'h4a712;
    stim[9] = 20'h7ed90;
    stim[10] = 20'h59617;
    stim[11] = 20'h76cb9;
    stim[12] = 20'h94002;
    stim[13] = 20'he9c3d;
    stim[14] = 20'he4833;
    stim[15] = 20'ha28d8;
    stim[16] = 20'hb414d;
    stim[17] = 20'h1589e;
    stim[18] = 20'h13873;
    stim[19] = 20'h80162;
    stim[20] = 20'hd5dbf;
    stim[21] = 20'he7c83;
    stim[22] = 20'h8ee03;
    stim[23] = 20'h52e85;
    stim[24] = 20'hb4939;
    stim[25] = 20'h206d3;
    stim[26] = 20'hbc6bc;
    stim[27] = 20'h2cf20;
    stim[28] = 20'h33f6a;
    stim[29] = 20'h10cf5;
    stim[30] = 20'h6fd47;
    stim[31] = 20'h38aee;
    stim[32] = 20'h45edc;
    stim[33] = 20'he6b49;
    stim[34] = 20'h41a02;
    stim[35] = 20'h32728;
    stim[36] = 20'h803f3;
    stim[37] = 20'hb3f5c;
    stim[38] = 20'hb574d;
    stim[39] = 20'h03f0f;
    stim[40] = 20'h5d988;
    stim[41] = 20'h7c0c3;
    stim[42] = 20'hc4fee;
    stim[43] = 20'h15d69;
    stim[44] = 20'h0392c;
    stim[45] = 20'hc832a;
    stim[46] = 20'hab8c2;
    stim[47] = 20'hf405d;
    stim[48] = 20'hd1502;
    stim[49] = 20'hc5b5f;
    stim[50] = 20'hcb156;
    stim[51] = 20'h1e8f2;
    stim[52] = 20'hf8d83;
    stim[53] = 20'h78c4f;
    stim[54] = 20'h75dfb;
    stim[55] = 20'h92d42;
    stim[56] = 20'h39e5e;
    stim[57] = 20'h197d5;
    stim[58] = 20'hcfee4;
    stim[59] = 20'h91ea4;
    stim[60] = 20'h18740;
    stim[61] = 20'h7566e;
    stim[62] = 20'h44213;
    stim[63] = 20'h462d9;
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
      expv[0] = 25'h0000008;
      expv[1] = 25'h0000002;
      expv[2] = 25'h0000000;
      expv[3] = 25'h000000a;
      expv[4] = 25'h0000002;
      expv[5] = 25'h0000000;
      expv[6] = 25'h0000008;
      expv[7] = 25'h0000000;
      expv[8] = 25'h0000008;
      expv[9] = 25'h0000000;
      expv[10] = 25'h0000002;
      expv[11] = 25'h0000000;
      expv[12] = 25'h0000002;
      expv[13] = 25'h0000010;
      expv[14] = 25'h0000012;
      expv[15] = 25'h0000012;
      expv[16] = 25'h0000002;
      expv[17] = 25'h0000002;
      expv[18] = 25'h0000000;
      expv[19] = 25'h0000010;
      expv[20] = 25'h0000000;
      expv[21] = 25'h0000010;
      expv[22] = 25'h0000012;
      expv[23] = 25'h0000000;
      expv[24] = 25'h0000000;
      expv[25] = 25'h0000002;
      expv[26] = 25'h0000002;
      expv[27] = 25'h0000002;
      expv[28] = 25'h0000002;
      expv[29] = 25'h0000002;
      expv[30] = 25'h0000008;
      expv[31] = 25'h0000002;
      expv[32] = 25'h000000a;
      expv[33] = 25'h0000010;
      expv[34] = 25'h000000a;
      expv[35] = 25'h0000000;
      expv[36] = 25'h0000012;
      expv[37] = 25'h0000000;
      expv[38] = 25'h0000002;
      expv[39] = 25'h0000002;
      expv[40] = 25'h0000000;
      expv[41] = 25'h0000000;
      expv[42] = 25'h0000012;
      expv[43] = 25'h0000000;
      expv[44] = 25'h0000000;
      expv[45] = 25'h0000010;
      expv[46] = 25'h0000010;
      expv[47] = 25'h0000002;
      expv[48] = 25'h0000002;
      expv[49] = 25'h0000010;
      expv[50] = 25'h0000010;
      expv[51] = 25'h0000000;
      expv[52] = 25'h0000000;
      expv[53] = 25'h0000002;
      expv[54] = 25'h0000002;
      expv[55] = 25'h0000002;
      expv[56] = 25'h0000000;
      expv[57] = 25'h0000002;
      expv[58] = 25'h0000010;
      expv[59] = 25'h0000000;
      expv[60] = 25'h0000000;
      expv[61] = 25'h0000000;
      expv[62] = 25'h000000a;
      expv[63] = 25'h0000008;
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
