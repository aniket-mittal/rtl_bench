// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01680 dut (
    .state(in_vec[20:18]),
    .prefix(in_vec[17:17]),
    .need_modrm(in_vec[16:16]),
    .need_off(in_vec[15:15]),
    .need_imm(in_vec[14:14]),
    .end_seq(in_vec[13:13]),
    .ftype(in_vec[12:7]),
    .of(in_vec[6:6]),
    .next_in_opco(in_vec[5:5]),
    .next_in_exec(in_vec[4:4]),
    .block(in_vec[3:3]),
    .div_exc(in_vec[2:2]),
    .intr(in_vec[1:1]),
    .ifl(in_vec[0:0]),
    .next_state(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1879cf;
    stim[1] = 21'h0b722e;
    stim[2] = 21'h1aa46b;
    stim[3] = 21'h188f60;
    stim[4] = 21'h039b17;
    stim[5] = 21'h167a61;
    stim[6] = 21'h084e22;
    stim[7] = 21'h1b553c;
    stim[8] = 21'h1de406;
    stim[9] = 21'h1e1053;
    stim[10] = 21'h01214e;
    stim[11] = 21'h0ca8db;
    stim[12] = 21'h19e1d4;
    stim[13] = 21'h149efd;
    stim[14] = 21'h1df0fd;
    stim[15] = 21'h0d0196;
    stim[16] = 21'h1d6eba;
    stim[17] = 21'h0fd73b;
    stim[18] = 21'h02975a;
    stim[19] = 21'h1c211c;
    stim[20] = 21'h1aa865;
    stim[21] = 21'h0e6f42;
    stim[22] = 21'h10d5a2;
    stim[23] = 21'h1917c9;
    stim[24] = 21'h07826f;
    stim[25] = 21'h1cd296;
    stim[26] = 21'h0da4b4;
    stim[27] = 21'h1da4dc;
    stim[28] = 21'h018f04;
    stim[29] = 21'h06dc5f;
    stim[30] = 21'h01e5d4;
    stim[31] = 21'h0dc7e5;
    stim[32] = 21'h166f5c;
    stim[33] = 21'h13541f;
    stim[34] = 21'h08db98;
    stim[35] = 21'h1bc57f;
    stim[36] = 21'h163e30;
    stim[37] = 21'h1afe14;
    stim[38] = 21'h03a9c0;
    stim[39] = 21'h1e79c6;
    stim[40] = 21'h0ac6a0;
    stim[41] = 21'h14087f;
    stim[42] = 21'h042b71;
    stim[43] = 21'h19075c;
    stim[44] = 21'h0f214c;
    stim[45] = 21'h1ad827;
    stim[46] = 21'h0a11de;
    stim[47] = 21'h112b36;
    stim[48] = 21'h119d71;
    stim[49] = 21'h119322;
    stim[50] = 21'h1a877e;
    stim[51] = 21'h1a543b;
    stim[52] = 21'h1ac7c7;
    stim[53] = 21'h0c6c3d;
    stim[54] = 21'h004a4b;
    stim[55] = 21'h1e5466;
    stim[56] = 21'h0e72f4;
    stim[57] = 21'h1ecbbb;
    stim[58] = 21'h1657fa;
    stim[59] = 21'h1a56ba;
    stim[60] = 21'h1a1d16;
    stim[61] = 21'h1fc5a4;
    stim[62] = 21'h1832c2;
    stim[63] = 21'h019496;
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
      expv[0] = 3'h6;
      expv[1] = 3'h2;
      expv[2] = 3'h6;
      expv[3] = 3'h4;
      expv[4] = 3'h0;
      expv[5] = 3'h0;
      expv[6] = 3'h3;
      expv[7] = 3'h6;
      expv[8] = 3'h4;
      expv[9] = 3'h4;
      expv[10] = 3'h0;
      expv[11] = 3'h3;
      expv[12] = 3'h4;
      expv[13] = 3'h5;
      expv[14] = 3'h7;
      expv[15] = 3'h4;
      expv[16] = 3'h7;
      expv[17] = 3'h3;
      expv[18] = 3'h0;
      expv[19] = 3'h7;
      expv[20] = 3'h4;
      expv[21] = 3'h4;
      expv[22] = 3'h4;
      expv[23] = 3'h6;
      expv[24] = 3'h1;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h7;
      expv[28] = 3'h1;
      expv[29] = 3'h1;
      expv[30] = 3'h1;
      expv[31] = 3'h4;
      expv[32] = 3'h5;
      expv[33] = 3'h4;
      expv[34] = 3'h2;
      expv[35] = 3'h6;
      expv[36] = 3'h4;
      expv[37] = 3'h4;
      expv[38] = 3'h0;
      expv[39] = 3'h4;
      expv[40] = 3'h3;
      expv[41] = 3'h5;
      expv[42] = 3'h4;
      expv[43] = 3'h6;
      expv[44] = 3'h3;
      expv[45] = 3'h4;
      expv[46] = 3'h2;
      expv[47] = 3'h4;
      expv[48] = 3'h4;
      expv[49] = 3'h4;
      expv[50] = 3'h6;
      expv[51] = 3'h6;
      expv[52] = 3'h4;
      expv[53] = 3'h3;
      expv[54] = 3'h0;
      expv[55] = 3'h4;
      expv[56] = 3'h4;
      expv[57] = 3'h7;
      expv[58] = 3'h5;
      expv[59] = 3'h6;
      expv[60] = 3'h4;
      expv[61] = 3'h4;
      expv[62] = 3'h0;
      expv[63] = 3'h1;
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
