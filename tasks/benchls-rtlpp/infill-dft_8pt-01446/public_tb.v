// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01446 dut (
    .clk(clk),
    .reset(in_vec[8:8]),
    .x_in(in_vec[7:0]),
    .y_real(out_vec[21:11]),
    .y_imag(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h14d;
    stim[1] = 9'h121;
    stim[2] = 9'h00b;
    stim[3] = 9'h079;
    stim[4] = 9'h075;
    stim[5] = 9'h0d6;
    stim[6] = 9'h068;
    stim[7] = 9'h057;
    stim[8] = 9'h06d;
    stim[9] = 9'h03c;
    stim[10] = 9'h0ba;
    stim[11] = 9'h001;
    stim[12] = 9'h024;
    stim[13] = 9'h028;
    stim[14] = 9'h032;
    stim[15] = 9'h13e;
    stim[16] = 9'h0b5;
    stim[17] = 9'h0fa;
    stim[18] = 9'h019;
    stim[19] = 9'h017;
    stim[20] = 9'h023;
    stim[21] = 9'h04a;
    stim[22] = 9'h024;
    stim[23] = 9'h036;
    stim[24] = 9'h0bf;
    stim[25] = 9'h044;
    stim[26] = 9'h0d4;
    stim[27] = 9'h08e;
    stim[28] = 9'h0c2;
    stim[29] = 9'h0af;
    stim[30] = 9'h0d6;
    stim[31] = 9'h0eb;
    stim[32] = 9'h0a9;
    stim[33] = 9'h006;
    stim[34] = 9'h10f;
    stim[35] = 9'h0e2;
    stim[36] = 9'h0d4;
    stim[37] = 9'h05a;
    stim[38] = 9'h0b0;
    stim[39] = 9'h088;
    stim[40] = 9'h0d2;
    stim[41] = 9'h08e;
    stim[42] = 9'h0db;
    stim[43] = 9'h0be;
    stim[44] = 9'h0e0;
    stim[45] = 9'h09c;
    stim[46] = 9'h061;
    stim[47] = 9'h0db;
    stim[48] = 9'h0aa;
    stim[49] = 9'h0a4;
    stim[50] = 9'h0bf;
    stim[51] = 9'h011;
    stim[52] = 9'h0b8;
    stim[53] = 9'h0db;
    stim[54] = 9'h009;
    stim[55] = 9'h0b3;
    stim[56] = 9'h0b8;
    stim[57] = 9'h040;
    stim[58] = 9'h0fd;
    stim[59] = 9'h030;
    stim[60] = 9'h0a5;
    stim[61] = 9'h061;
    stim[62] = 9'h04b;
    stim[63] = 9'h001;
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
      expv[12] = 22'h3a57a8;
      expv[13] = 22'h003ff8;
      expv[14] = 22'h3b97fb;
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
      expv[26] = 22'h3bd7b6;
      expv[27] = 22'h3d0fbb;
      expv[28] = 22'h3ae856;
      expv[29] = 22'h3ed016;
      expv[30] = 22'h3ad8c5;
      expv[31] = 22'h392035;
      expv[32] = 22'h038000;
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
      expv[45] = 22'h3b28a5;
      expv[46] = 22'h012854;
      expv[47] = 22'h02a009;
      expv[48] = 22'h007778;
      expv[49] = 22'h01481d;
      expv[50] = 22'h048f4e;
      expv[51] = 22'h354000;
      expv[52] = 22'h000000;
      expv[53] = 22'h000000;
      expv[54] = 22'h000000;
      expv[55] = 22'h000000;
      expv[56] = 22'h000000;
      expv[57] = 22'h000000;
      expv[58] = 22'h000000;
      expv[59] = 22'h000000;
      expv[60] = 22'h000000;
      expv[61] = 22'h0617ea;
      expv[62] = 22'h3dafce;
      expv[63] = 22'h01cf49;
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
