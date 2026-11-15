// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063852 dut (
    .clk(clk),
    .rst(in_vec[35:35]),
    .din(in_vec[34:3]),
    .din_last(in_vec[2:2]),
    .din_valid(in_vec[1:1]),
    .dout_ready(in_vec[0:0]),
    .din_ready(out_vec[34:34]),
    .dout(out_vec[33:2]),
    .dout_last(out_vec[1:1]),
    .dout_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hcd9d824dc;
    stim[1] = 36'hdc41a0e3c;
    stim[2] = 36'h12854f41d;
    stim[3] = 36'h2fdd311a8;
    stim[4] = 36'h1e98d40aa;
    stim[5] = 36'h773216c3e;
    stim[6] = 36'h6fd440059;
    stim[7] = 36'h425c4f4b0;
    stim[8] = 36'h488511179;
    stim[9] = 36'h60f381f00;
    stim[10] = 36'h09f89b194;
    stim[11] = 36'h607a49273;
    stim[12] = 36'h7a1ca2d49;
    stim[13] = 36'h236bced77;
    stim[14] = 36'h72017c60e;
    stim[15] = 36'h669dc3da8;
    stim[16] = 36'h5115c52da;
    stim[17] = 36'h0197fed1e;
    stim[18] = 36'h67df71f6f;
    stim[19] = 36'h5b1873d1e;
    stim[20] = 36'h0e90f2c76;
    stim[21] = 36'h74b9c8bba;
    stim[22] = 36'h522eb352a;
    stim[23] = 36'h2e15a718b;
    stim[24] = 36'h3de2d1882;
    stim[25] = 36'h24e8760b1;
    stim[26] = 36'h2051ce7b1;
    stim[27] = 36'h45a1ef1a6;
    stim[28] = 36'h2c4d86e5c;
    stim[29] = 36'h1cd829e55;
    stim[30] = 36'h500b2cfef;
    stim[31] = 36'h4a814b013;
    stim[32] = 36'h4c8a20d78;
    stim[33] = 36'h6917c628f;
    stim[34] = 36'h48b69786f;
    stim[35] = 36'h3cfcfd679;
    stim[36] = 36'h6238db065;
    stim[37] = 36'h21eafe1b4;
    stim[38] = 36'h6ba7e11d3;
    stim[39] = 36'h765470250;
    stim[40] = 36'h705676a16;
    stim[41] = 36'h7bb31b896;
    stim[42] = 36'h5713df9a9;
    stim[43] = 36'h09ce47d45;
    stim[44] = 36'ha52bd9c01;
    stim[45] = 36'h2549aabbc;
    stim[46] = 36'h3fe794fbf;
    stim[47] = 36'h59f0b0ced;
    stim[48] = 36'h49d04d52a;
    stim[49] = 36'h02ec0e49e;
    stim[50] = 36'h15e2936a5;
    stim[51] = 36'h08f0e4434;
    stim[52] = 36'h0a5e63020;
    stim[53] = 36'h4908071be;
    stim[54] = 36'h3971a9859;
    stim[55] = 36'h1b6c9749f;
    stim[56] = 36'h4318dfcac;
    stim[57] = 36'h55ec31a9c;
    stim[58] = 36'h42b35681d;
    stim[59] = 36'h2c2597308;
    stim[60] = 36'h11e116330;
    stim[61] = 36'h7e9b052be;
    stim[62] = 36'h70edb2e10;
    stim[63] = 36'h235003fc1;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'h400000000;
      expv[2] = 35'h400000000;
      expv[3] = 35'h400000000;
      expv[4] = 35'h400000000;
      expv[5] = 35'h0f4c6a055;
      expv[6] = 35'h4f4c6a055;
      expv[7] = 35'h4f4c6a054;
      expv[8] = 35'h4f4c6a054;
      expv[9] = 35'h4f4c6a054;
      expv[10] = 35'h4f4c6a054;
      expv[11] = 35'h4f4c6a054;
      expv[12] = 35'h703d24939;
      expv[13] = 35'h703d24938;
      expv[14] = 35'h11b5e76bb;
      expv[15] = 35'h11b5e76bb;
      expv[16] = 35'h11b5e76bb;
      expv[17] = 35'h11b5e76bb;
      expv[18] = 35'h51b5e76bb;
      expv[19] = 35'h33efb8fb7;
      expv[20] = 35'h33efb8fb7;
      expv[21] = 35'h33efb8fb7;
      expv[22] = 35'h33efb8fb7;
      expv[23] = 35'h73efb8fb7;
      expv[24] = 35'h170ad38c5;
      expv[25] = 35'h570ad38c5;
      expv[26] = 35'h570ad38c4;
      expv[27] = 35'h570ad38c4;
      expv[28] = 35'h22d0f78d3;
      expv[29] = 35'h62d0f78d3;
      expv[30] = 35'h62d0f78d2;
      expv[31] = 35'h6805967f7;
      expv[32] = 35'h2540a5809;
      expv[33] = 35'h6540a5809;
      expv[34] = 35'h748be3147;
      expv[35] = 35'h645b4bc37;
      expv[36] = 35'h645b4bc36;
      expv[37] = 35'h645b4bc36;
      expv[38] = 35'h645b4bc36;
      expv[39] = 35'h35d3f08e9;
      expv[40] = 35'h35d3f08e9;
      expv[41] = 35'h35d3f08e9;
      expv[42] = 35'h75d3f08e9;
      expv[43] = 35'h75d3f08e8;
      expv[44] = 35'h75d3f08e8;
      expv[45] = 35'h400000000;
      expv[46] = 35'h400000000;
      expv[47] = 35'h5ff3ca7df;
      expv[48] = 35'h5ff3ca7de;
      expv[49] = 35'h24e826a95;
      expv[50] = 35'h64e826a95;
      expv[51] = 35'h64e826a94;
      expv[52] = 35'h64e826a94;
      expv[53] = 35'h64e826a94;
      expv[54] = 35'h6484038df;
      expv[55] = 35'h6484038de;
      expv[56] = 35'h0db64ba4f;
      expv[57] = 35'h0db64ba4f;
      expv[58] = 35'h4db64ba4f;
      expv[59] = 35'h4db64ba4e;
      expv[60] = 35'h4db64ba4e;
      expv[61] = 35'h4db64ba4e;
      expv[62] = 35'h3f4d8295f;
      expv[63] = 35'h7f4d8295f;
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
