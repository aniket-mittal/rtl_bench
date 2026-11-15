// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011554 dut (
    .mclk(clk),
    .reset_n(in_vec[10:10]),
    .s_reset(in_vec[9:9]),
    .sclk(in_vec[8:8]),
    .s_data(in_vec[7:0]),
    .m_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h28f;
    stim[1] = 11'h085;
    stim[2] = 11'h798;
    stim[3] = 11'h608;
    stim[4] = 11'h403;
    stim[5] = 11'h558;
    stim[6] = 11'h40e;
    stim[7] = 11'h49a;
    stim[8] = 11'h735;
    stim[9] = 11'h446;
    stim[10] = 11'h54d;
    stim[11] = 11'h72b;
    stim[12] = 11'h75b;
    stim[13] = 11'h5cf;
    stim[14] = 11'h5f4;
    stim[15] = 11'h541;
    stim[16] = 11'h48f;
    stim[17] = 11'h4ce;
    stim[18] = 11'h403;
    stim[19] = 11'h6e5;
    stim[20] = 11'h6a4;
    stim[21] = 11'h65d;
    stim[22] = 11'h704;
    stim[23] = 11'h575;
    stim[24] = 11'h41f;
    stim[25] = 11'h486;
    stim[26] = 11'h482;
    stim[27] = 11'h5a0;
    stim[28] = 11'h79f;
    stim[29] = 11'h400;
    stim[30] = 11'h5f6;
    stim[31] = 11'h57f;
    stim[32] = 11'h410;
    stim[33] = 11'h46e;
    stim[34] = 11'h568;
    stim[35] = 11'h4b8;
    stim[36] = 11'h611;
    stim[37] = 11'h4f1;
    stim[38] = 11'h7d0;
    stim[39] = 11'h4e0;
    stim[40] = 11'h559;
    stim[41] = 11'h6fe;
    stim[42] = 11'h46f;
    stim[43] = 11'h538;
    stim[44] = 11'h407;
    stim[45] = 11'h5c3;
    stim[46] = 11'h50e;
    stim[47] = 11'h5d5;
    stim[48] = 11'h544;
    stim[49] = 11'h420;
    stim[50] = 11'h775;
    stim[51] = 11'h64b;
    stim[52] = 11'h415;
    stim[53] = 11'h661;
    stim[54] = 11'h555;
    stim[55] = 11'h49a;
    stim[56] = 11'h449;
    stim[57] = 11'h41b;
    stim[58] = 11'h403;
    stim[59] = 11'h711;
    stim[60] = 11'h7b2;
    stim[61] = 11'h425;
    stim[62] = 11'h623;
    stim[63] = 11'h550;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h4d;
      expv[14] = 8'h4d;
      expv[15] = 8'h4d;
      expv[16] = 8'h4d;
      expv[17] = 8'h4d;
      expv[18] = 8'h4d;
      expv[19] = 8'h4d;
      expv[20] = 8'h4d;
      expv[21] = 8'h4d;
      expv[22] = 8'h4d;
      expv[23] = 8'h4d;
      expv[24] = 8'h4d;
      expv[25] = 8'h4d;
      expv[26] = 8'h4d;
      expv[27] = 8'h4d;
      expv[28] = 8'h4d;
      expv[29] = 8'h4d;
      expv[30] = 8'ha0;
      expv[31] = 8'ha0;
      expv[32] = 8'ha0;
      expv[33] = 8'ha0;
      expv[34] = 8'ha0;
      expv[35] = 8'ha0;
      expv[36] = 8'ha0;
      expv[37] = 8'h68;
      expv[38] = 8'h68;
      expv[39] = 8'h68;
      expv[40] = 8'h68;
      expv[41] = 8'h68;
      expv[42] = 8'h68;
      expv[43] = 8'h68;
      expv[44] = 8'h68;
      expv[45] = 8'h68;
      expv[46] = 8'h68;
      expv[47] = 8'h68;
      expv[48] = 8'hc3;
      expv[49] = 8'hc3;
      expv[50] = 8'hc3;
      expv[51] = 8'hc3;
      expv[52] = 8'hc3;
      expv[53] = 8'hc3;
      expv[54] = 8'hc3;
      expv[55] = 8'hc3;
      expv[56] = 8'hc3;
      expv[57] = 8'hc3;
      expv[58] = 8'hc3;
      expv[59] = 8'hc3;
      expv[60] = 8'hc3;
      expv[61] = 8'hc3;
      expv[62] = 8'hc3;
      expv[63] = 8'hc3;
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
