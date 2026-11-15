// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_116767 dut (
    .clk_i(clk),
    .rst_ni(in_vec[7:7]),
    .data_req_i(in_vec[6:6]),
    .data_we_i(in_vec[5:5]),
    .aw_ready_i(in_vec[4:4]),
    .w_ready_i(in_vec[3:3]),
    .b_valid_i(in_vec[2:2]),
    .ar_ready_i(in_vec[1:1]),
    .r_valid_i(in_vec[0:0]),
    .data_gnt_o(out_vec[8:8]),
    .data_rvalid_o(out_vec[7:7]),
    .CE(out_vec[6:6]),
    .WE(out_vec[5:5]),
    .aw_valid_o(out_vec[4:4]),
    .w_valid_o(out_vec[3:3]),
    .b_ready_o(out_vec[2:2]),
    .ar_valid_o(out_vec[1:1]),
    .r_ready_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h14;
    stim[1] = 8'h23;
    stim[2] = 8'h91;
    stim[3] = 8'h0d;
    stim[4] = 8'hc2;
    stim[5] = 8'h91;
    stim[6] = 8'hd1;
    stim[7] = 8'hb2;
    stim[8] = 8'hf9;
    stim[9] = 8'h8f;
    stim[10] = 8'hd4;
    stim[11] = 8'hf2;
    stim[12] = 8'he3;
    stim[13] = 8'hbc;
    stim[14] = 8'h93;
    stim[15] = 8'h80;
    stim[16] = 8'he6;
    stim[17] = 8'hf8;
    stim[18] = 8'hb0;
    stim[19] = 8'hb3;
    stim[20] = 8'h82;
    stim[21] = 8'hb9;
    stim[22] = 8'hfa;
    stim[23] = 8'h9c;
    stim[24] = 8'h8b;
    stim[25] = 8'hc1;
    stim[26] = 8'hb6;
    stim[27] = 8'hb2;
    stim[28] = 8'hb8;
    stim[29] = 8'hc3;
    stim[30] = 8'hb5;
    stim[31] = 8'hf8;
    stim[32] = 8'hce;
    stim[33] = 8'ha9;
    stim[34] = 8'h85;
    stim[35] = 8'ha8;
    stim[36] = 8'h8e;
    stim[37] = 8'h95;
    stim[38] = 8'h88;
    stim[39] = 8'hb0;
    stim[40] = 8'hc3;
    stim[41] = 8'hcb;
    stim[42] = 8'hee;
    stim[43] = 8'hf8;
    stim[44] = 8'hf2;
    stim[45] = 8'hac;
    stim[46] = 8'hd1;
    stim[47] = 8'hd2;
    stim[48] = 8'hb3;
    stim[49] = 8'h9e;
    stim[50] = 8'hd8;
    stim[51] = 8'hea;
    stim[52] = 8'h9c;
    stim[53] = 8'hb8;
    stim[54] = 8'he2;
    stim[55] = 8'he9;
    stim[56] = 8'hce;
    stim[57] = 8'hf0;
    stim[58] = 8'ha9;
    stim[59] = 8'hee;
    stim[60] = 8'ha6;
    stim[61] = 8'hda;
    stim[62] = 8'hfa;
    stim[63] = 8'h86;
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
      expv[4] = 9'h142;
      expv[5] = 9'h0c1;
      expv[6] = 9'h042;
      expv[7] = 9'h000;
      expv[8] = 9'h178;
      expv[9] = 9'h0e4;
      expv[10] = 9'h042;
      expv[11] = 9'h178;
      expv[12] = 9'h068;
      expv[13] = 9'h068;
      expv[14] = 9'h064;
      expv[15] = 9'h064;
      expv[16] = 9'h0e4;
      expv[17] = 9'h178;
      expv[18] = 9'h064;
      expv[19] = 9'h064;
      expv[20] = 9'h064;
      expv[21] = 9'h064;
      expv[22] = 9'h064;
      expv[23] = 9'h0e4;
      expv[24] = 9'h000;
      expv[25] = 9'h042;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h142;
      expv[30] = 9'h0c1;
      expv[31] = 9'h178;
      expv[32] = 9'h0e4;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h142;
      expv[41] = 9'h0c1;
      expv[42] = 9'h178;
      expv[43] = 9'h070;
      expv[44] = 9'h064;
      expv[45] = 9'h0e4;
      expv[46] = 9'h042;
      expv[47] = 9'h142;
      expv[48] = 9'h0c1;
      expv[49] = 9'h000;
      expv[50] = 9'h042;
      expv[51] = 9'h178;
      expv[52] = 9'h070;
      expv[53] = 9'h064;
      expv[54] = 9'h064;
      expv[55] = 9'h064;
      expv[56] = 9'h0e4;
      expv[57] = 9'h178;
      expv[58] = 9'h068;
      expv[59] = 9'h0e4;
      expv[60] = 9'h000;
      expv[61] = 9'h142;
      expv[62] = 9'h041;
      expv[63] = 9'h041;
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
