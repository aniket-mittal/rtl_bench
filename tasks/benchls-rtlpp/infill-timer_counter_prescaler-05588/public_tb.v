// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05588 dut (
    .clk_i(clk),
    .res_i(in_vec[18:18]),
    .en_clk_i(in_vec[17:17]),
    .t1_i(in_vec[16:16]),
    .clk_mstate_i(in_vec[15:13]),
    .data_i(in_vec[12:5]),
    .read_timer_i(in_vec[4:4]),
    .write_timer_i(in_vec[3:3]),
    .start_t_i(in_vec[2:2]),
    .start_cnt_i(in_vec[1:1]),
    .stop_tcnt_i(in_vec[0:0]),
    .data_o(out_vec[8:1]),
    .overflow_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h144db;
    stim[1] = 19'h19e7f;
    stim[2] = 19'h57216;
    stim[3] = 19'h5da19;
    stim[4] = 19'h5e240;
    stim[5] = 19'h4189c;
    stim[6] = 19'h7b4ff;
    stim[7] = 19'h5a19b;
    stim[8] = 19'h738cd;
    stim[9] = 19'h46f3f;
    stim[10] = 19'h75e8b;
    stim[11] = 19'h43dbc;
    stim[12] = 19'h798f0;
    stim[13] = 19'h7025e;
    stim[14] = 19'h5be14;
    stim[15] = 19'h7bf3d;
    stim[16] = 19'h611eb;
    stim[17] = 19'h708c9;
    stim[18] = 19'h5c561;
    stim[19] = 19'h50803;
    stim[20] = 19'h6bde1;
    stim[21] = 19'h7f64a;
    stim[22] = 19'h7097a;
    stim[23] = 19'h6e010;
    stim[24] = 19'h61452;
    stim[25] = 19'h4bbed;
    stim[26] = 19'h7c958;
    stim[27] = 19'h6fa4d;
    stim[28] = 19'h606da;
    stim[29] = 19'h428f4;
    stim[30] = 19'h5f4ec;
    stim[31] = 19'h6e3b0;
    stim[32] = 19'h6c3ae;
    stim[33] = 19'h6ffb4;
    stim[34] = 19'h4fba5;
    stim[35] = 19'h4a701;
    stim[36] = 19'h408de;
    stim[37] = 19'h518ec;
    stim[38] = 19'h4b726;
    stim[39] = 19'h75e31;
    stim[40] = 19'h522c7;
    stim[41] = 19'h697e2;
    stim[42] = 19'h65024;
    stim[43] = 19'h429ee;
    stim[44] = 19'h42dfe;
    stim[45] = 19'h7be43;
    stim[46] = 19'h3d901;
    stim[47] = 19'h50a0e;
    stim[48] = 19'h51f0b;
    stim[49] = 19'h78be5;
    stim[50] = 19'h779c1;
    stim[51] = 19'h72242;
    stim[52] = 19'h6ba3a;
    stim[53] = 19'h5a140;
    stim[54] = 19'h6caf5;
    stim[55] = 19'h42ab7;
    stim[56] = 19'h66dcb;
    stim[57] = 19'h5fe1c;
    stim[58] = 19'h63231;
    stim[59] = 19'h1abed;
    stim[60] = 19'h56320;
    stim[61] = 19'h6c438;
    stim[62] = 19'h63aff;
    stim[63] = 19'h670eb;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h1fe;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h14e;
      expv[8] = 9'h1fe;
      expv[9] = 9'h18c;
      expv[10] = 9'h1fe;
      expv[11] = 9'h1e8;
      expv[12] = 9'h1e8;
      expv[13] = 9'h1e8;
      expv[14] = 9'h024;
      expv[15] = 9'h024;
      expv[16] = 9'h1fe;
      expv[17] = 9'h1fe;
      expv[18] = 9'h1fe;
      expv[19] = 9'h1fe;
      expv[20] = 9'h1fe;
      expv[21] = 9'h1fe;
      expv[22] = 9'h164;
      expv[23] = 9'h096;
      expv[24] = 9'h096;
      expv[25] = 9'h1fe;
      expv[26] = 9'h096;
      expv[27] = 9'h1fe;
      expv[28] = 9'h1a4;
      expv[29] = 9'h06c;
      expv[30] = 9'h1fe;
      expv[31] = 9'h06c;
      expv[32] = 9'h1fe;
      expv[33] = 9'h03a;
      expv[34] = 9'h1fe;
      expv[35] = 9'h1fe;
      expv[36] = 9'h03a;
      expv[37] = 9'h1fe;
      expv[38] = 9'h1fe;
      expv[39] = 9'h03a;
      expv[40] = 9'h1fe;
      expv[41] = 9'h1fe;
      expv[42] = 9'h1fe;
      expv[43] = 9'h1fe;
      expv[44] = 9'h03a;
      expv[45] = 9'h1fe;
      expv[46] = 9'h1fe;
      expv[47] = 9'h1fe;
      expv[48] = 9'h1fe;
      expv[49] = 9'h1fe;
      expv[50] = 9'h1fe;
      expv[51] = 9'h1fe;
      expv[52] = 9'h000;
      expv[53] = 9'h1fe;
      expv[54] = 9'h1a2;
      expv[55] = 9'h1a2;
      expv[56] = 9'h1fe;
      expv[57] = 9'h0dc;
      expv[58] = 9'h0dc;
      expv[59] = 9'h1fe;
      expv[60] = 9'h1fe;
      expv[61] = 9'h000;
      expv[62] = 9'h042;
      expv[63] = 9'h1fe;
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
