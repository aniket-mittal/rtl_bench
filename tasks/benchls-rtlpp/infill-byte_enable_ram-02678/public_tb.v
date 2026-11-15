// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02678 dut (
    .clk(clk),
    .rst(in_vec[46:46]),
    .addr(in_vec[45:37]),
    .en(in_vec[36:36]),
    .we(in_vec[35:32]),
    .datain(in_vec[31:0]),
    .dataout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h76f295ec1930;
    stim[1] = 47'h5425c49ef1fc;
    stim[2] = 47'h33c397fe0733;
    stim[3] = 47'h35f4d2456b76;
    stim[4] = 47'h30255ebd595f;
    stim[5] = 47'h3cbeca4cb296;
    stim[6] = 47'h1ead78db5d3f;
    stim[7] = 47'h3846c5d162e6;
    stim[8] = 47'h34c0605055fd;
    stim[9] = 47'h0f1aa55a095a;
    stim[10] = 47'h1bf4a0b284eb;
    stim[11] = 47'h1cf0c3786526;
    stim[12] = 47'h0c66a09612ec;
    stim[13] = 47'h314fe82c79f4;
    stim[14] = 47'h2f5e119ef92e;
    stim[15] = 47'h1afe7ea75ad0;
    stim[16] = 47'h011cfb38db21;
    stim[17] = 47'h29c56d452235;
    stim[18] = 47'h27fac40703b1;
    stim[19] = 47'h0cec0b1c8f25;
    stim[20] = 47'h3ffa5a0ca2f8;
    stim[21] = 47'h3b07209d8303;
    stim[22] = 47'h3f733e458820;
    stim[23] = 47'h1638d92dbf78;
    stim[24] = 47'h396b33677af9;
    stim[25] = 47'h1ad7488fd79d;
    stim[26] = 47'h3a2c1f3d5829;
    stim[27] = 47'h2ca1d15003eb;
    stim[28] = 47'h075eb3d7d437;
    stim[29] = 47'h30ec5159702a;
    stim[30] = 47'h1a75b2297c6c;
    stim[31] = 47'h2b7165570dd8;
    stim[32] = 47'h357bf6eb1bca;
    stim[33] = 47'h25a4ca470e82;
    stim[34] = 47'h3584fae450bb;
    stim[35] = 47'h140456f7b2b4;
    stim[36] = 47'h26d310c1a58a;
    stim[37] = 47'h33b62d33c019;
    stim[38] = 47'h253bf349f395;
    stim[39] = 47'h172386581ab6;
    stim[40] = 47'h115f360fe8fe;
    stim[41] = 47'h29c96fde26fa;
    stim[42] = 47'h1d515bf5e664;
    stim[43] = 47'h0f86f98c0090;
    stim[44] = 47'h16533bf29090;
    stim[45] = 47'h3990f3ab2aeb;
    stim[46] = 47'h32901d05a4dd;
    stim[47] = 47'h278e4a211ec4;
    stim[48] = 47'h396de99cf424;
    stim[49] = 47'h36aa43f14ebd;
    stim[50] = 47'h1489ae1cfe7b;
    stim[51] = 47'h1128ef71e651;
    stim[52] = 47'h04d14959a63f;
    stim[53] = 47'h221d3b31d55a;
    stim[54] = 47'h33c074cd1947;
    stim[55] = 47'h11db445873ee;
    stim[56] = 47'h3b75da075700;
    stim[57] = 47'h2b1aa33bf723;
    stim[58] = 47'h108f63744aaf;
    stim[59] = 47'h212826521cee;
    stim[60] = 47'h0bec7d667c00;
    stim[61] = 47'h38090effc6fe;
    stim[62] = 47'h15d2adcec330;
    stim[63] = 47'h1db424501a2c;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'hxxxxxxxx;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'hxxxxxxxx;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'hxxxxxxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'hxxxxxxxx;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'hxxxxxxxx;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
