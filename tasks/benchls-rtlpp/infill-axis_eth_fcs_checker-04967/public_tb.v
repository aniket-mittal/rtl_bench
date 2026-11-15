// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04967 dut (
    .clk(clk),
    .rst(in_vec[12:12]),
    .input_axis_tdata(in_vec[11:4]),
    .input_axis_tvalid(in_vec[3:3]),
    .input_axis_tlast(in_vec[2:2]),
    .input_axis_tuser(in_vec[1:1]),
    .output_axis_tready(in_vec[0:0]),
    .input_axis_tready(out_vec[13:13]),
    .output_axis_tdata(out_vec[12:5]),
    .output_axis_tvalid(out_vec[4:4]),
    .output_axis_tlast(out_vec[3:3]),
    .output_axis_tuser(out_vec[2:2]),
    .busy(out_vec[1:1]),
    .error_bad_fcs(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h183c;
    stim[1] = 13'h10cc;
    stim[2] = 13'h014f;
    stim[3] = 13'h16fb;
    stim[4] = 13'h032b;
    stim[5] = 13'h024a;
    stim[6] = 13'h02ef;
    stim[7] = 13'h05c1;
    stim[8] = 13'h0466;
    stim[9] = 13'h0451;
    stim[10] = 13'h0e31;
    stim[11] = 13'h0f36;
    stim[12] = 13'h095e;
    stim[13] = 13'h0d71;
    stim[14] = 13'h003c;
    stim[15] = 13'h070f;
    stim[16] = 13'h06b5;
    stim[17] = 13'h0950;
    stim[18] = 13'h0ccc;
    stim[19] = 13'h09b0;
    stim[20] = 13'h0b88;
    stim[21] = 13'h047e;
    stim[22] = 13'h074f;
    stim[23] = 13'h08b6;
    stim[24] = 13'h0819;
    stim[25] = 13'h0442;
    stim[26] = 13'h0b4a;
    stim[27] = 13'h0e92;
    stim[28] = 13'h0608;
    stim[29] = 13'h09c4;
    stim[30] = 13'h072a;
    stim[31] = 13'h0e40;
    stim[32] = 13'h0755;
    stim[33] = 13'h0588;
    stim[34] = 13'h0413;
    stim[35] = 13'h03a1;
    stim[36] = 13'h0cca;
    stim[37] = 13'h0260;
    stim[38] = 13'h000e;
    stim[39] = 13'h0fc1;
    stim[40] = 13'h04ba;
    stim[41] = 13'h0bc2;
    stim[42] = 13'h0d1e;
    stim[43] = 13'h0d0f;
    stim[44] = 13'h0ee3;
    stim[45] = 13'h0e7f;
    stim[46] = 13'h0e3c;
    stim[47] = 13'h08b4;
    stim[48] = 13'h092e;
    stim[49] = 13'h0561;
    stim[50] = 13'h0e41;
    stim[51] = 13'h097b;
    stim[52] = 13'h043d;
    stim[53] = 13'h0a92;
    stim[54] = 13'h05b8;
    stim[55] = 13'h04ed;
    stim[56] = 13'h0fa5;
    stim[57] = 13'h0ca5;
    stim[58] = 13'h0631;
    stim[59] = 13'h053c;
    stim[60] = 13'h00d9;
    stim[61] = 13'h0f38;
    stim[62] = 13'h0777;
    stim[63] = 13'h0aba;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h0000;
      expv[3] = 14'h2000;
      expv[4] = 14'h0000;
      expv[5] = 14'h2000;
      expv[6] = 14'h2000;
      expv[7] = 14'h2000;
      expv[8] = 14'h2000;
      expv[9] = 14'h2000;
      expv[10] = 14'h2000;
      expv[11] = 14'h2000;
      expv[12] = 14'h2000;
      expv[13] = 14'h2000;
      expv[14] = 14'h2de0;
      expv[15] = 14'h2de0;
      expv[16] = 14'h249d;
      expv[17] = 14'h25c0;
      expv[18] = 14'h25c0;
      expv[19] = 14'h25c0;
      expv[20] = 14'h32a0;
      expv[21] = 14'h32a0;
      expv[22] = 14'h2060;
      expv[23] = 14'h2e00;
      expv[24] = 14'h3980;
      expv[25] = 14'h3992;
      expv[26] = 14'h3992;
      expv[27] = 14'h1992;
      expv[28] = 14'h1992;
      expv[29] = 14'h1992;
      expv[30] = 14'h1992;
      expv[31] = 14'h1992;
      expv[32] = 14'h1992;
      expv[33] = 14'h3712;
      expv[34] = 14'h1712;
      expv[35] = 14'h28f2;
      expv[36] = 14'h2e82;
      expv[37] = 14'h2e92;
      expv[38] = 14'h2e92;
      expv[39] = 14'h0e91;
      expv[40] = 14'h303c;
      expv[41] = 14'h303c;
      expv[42] = 14'h303c;
      expv[43] = 14'h303c;
      expv[44] = 14'h3980;
      expv[45] = 14'h2000;
      expv[46] = 14'h2000;
      expv[47] = 14'h297d;
      expv[48] = 14'h297c;
      expv[49] = 14'h297c;
      expv[50] = 14'h3a00;
      expv[51] = 14'h3a00;
      expv[52] = 14'h3a00;
      expv[53] = 14'h3ce0;
      expv[54] = 14'h3c60;
      expv[55] = 14'h3c60;
      expv[56] = 14'h325d;
      expv[57] = 14'h32e0;
      expv[58] = 14'h32e0;
      expv[59] = 14'h32e0;
      expv[60] = 14'h32e0;
      expv[61] = 14'h2860;
      expv[62] = 14'h2b60;
      expv[63] = 14'h29c0;
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
