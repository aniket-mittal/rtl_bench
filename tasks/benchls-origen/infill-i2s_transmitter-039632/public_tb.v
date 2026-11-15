// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_039632 dut (
    .clk_in(clk),
    .rst(in_vec[17:17]),
    .send_ctrl(in_vec[16:16]),
    .data_in(in_vec[15:0]),
    .data(out_vec[21:21]),
    .WS_reg(out_vec[20:20]),
    .sck(out_vec[19:19]),
    .rd_clk(out_vec[18:18]),
    .fifo_rden(out_vec[17:17]),
    .send_finish(out_vec[16:16]),
    .send_num(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2544f;
    stim[1] = 18'h3b746;
    stim[2] = 18'h100cf;
    stim[3] = 18'h0f9f3;
    stim[4] = 18'h0a2cb;
    stim[5] = 18'h1f188;
    stim[6] = 18'h1f284;
    stim[7] = 18'h1b8f7;
    stim[8] = 18'h08810;
    stim[9] = 18'h10dc7;
    stim[10] = 18'h05641;
    stim[11] = 18'h0ee2d;
    stim[12] = 18'h1fc1b;
    stim[13] = 18'h100ef;
    stim[14] = 18'h0bd70;
    stim[15] = 18'h157dd;
    stim[16] = 18'h15ef5;
    stim[17] = 18'h135f2;
    stim[18] = 18'h1577c;
    stim[19] = 18'h00e51;
    stim[20] = 18'h1b198;
    stim[21] = 18'h157a5;
    stim[22] = 18'h09288;
    stim[23] = 18'h0467d;
    stim[24] = 18'h1f203;
    stim[25] = 18'h0e058;
    stim[26] = 18'h0368f;
    stim[27] = 18'h0318b;
    stim[28] = 18'h05e7d;
    stim[29] = 18'h1dd3d;
    stim[30] = 18'h09db9;
    stim[31] = 18'h0334a;
    stim[32] = 18'h10823;
    stim[33] = 18'h0df94;
    stim[34] = 18'h191cd;
    stim[35] = 18'h021de;
    stim[36] = 18'h10e84;
    stim[37] = 18'h0746d;
    stim[38] = 18'h13abc;
    stim[39] = 18'h0b27c;
    stim[40] = 18'h161db;
    stim[41] = 18'h0d9c5;
    stim[42] = 18'h1484f;
    stim[43] = 18'h0bda0;
    stim[44] = 18'h14bce;
    stim[45] = 18'h061ae;
    stim[46] = 18'h191fb;
    stim[47] = 18'h1510e;
    stim[48] = 18'h17e05;
    stim[49] = 18'h02c91;
    stim[50] = 18'h13ea8;
    stim[51] = 18'h1ecbd;
    stim[52] = 18'h01278;
    stim[53] = 18'h0d104;
    stim[54] = 18'h1e9a5;
    stim[55] = 18'h0fdab;
    stim[56] = 18'h13406;
    stim[57] = 18'h13287;
    stim[58] = 18'h02991;
    stim[59] = 18'h09ff2;
    stim[60] = 18'h17c12;
    stim[61] = 18'h0f6e3;
    stim[62] = 18'h14ad7;
    stim[63] = 18'h0ed0d;
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
      expv[0] = 22'h000000;
      expv[1] = 22'h000000;
      expv[2] = 22'h000000;
      expv[3] = 22'h000000;
      expv[4] = 22'h000000;
      expv[5] = 22'h000000;
      expv[6] = 22'h000000;
      expv[7] = 22'h000000;
      expv[8] = 22'h000000;
      expv[9] = 22'h000000;
      expv[10] = 22'h000000;
      expv[11] = 22'h000000;
      expv[12] = 22'h000000;
      expv[13] = 22'h000000;
      expv[14] = 22'h000000;
      expv[15] = 22'h000000;
      expv[16] = 22'h000000;
      expv[17] = 22'h000000;
      expv[18] = 22'h000000;
      expv[19] = 22'h000000;
      expv[20] = 22'h000000;
      expv[21] = 22'h000000;
      expv[22] = 22'h000000;
      expv[23] = 22'h000000;
      expv[24] = 22'h000000;
      expv[25] = 22'h000000;
      expv[26] = 22'h000000;
      expv[27] = 22'h000000;
      expv[28] = 22'h000000;
      expv[29] = 22'h000000;
      expv[30] = 22'h000000;
      expv[31] = 22'h000000;
      expv[32] = 22'h000000;
      expv[33] = 22'h000000;
      expv[34] = 22'h000000;
      expv[35] = 22'h000000;
      expv[36] = 22'h000000;
      expv[37] = 22'h000000;
      expv[38] = 22'h000000;
      expv[39] = 22'h000000;
      expv[40] = 22'h000000;
      expv[41] = 22'h000000;
      expv[42] = 22'h000000;
      expv[43] = 22'h000000;
      expv[44] = 22'h000000;
      expv[45] = 22'h000000;
      expv[46] = 22'h000000;
      expv[47] = 22'h000000;
      expv[48] = 22'h000000;
      expv[49] = 22'h000000;
      expv[50] = 22'h000000;
      expv[51] = 22'h000000;
      expv[52] = 22'h000000;
      expv[53] = 22'h000000;
      expv[54] = 22'h000000;
      expv[55] = 22'h000000;
      expv[56] = 22'h000000;
      expv[57] = 22'h000000;
      expv[58] = 22'h000000;
      expv[59] = 22'h000000;
      expv[60] = 22'h000000;
      expv[61] = 22'h000000;
      expv[62] = 22'h000000;
      expv[63] = 22'h000000;
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
