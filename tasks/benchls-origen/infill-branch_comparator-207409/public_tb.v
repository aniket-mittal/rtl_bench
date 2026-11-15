// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_207409 dut (
    .rs1_out(in_vec[64:33]),
    .rs2_out(in_vec[32:1]),
    .BrUn(in_vec[0:0]),
    .BrEq(out_vec[1:1]),
    .BrLT(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h0a2e6ddd4d05c4625;
    stim[1] = 65'h1ab732f072f57d9d5;
    stim[2] = 65'h1cdcdb9bc31bbf128;
    stim[3] = 65'h1879a81978e8075dc;
    stim[4] = 65'h041c5d7f3c3efbbf5;
    stim[5] = 65'h198fa782c1b3dc981;
    stim[6] = 65'h14f38b13471703a72;
    stim[7] = 65'h08adb7d8ff3df6fc7;
    stim[8] = 65'h1226f52c03ac8eb65;
    stim[9] = 65'h020b40eb51d274669;
    stim[10] = 65'h195a5fd55c4120b3a;
    stim[11] = 65'h1859ab403c6846594;
    stim[12] = 65'h053299f16748bdfcd;
    stim[13] = 65'h02a9f6c828801b2d8;
    stim[14] = 65'h15857e9abf170801e;
    stim[15] = 65'h156e6f5e4d82d6c78;
    stim[16] = 65'h1a0263342cb15cd30;
    stim[17] = 65'h0b72902bfb81f6e20;
    stim[18] = 65'h0613126bb5b6759fd;
    stim[19] = 65'h0f100ca9cbb480632;
    stim[20] = 65'h19ac21dbc3143c4b0;
    stim[21] = 65'h0a3f3dc751d355bd7;
    stim[22] = 65'h04390c76094037357;
    stim[23] = 65'h0f38dee1dcc736a5b;
    stim[24] = 65'h1637ede57cc7e88d9;
    stim[25] = 65'h16ac1e5b7aa1f2e02;
    stim[26] = 65'h12f9cf3c6f647a255;
    stim[27] = 65'h161c377d7d4e435b8;
    stim[28] = 65'h055da094baa4f586e;
    stim[29] = 65'h03bd853e93d01728c;
    stim[30] = 65'h09358ec00c887525b;
    stim[31] = 65'h1fe5be3e471eb96d3;
    stim[32] = 65'h0750c5eb131f1004a;
    stim[33] = 65'h0726f5b9a85a49926;
    stim[34] = 65'h020d0b3c0c8040391;
    stim[35] = 65'h16d5aef1b0a62922f;
    stim[36] = 65'h17423f1f39951c3b6;
    stim[37] = 65'h04f8d32a4f97123d9;
    stim[38] = 65'h1f8cb9f02cd91fbaf;
    stim[39] = 65'h0a74a4d079f76b9d2;
    stim[40] = 65'h07ede60466c04dc12;
    stim[41] = 65'h06b650642a3b21776;
    stim[42] = 65'h1592f6946f0146e70;
    stim[43] = 65'h1e5118947f483c208;
    stim[44] = 65'h066d3369dc54ee40a;
    stim[45] = 65'h08ebb509798ab0133;
    stim[46] = 65'h17b9ea854ec3c1033;
    stim[47] = 65'h17a7a15d52897fe5a;
    stim[48] = 65'h191fc4dab0c2df94d;
    stim[49] = 65'h0ddcc14433b0c2221;
    stim[50] = 65'h0bfeee08f417caa69;
    stim[51] = 65'h0082c6b5104ff5140;
    stim[52] = 65'h06f19ee553498d6aa;
    stim[53] = 65'h13b8304a0b57a71e1;
    stim[54] = 65'h0066867e41b47a5a8;
    stim[55] = 65'h12cf21778c9243804;
    stim[56] = 65'h002a9654d173455fa;
    stim[57] = 65'h151dc5218b10e86ac;
    stim[58] = 65'h1a3c9e510534fd590;
    stim[59] = 65'h09fe716f22f8e95ac;
    stim[60] = 65'h1bc8b3a77ebebbdbe;
    stim[61] = 65'h00b61be909b58b07b;
    stim[62] = 65'h1d7a26bae3decfe66;
    stim[63] = 65'h0ccb5e99252d11be1;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 2'h1;
      expv[1] = 2'h0;
      expv[2] = 2'h1;
      expv[3] = 2'h1;
      expv[4] = 2'h0;
      expv[5] = 2'h1;
      expv[6] = 2'h1;
      expv[7] = 2'h0;
      expv[8] = 2'h1;
      expv[9] = 2'h0;
      expv[10] = 2'h1;
      expv[11] = 2'h1;
      expv[12] = 2'h1;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h1;
      expv[21] = 2'h0;
      expv[22] = 2'h1;
      expv[23] = 2'h0;
      expv[24] = 2'h1;
      expv[25] = 2'h1;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h1;
      expv[31] = 2'h1;
      expv[32] = 2'h0;
      expv[33] = 2'h1;
      expv[34] = 2'h1;
      expv[35] = 2'h0;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h1;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h1;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h1;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h1;
      expv[54] = 2'h1;
      expv[55] = 2'h1;
      expv[56] = 2'h0;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h0;
      expv[60] = 2'h1;
      expv[61] = 2'h1;
      expv[62] = 2'h1;
      expv[63] = 2'h0;
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
