// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04403 dut (
    .clk(clk),
    .M_AXIS_RESULT_0_tready(in_vec[35:35]),
    .S_AXIS_A_0_tdata(in_vec[34:19]),
    .S_AXIS_A_0_tvalid(in_vec[18:18]),
    .S_AXIS_B_0_tdata(in_vec[17:2]),
    .S_AXIS_B_0_tvalid(in_vec[1:1]),
    .rst_n(in_vec[0:0]),
    .M_AXIS_RESULT_0_tdata(out_vec[19:4]),
    .M_AXIS_RESULT_0_tlast(out_vec[3:3]),
    .M_AXIS_RESULT_0_tvalid(out_vec[2:2]),
    .S_AXIS_A_0_tready(out_vec[1:1]),
    .S_AXIS_B_0_tready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h737e5bbcc;
    stim[1] = 36'ha744e604a;
    stim[2] = 36'h92d14c6d3;
    stim[3] = 36'he5fcfe733;
    stim[4] = 36'h3f9e381b7;
    stim[5] = 36'he0d4bac97;
    stim[6] = 36'ha7d4c94b5;
    stim[7] = 36'h926607f3d;
    stim[8] = 36'h8e262f113;
    stim[9] = 36'h9231d5073;
    stim[10] = 36'hf8b2c1a9b;
    stim[11] = 36'hce3d365c1;
    stim[12] = 36'h76dc02803;
    stim[13] = 36'h54cf62eaf;
    stim[14] = 36'he19822067;
    stim[15] = 36'hd8b267581;
    stim[16] = 36'h0f172a89d;
    stim[17] = 36'hbe65d1fad;
    stim[18] = 36'h330f538d1;
    stim[19] = 36'h7aa8ecbdb;
    stim[20] = 36'h690468bc9;
    stim[21] = 36'h3c92c6627;
    stim[22] = 36'h6b597ec83;
    stim[23] = 36'hb5556cd03;
    stim[24] = 36'hceded47fb;
    stim[25] = 36'h77c4e8f5f;
    stim[26] = 36'ha70ceaee9;
    stim[27] = 36'h3bc3b5259;
    stim[28] = 36'hf5c71e0b9;
    stim[29] = 36'he6505a541;
    stim[30] = 36'hea2d33483;
    stim[31] = 36'h4aae94d75;
    stim[32] = 36'h3cd9050a7;
    stim[33] = 36'ha4e34a771;
    stim[34] = 36'h83d616c3f;
    stim[35] = 36'he815e7d1f;
    stim[36] = 36'hb3eafec93;
    stim[37] = 36'hbbcf1098f;
    stim[38] = 36'he8779f27b;
    stim[39] = 36'h413e7a325;
    stim[40] = 36'hd1a2b0785;
    stim[41] = 36'hb0aade093;
    stim[42] = 36'h82ce8e5bd;
    stim[43] = 36'h9eee99383;
    stim[44] = 36'h78e5106cf;
    stim[45] = 36'hcfd4f2827;
    stim[46] = 36'h028b656ad;
    stim[47] = 36'hcbf6dda39;
    stim[48] = 36'h6435a92b9;
    stim[49] = 36'h1553f6103;
    stim[50] = 36'h00ac61ebd;
    stim[51] = 36'h5e8075465;
    stim[52] = 36'h9b3e5b945;
    stim[53] = 36'h0909f349f;
    stim[54] = 36'h7ea3a5e73;
    stim[55] = 36'h9c750988d;
    stim[56] = 36'h751f3a36d;
    stim[57] = 36'hac8bf16bf;
    stim[58] = 36'ha6fbd71cd;
    stim[59] = 36'h0551c867b;
    stim[60] = 36'hef1b91489;
    stim[61] = 36'h8d134dafd;
    stim[62] = 36'h1dfcb3a1b;
    stim[63] = 36'hbe5652733;
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
      expv[0] = 20'hxxxxx;
      expv[1] = 20'hxxxxx;
      expv[2] = 20'hxxxxx;
      expv[3] = 20'hxxxxx;
      expv[4] = 20'h00003;
      expv[5] = 20'h00008;
      expv[6] = 20'h5756b;
      expv[7] = 20'hc5c5f;
      expv[8] = 20'hac66b;
      expv[9] = 20'hb71eb;
      expv[10] = 20'h3aceb;
      expv[11] = 20'h3aceb;
      expv[12] = 20'h0bedb;
      expv[13] = 20'h787f8;
      expv[14] = 20'hf80b8;
      expv[15] = 20'hf80bf;
      expv[16] = 20'hfb65f;
      expv[17] = 20'h35498;
      expv[18] = 20'h31b7b;
      expv[19] = 20'h397dc;
      expv[20] = 20'h397d8;
      expv[21] = 20'h04e4c;
      expv[22] = 20'hee37c;
      expv[23] = 20'ha847c;
      expv[24] = 20'h84fef;
      expv[25] = 20'h92aef;
      expv[26] = 20'hd1d28;
      expv[27] = 20'h1deab;
      expv[28] = 20'hefbbc;
      expv[29] = 20'h9360b;
      expv[30] = 20'hf1f0f;
      expv[31] = 20'hf1f0b;
      expv[32] = 20'hf1f08;
      expv[33] = 20'h70778;
      expv[34] = 20'h99c0f;
      expv[35] = 20'h99c0f;
      expv[36] = 20'he0c9b;
      expv[37] = 20'h5defb;
      expv[38] = 20'ha4d5b;
      expv[39] = 20'h6f72b;
      expv[40] = 20'h62f98;
      expv[41] = 20'haa38b;
      expv[42] = 20'he473f;
      expv[43] = 20'hff1ab;
      expv[44] = 20'hff1ab;
      expv[45] = 20'hd9798;
      expv[46] = 20'hd979b;
      expv[47] = 20'hc635c;
      expv[48] = 20'ha308b;
      expv[49] = 20'h69b2c;
      expv[50] = 20'hcf1f8;
      expv[51] = 20'h61f6c;
      expv[52] = 20'h61f6c;
      expv[53] = 20'h02e7f;
      expv[54] = 20'hd998c;
      expv[55] = 20'h95408;
      expv[56] = 20'h0ebcf;
      expv[57] = 20'hdf3ac;
      expv[58] = 20'ha9afb;
      expv[59] = 20'ha9aff;
      expv[60] = 20'ha9af8;
      expv[61] = 20'h1ec6b;
      expv[62] = 20'h13a6f;
      expv[63] = 20'h2c418;
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
