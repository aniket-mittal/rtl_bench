// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_086047 dut (
    .clk(clk),
    .rst(in_vec[11:11]),
    .monitor_axis_tkeep(in_vec[10:3]),
    .monitor_axis_tvalid(in_vec[2:2]),
    .monitor_axis_tready(in_vec[1:1]),
    .monitor_axis_tlast(in_vec[0:0]),
    .frame_len(out_vec[16:1]),
    .frame_len_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'he23;
    stim[1] = 12'hd9a;
    stim[2] = 12'h4fc;
    stim[3] = 12'h062;
    stim[4] = 12'h4ea;
    stim[5] = 12'h6c1;
    stim[6] = 12'h01f;
    stim[7] = 12'h52f;
    stim[8] = 12'h781;
    stim[9] = 12'h6ac;
    stim[10] = 12'h74b;
    stim[11] = 12'h50d;
    stim[12] = 12'h017;
    stim[13] = 12'h190;
    stim[14] = 12'h5f0;
    stim[15] = 12'h56d;
    stim[16] = 12'h36a;
    stim[17] = 12'h24a;
    stim[18] = 12'h6ce;
    stim[19] = 12'h760;
    stim[20] = 12'h756;
    stim[21] = 12'h484;
    stim[22] = 12'h1e9;
    stim[23] = 12'h68d;
    stim[24] = 12'h063;
    stim[25] = 12'h12d;
    stim[26] = 12'h5cd;
    stim[27] = 12'h2cc;
    stim[28] = 12'h145;
    stim[29] = 12'h597;
    stim[30] = 12'h11b;
    stim[31] = 12'h273;
    stim[32] = 12'h581;
    stim[33] = 12'h783;
    stim[34] = 12'h612;
    stim[35] = 12'h6fa;
    stim[36] = 12'h03f;
    stim[37] = 12'h7c3;
    stim[38] = 12'h00f;
    stim[39] = 12'h4d5;
    stim[40] = 12'h56a;
    stim[41] = 12'h0a2;
    stim[42] = 12'h564;
    stim[43] = 12'h49c;
    stim[44] = 12'h7fb;
    stim[45] = 12'h4eb;
    stim[46] = 12'h536;
    stim[47] = 12'h11c;
    stim[48] = 12'h219;
    stim[49] = 12'h393;
    stim[50] = 12'h1d6;
    stim[51] = 12'h381;
    stim[52] = 12'h0d5;
    stim[53] = 12'h65b;
    stim[54] = 12'h1c6;
    stim[55] = 12'h42a;
    stim[56] = 12'h710;
    stim[57] = 12'h777;
    stim[58] = 12'h382;
    stim[59] = 12'h34b;
    stim[60] = 12'h2d8;
    stim[61] = 12'h0f8;
    stim[62] = 12'h4ab;
    stim[63] = 12'h005;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00005;
      expv[8] = 17'h00001;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00003;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h0000a;
      expv[20] = 17'h0000a;
      expv[21] = 17'h00014;
      expv[22] = 17'h00014;
      expv[23] = 17'h00014;
      expv[24] = 17'h00014;
      expv[25] = 17'h00014;
      expv[26] = 17'h00014;
      expv[27] = 17'h00014;
      expv[28] = 17'h00014;
      expv[29] = 17'h00014;
      expv[30] = 17'h0001d;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00007;
      expv[38] = 17'h00000;
      expv[39] = 17'h00003;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00008;
      expv[48] = 17'h00008;
      expv[49] = 17'h00008;
      expv[50] = 17'h00008;
      expv[51] = 17'h00010;
      expv[52] = 17'h00010;
      expv[53] = 17'h00010;
      expv[54] = 17'h00010;
      expv[55] = 17'h00016;
      expv[56] = 17'h00016;
      expv[57] = 17'h00016;
      expv[58] = 17'h00023;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
