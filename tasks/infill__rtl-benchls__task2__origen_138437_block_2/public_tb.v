// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_138437 dut (
    .clk_master(clk),
    .in1(in_vec[45:38]),
    .in2(in_vec[37:30]),
    .in3(in_vec[29:22]),
    .data_in_master(in_vec[21:14]),
    .rst_master(in_vec[13:13]),
    .cs_master(in_vec[12:12]),
    .data_in_slave(in_vec[11:4]),
    .clk_slave(in_vec[3:3]),
    .rst_slave(in_vec[2:2]),
    .cs_slave(in_vec[1:1]),
    .req_slave(in_vec[0:0]),
    .data_out_master(out_vec[33:26]),
    .ready_master(out_vec[25:25]),
    .out1(out_vec[24:17]),
    .out2(out_vec[16:9]),
    .out3(out_vec[8:1]),
    .ack_slave(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h348b0770206f;
    stim[1] = 46'h146d69e16e2e;
    stim[2] = 46'h2f50efb3461a;
    stim[3] = 46'h240784657c6a;
    stim[4] = 46'h30d29c34039f;
    stim[5] = 46'h32aef1ce4fd9;
    stim[6] = 46'h24714096ce81;
    stim[7] = 46'h085659a05980;
    stim[8] = 46'h10d45a9c2de9;
    stim[9] = 46'h02976cf1ce53;
    stim[10] = 46'h2e2679d90fc3;
    stim[11] = 46'h07a833da67f8;
    stim[12] = 46'h00cedf643e6a;
    stim[13] = 46'h1317ae6a99eb;
    stim[14] = 46'h17a42a81bac3;
    stim[15] = 46'h00f9bfa02677;
    stim[16] = 46'h029f774039d8;
    stim[17] = 46'h3af200d5f992;
    stim[18] = 46'h29e74ec87e6b;
    stim[19] = 46'h1e4d439a2310;
    stim[20] = 46'h001c1060ec41;
    stim[21] = 46'h18eb290155f3;
    stim[22] = 46'h2001f3e90172;
    stim[23] = 46'h0ec135c144e3;
    stim[24] = 46'h2d8d1f016f7a;
    stim[25] = 46'h114a77118989;
    stim[26] = 46'h09688cf078b3;
    stim[27] = 46'h0b41eae0009b;
    stim[28] = 46'h10233800df32;
    stim[29] = 46'h1ae01c6d5d41;
    stim[30] = 46'h116bc351e05b;
    stim[31] = 46'h0d1cdcd88663;
    stim[32] = 46'h1d25d71a2c40;
    stim[33] = 46'h0cd360a6caba;
    stim[34] = 46'h0f51310423d3;
    stim[35] = 46'h1bb1ef1b1188;
    stim[36] = 46'h1e678c3edad2;
    stim[37] = 46'h0b284bf77b60;
    stim[38] = 46'h299519227da1;
    stim[39] = 46'h15248589c892;
    stim[40] = 46'h08979d0e1222;
    stim[41] = 46'h07992d002938;
    stim[42] = 46'h134f05257e80;
    stim[43] = 46'h154b017bb139;
    stim[44] = 46'h2be62474199a;
    stim[45] = 46'h29e43b4b284b;
    stim[46] = 46'h3d00779f7e61;
    stim[47] = 46'h2eade7ccc2b2;
    stim[48] = 46'h0ed4175f23d3;
    stim[49] = 46'h3aa8c6f14e9a;
    stim[50] = 46'h1429f2ce7cc3;
    stim[51] = 46'h0704128658db;
    stim[52] = 46'h0495e56fd231;
    stim[53] = 46'h043e606bcf18;
    stim[54] = 46'h18f17c28b9e0;
    stim[55] = 46'h0389a62cd6ea;
    stim[56] = 46'h2c306863640a;
    stim[57] = 46'h1b2124dee6f0;
    stim[58] = 46'h33610092bd8b;
    stim[59] = 46'h3edbbc02bbd1;
    stim[60] = 46'h3d77ea6f3528;
    stim[61] = 46'h1334f622ea53;
    stim[62] = 46'h2b962c1059db;
    stim[63] = 46'h2c5a28c39bdb;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h000000000;
      expv[6] = 34'h000000000;
      expv[7] = 34'h000000000;
      expv[8] = 34'h000000000;
      expv[9] = 34'h000000000;
      expv[10] = 34'h000000000;
      expv[11] = 34'h000000000;
      expv[12] = 34'h000000000;
      expv[13] = 34'h000000000;
      expv[14] = 34'h000000000;
      expv[15] = 34'h000000000;
      expv[16] = 34'h000000000;
      expv[17] = 34'h000000000;
      expv[18] = 34'h000000000;
      expv[19] = 34'h000000000;
      expv[20] = 34'h000000000;
      expv[21] = 34'h000000000;
      expv[22] = 34'h000000000;
      expv[23] = 34'h000000000;
      expv[24] = 34'h000000000;
      expv[25] = 34'h000000000;
      expv[26] = 34'h000000000;
      expv[27] = 34'h000000000;
      expv[28] = 34'h000000000;
      expv[29] = 34'h000000000;
      expv[30] = 34'h000000000;
      expv[31] = 34'h000000000;
      expv[32] = 34'h000000000;
      expv[33] = 34'h000000000;
      expv[34] = 34'h000000000;
      expv[35] = 34'h000000000;
      expv[36] = 34'h000000000;
      expv[37] = 34'h000000000;
      expv[38] = 34'h000000000;
      expv[39] = 34'h000000000;
      expv[40] = 34'h000000000;
      expv[41] = 34'h000000000;
      expv[42] = 34'h000000000;
      expv[43] = 34'h000000000;
      expv[44] = 34'h000000000;
      expv[45] = 34'h000000000;
      expv[46] = 34'h000000000;
      expv[47] = 34'h000000000;
      expv[48] = 34'h000000000;
      expv[49] = 34'h000000000;
      expv[50] = 34'h000000000;
      expv[51] = 34'h000000000;
      expv[52] = 34'h000000000;
      expv[53] = 34'h000000000;
      expv[54] = 34'h000000000;
      expv[55] = 34'h000000000;
      expv[56] = 34'h000000000;
      expv[57] = 34'h000000000;
      expv[58] = 34'h000000000;
      expv[59] = 34'h000000000;
      expv[60] = 34'h000000000;
      expv[61] = 34'h000000000;
      expv[62] = 34'h000000000;
      expv[63] = 34'h000000000;
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
