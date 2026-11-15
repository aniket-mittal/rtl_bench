// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 71;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06823 dut (
    .clk(clk),
    .reset(in_vec[71:71]),
    .bv_valid(in_vec[70:70]),
    .bv(in_vec[69:6]),
    .count(in_vec[5:0]),
    .bv_out_valid(out_vec[70:70]),
    .bv_out(out_vec[69:6]),
    .count_out(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'ha5624a478229214687;
    stim[1] = 72'hbafe4fa876df987e65;
    stim[2] = 72'h60eba746baafd2c415;
    stim[3] = 72'h4f11f60b4a313eb2be;
    stim[4] = 72'h550db9398127ca823e;
    stim[5] = 72'h79904a6798848e07c7;
    stim[6] = 72'h4614c067999be477b5;
    stim[7] = 72'h1911e89c74c5726070;
    stim[8] = 72'h1495c10ee7c6e723ca;
    stim[9] = 72'h7d7b0bda0798da834c;
    stim[10] = 72'h46ddc473a8571d24fa;
    stim[11] = 72'h459a99ae49ae25f280;
    stim[12] = 72'h0f972d8f94764b6831;
    stim[13] = 72'h7eb98c0e41e11dfe45;
    stim[14] = 72'h025fa78a141e6ac71b;
    stim[15] = 72'h5f945bec8d22d43a7b;
    stim[16] = 72'h36a309bda366ff206f;
    stim[17] = 72'h29dabd0e081e434c77;
    stim[18] = 72'h715d489ce65f547dd1;
    stim[19] = 72'h423b65f5030ef3922b;
    stim[20] = 72'h75b2635fdbc1c0eb84;
    stim[21] = 72'h7acabb5e20853399bc;
    stim[22] = 72'h7690e40e0a2c994e19;
    stim[23] = 72'h6e00761fc3a26ec1b7;
    stim[24] = 72'h07d66fe505caa1b849;
    stim[25] = 72'h031317b3af6ad41752;
    stim[26] = 72'h2600991d1f75a1d9b9;
    stim[27] = 72'h7f6890bc8b311da46e;
    stim[28] = 72'h1d4da343ed0353de21;
    stim[29] = 72'h64c4f37c3f4f213d5e;
    stim[30] = 72'h6327d496d9cd5e295c;
    stim[31] = 72'h57893aac1ebddae563;
    stim[32] = 72'h0397579186ff8925b0;
    stim[33] = 72'h078210be19161182d5;
    stim[34] = 72'h1ce22c8bc231139edd;
    stim[35] = 72'h4b9832e8d4f8fbb69c;
    stim[36] = 72'h21f2e8ca406e71c6ed;
    stim[37] = 72'h37b2e64194452bd5c8;
    stim[38] = 72'h04523d616dd101a9e0;
    stim[39] = 72'h4b4466a57462bead3c;
    stim[40] = 72'h573029afbd4ab96611;
    stim[41] = 72'h79ced071a0ddf212f0;
    stim[42] = 72'h65b70e23e137fc744d;
    stim[43] = 72'h7c522b2d13b95714d8;
    stim[44] = 72'h57b8d9714e9831bab5;
    stim[45] = 72'h691cf84d385871f1df;
    stim[46] = 72'h0675a3d489f3dc84d2;
    stim[47] = 72'h7ada97e3bda1199e63;
    stim[48] = 72'h58920b2ca0b39dd32c;
    stim[49] = 72'h3f8072ee319c10c9be;
    stim[50] = 72'h715e20a291db66824d;
    stim[51] = 72'h110ca274cbaf1f02b3;
    stim[52] = 72'h3dec6efc63cf9b43e3;
    stim[53] = 72'h11f5d60c35255effab;
    stim[54] = 72'h7e050a5e7024055be9;
    stim[55] = 72'h17cd86104b80ae1967;
    stim[56] = 72'h69bd843fd3a82ab0ba;
    stim[57] = 72'h7acfc60fb00c8659ce;
    stim[58] = 72'h3a8f04f79ba40d2337;
    stim[59] = 72'h77dc663e915b8f71a8;
    stim[60] = 72'h6fc675de4260e85db5;
    stim[61] = 72'h1adf0136d2bade67f6;
    stim[62] = 72'h61cc71298916a3d394;
    stim[63] = 72'h6a3753716b103d5cd9;
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
      expv[0] = 71'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 71'h000000000000000000;
      expv[2] = 71'h000000000000000000;
      expv[3] = 71'h5075d3a35d57e96216;
      expv[4] = 71'h4788fb05a5189f597f;
      expv[5] = 71'h4a86dc9cc093e5413f;
      expv[6] = 71'h79904a6798848e07c7;
      expv[7] = 71'h430a6033cccdf23bf6;
      expv[8] = 71'h000000000000000000;
      expv[9] = 71'h000000000000000000;
      expv[10] = 71'h7d7b0bda0798da834c;
      expv[11] = 71'h46ddc473a8571d24fa;
      expv[12] = 71'h42cd4cd724d712f941;
      expv[13] = 71'h000000000000000000;
      expv[14] = 71'h7eb98c0e41e11dfe45;
      expv[15] = 71'h000000000000000000;
      expv[16] = 71'h5f945bec8d22d43a7b;
      expv[17] = 71'h000000000000000000;
      expv[18] = 71'h000000000000000000;
      expv[19] = 71'h715d489ce65f547dd1;
      expv[20] = 71'h411db2fa818779c92c;
      expv[21] = 71'h5ad931afede0e075c5;
      expv[22] = 71'h5d655daf104299ccfd;
      expv[23] = 71'h5b48720705164ca71a;
      expv[24] = 71'h57003b0fe1d13760f8;
      expv[25] = 71'h000000000000000000;
      expv[26] = 71'h000000000000000000;
      expv[27] = 71'h000000000000000000;
      expv[28] = 71'h7f6890bc8b311da46e;
      expv[29] = 71'h000000000000000000;
      expv[30] = 71'h64c4f37c3f4f213d5e;
      expv[31] = 71'h6327d496d9cd5e295c;
      expv[32] = 71'h57893aac1ebddae563;
      expv[33] = 71'h000000000000000000;
      expv[34] = 71'h000000000000000000;
      expv[35] = 71'h000000000000000000;
      expv[36] = 71'h45cc19746a7c7ddb5d;
      expv[37] = 71'h000000000000000000;
      expv[38] = 71'h000000000000000000;
      expv[39] = 71'h000000000000000000;
      expv[40] = 71'h45a23352ba315f56bd;
      expv[41] = 71'h4b9814d7dea55cb312;
      expv[42] = 71'h79ced071a0ddf212f0;
      expv[43] = 71'h65b70e23e137fc744d;
      expv[44] = 71'h7c522b2d13b95714d8;
      expv[45] = 71'h4bdc6cb8a74c18dd76;
      expv[46] = 71'h691cf84d385871f1df;
      expv[47] = 71'h000000000000000000;
      expv[48] = 71'h7ada97e3bda1199e63;
      expv[49] = 71'h4c4905965059cee9ad;
      expv[50] = 71'h000000000000000000;
      expv[51] = 71'h715e20a291db66824d;
      expv[52] = 71'h000000000000000000;
      expv[53] = 71'h000000000000000000;
      expv[54] = 71'h000000000000000000;
      expv[55] = 71'h7e050a5e7024055be9;
      expv[56] = 71'h000000000000000000;
      expv[57] = 71'h54dec21fe9d415587b;
      expv[58] = 71'h7acfc60fb00c8659ce;
      expv[59] = 71'h000000000000000000;
      expv[60] = 71'h5bee331f48adc7b8e9;
      expv[61] = 71'h57e33aef2130742ef6;
      expv[62] = 71'h000000000000000000;
      expv[63] = 71'h50e63894c48b51e9d5;
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
