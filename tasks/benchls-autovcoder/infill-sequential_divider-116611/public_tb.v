// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_116611 dut (
    .clk(clk),
    .rst(in_vec[36:36]),
    .start(in_vec[35:35]),
    .LA(in_vec[34:34]),
    .EB(in_vec[33:33]),
    .data_in_a(in_vec[32:17]),
    .data_in_b(in_vec[16:0]),
    .Remainder(out_vec[16:9]),
    .data_out(out_vec[8:1]),
    .Done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1f66804097;
    stim[1] = 37'h1c291069d3;
    stim[2] = 37'h0cae98a3e3;
    stim[3] = 37'h0b52650adf;
    stim[4] = 37'h017952923a;
    stim[5] = 37'h09509ea1e5;
    stim[6] = 37'h097da34811;
    stim[7] = 37'h0edbc2bf7e;
    stim[8] = 37'h08cb1a7fef;
    stim[9] = 37'h08f9403e2d;
    stim[10] = 37'h01e6942a1d;
    stim[11] = 37'h08e79965b7;
    stim[12] = 37'h062714d9b9;
    stim[13] = 37'h0d0e60c6a9;
    stim[14] = 37'h0a392a861b;
    stim[15] = 37'h023543638f;
    stim[16] = 37'h06ecf39fa4;
    stim[17] = 37'h01c2e2b56f;
    stim[18] = 37'h089947f7e9;
    stim[19] = 37'h0411e1e936;
    stim[20] = 37'h0d44c73a19;
    stim[21] = 37'h0dab73bd66;
    stim[22] = 37'h0296773aad;
    stim[23] = 37'h07714346f3;
    stim[24] = 37'h0a2776aa57;
    stim[25] = 37'h0fd405aa3c;
    stim[26] = 37'h08d0137783;
    stim[27] = 37'h09155761fa;
    stim[28] = 37'h01d36ad6a6;
    stim[29] = 37'h04b8c90cc9;
    stim[30] = 37'h038c2892fc;
    stim[31] = 37'h02d7ded31d;
    stim[32] = 37'h07bc7c624e;
    stim[33] = 37'h0a2a1f0307;
    stim[34] = 37'h0b3a66e0a4;
    stim[35] = 37'h035d08ad81;
    stim[36] = 37'h0f6251c2ef;
    stim[37] = 37'h0263a599d2;
    stim[38] = 37'h00843e3a99;
    stim[39] = 37'h0e9ac9e636;
    stim[40] = 37'h07f4722095;
    stim[41] = 37'h04875b8808;
    stim[42] = 37'h0b8a99f0ee;
    stim[43] = 37'h0c49351af4;
    stim[44] = 37'h01d915474e;
    stim[45] = 37'h0925c37f0d;
    stim[46] = 37'h0a7e231f2f;
    stim[47] = 37'h01baeee992;
    stim[48] = 37'h0314475cd9;
    stim[49] = 37'h05a4c8cce9;
    stim[50] = 37'h038cb40d96;
    stim[51] = 37'h080e81b93b;
    stim[52] = 37'h0fc4e48180;
    stim[53] = 37'h0ff1006c22;
    stim[54] = 37'h0a3c1593ce;
    stim[55] = 37'h0e84c34c03;
    stim[56] = 37'h053238011a;
    stim[57] = 37'h05675bedea;
    stim[58] = 37'h059cbb215b;
    stim[59] = 37'h06b125bb5b;
    stim[60] = 37'h0d5346ae53;
    stim[61] = 37'h048c28f3d5;
    stim[62] = 37'h100d69c8f8;
    stim[63] = 37'h0596b99082;
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
      expv[3] = 17'h00098;
      expv[4] = 17'h00130;
      expv[5] = 17'h00130;
      expv[6] = 17'h00260;
      expv[7] = 17'h006c0;
      expv[8] = 17'h00dc2;
      expv[9] = 17'h01b86;
      expv[10] = 17'h0350c;
      expv[11] = 17'h0010c;
      expv[12] = 17'h0021a;
      expv[13] = 17'h00114;
      expv[14] = 17'h00060;
      expv[15] = 17'h000c2;
      expv[16] = 17'h000c2;
      expv[17] = 17'h000f2;
      expv[18] = 17'h000f2;
      expv[19] = 17'h001e4;
      expv[20] = 17'h001e0;
      expv[21] = 17'h002c6;
      expv[22] = 17'h00572;
      expv[23] = 17'h00172;
      expv[24] = 17'h00142;
      expv[25] = 17'h00284;
      expv[26] = 17'h00604;
      expv[27] = 17'h00c08;
      expv[28] = 17'h01a12;
      expv[29] = 17'h00012;
      expv[30] = 17'h000c8;
      expv[31] = 17'h000c8;
      expv[32] = 17'h000c8;
      expv[33] = 17'h0007c;
      expv[34] = 17'h000f8;
      expv[35] = 17'h003f0;
      expv[36] = 17'h001f0;
      expv[37] = 17'h00050;
      expv[38] = 17'h00050;
      expv[39] = 17'h00050;
      expv[40] = 17'h002c8;
      expv[41] = 17'h00072;
      expv[42] = 17'h0015a;
      expv[43] = 17'h002b4;
      expv[44] = 17'h00534;
      expv[45] = 17'h00134;
      expv[46] = 17'h00068;
      expv[47] = 17'h000d0;
      expv[48] = 17'h000d0;
      expv[49] = 17'h000d0;
      expv[50] = 17'h000c8;
      expv[51] = 17'h000c8;
      expv[52] = 17'h00392;
      expv[53] = 17'h006e4;
      expv[54] = 17'h00f00;
      expv[55] = 17'h01e02;
      expv[56] = 17'h03ec2;
      expv[57] = 17'h00038;
      expv[58] = 17'h0015a;
      expv[59] = 17'h000ba;
      expv[60] = 17'h00124;
      expv[61] = 17'h00346;
      expv[62] = 17'h00028;
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
