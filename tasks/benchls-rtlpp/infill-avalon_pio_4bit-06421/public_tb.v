// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06421 dut (
    .clk(clk),
    .address(in_vec[12:11]),
    .chipselect(in_vec[10:10]),
    .in_port(in_vec[9:6]),
    .reset_n(in_vec[5:5]),
    .write_n(in_vec[4:4]),
    .writedata(in_vec[3:0]),
    .irq(out_vec[8:8]),
    .out_port(out_vec[7:4]),
    .readdata(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0e0a;
    stim[1] = 13'h0917;
    stim[2] = 13'h007d;
    stim[3] = 13'h1ce2;
    stim[4] = 13'h1022;
    stim[5] = 13'h1d63;
    stim[6] = 13'h1632;
    stim[7] = 13'h1e20;
    stim[8] = 13'h08b5;
    stim[9] = 13'h15f1;
    stim[10] = 13'h1ce8;
    stim[11] = 13'h1b2a;
    stim[12] = 13'h05b0;
    stim[13] = 13'h1f34;
    stim[14] = 13'h137d;
    stim[15] = 13'h1172;
    stim[16] = 13'h0439;
    stim[17] = 13'h113a;
    stim[18] = 13'h00b8;
    stim[19] = 13'h1d31;
    stim[20] = 13'h027b;
    stim[21] = 13'h1777;
    stim[22] = 13'h05e6;
    stim[23] = 13'h1536;
    stim[24] = 13'h0b64;
    stim[25] = 13'h03bf;
    stim[26] = 13'h1b7a;
    stim[27] = 13'h0be9;
    stim[28] = 13'h15b9;
    stim[29] = 13'h1470;
    stim[30] = 13'h06e8;
    stim[31] = 13'h12ea;
    stim[32] = 13'h0832;
    stim[33] = 13'h10e1;
    stim[34] = 13'h057c;
    stim[35] = 13'h08a1;
    stim[36] = 13'h0fbd;
    stim[37] = 13'h017c;
    stim[38] = 13'h0b34;
    stim[39] = 13'h08e0;
    stim[40] = 13'h01f0;
    stim[41] = 13'h1337;
    stim[42] = 13'h172b;
    stim[43] = 13'h1cea;
    stim[44] = 13'h0be0;
    stim[45] = 13'h09fe;
    stim[46] = 13'h1fb0;
    stim[47] = 13'h087c;
    stim[48] = 13'h013a;
    stim[49] = 13'h063a;
    stim[50] = 13'h04f6;
    stim[51] = 13'h18aa;
    stim[52] = 13'h0cf8;
    stim[53] = 13'h0e38;
    stim[54] = 13'h12ff;
    stim[55] = 13'h19bd;
    stim[56] = 13'h1038;
    stim[57] = 13'h14ae;
    stim[58] = 13'h1c65;
    stim[59] = 13'h1e21;
    stim[60] = 13'h1263;
    stim[61] = 13'h18ae;
    stim[62] = 13'h19f3;
    stim[63] = 13'h0170;
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
      expv[3] = 9'h001;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h002;
      expv[7] = 9'h000;
      expv[8] = 9'h005;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h00a;
      expv[12] = 9'h000;
      expv[13] = 9'h006;
      expv[14] = 9'h00f;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h002;
      expv[20] = 9'h00f;
      expv[21] = 9'h009;
      expv[22] = 9'h000;
      expv[23] = 9'h067;
      expv[24] = 9'h060;
      expv[25] = 9'h060;
      expv[26] = 9'h06e;
      expv[27] = 9'h06f;
      expv[28] = 9'h060;
      expv[29] = 9'h060;
      expv[30] = 9'h060;
      expv[31] = 9'h08b;
      expv[32] = 9'h080;
      expv[33] = 9'h080;
      expv[34] = 9'h080;
      expv[35] = 9'h085;
      expv[36] = 9'h080;
      expv[37] = 9'h080;
      expv[38] = 9'h085;
      expv[39] = 9'h080;
      expv[40] = 9'h080;
      expv[41] = 9'h087;
      expv[42] = 9'h080;
      expv[43] = 9'h180;
      expv[44] = 9'h08f;
      expv[45] = 9'h180;
      expv[46] = 9'h180;
      expv[47] = 9'h18f;
      expv[48] = 9'h180;
      expv[49] = 9'h184;
      expv[50] = 9'h188;
      expv[51] = 9'h183;
      expv[52] = 9'h18f;
      expv[53] = 9'h180;
      expv[54] = 9'h180;
      expv[55] = 9'h18b;
      expv[56] = 9'h18f;
      expv[57] = 9'h18b;
      expv[58] = 9'h18b;
      expv[59] = 9'h08f;
      expv[60] = 9'h080;
      expv[61] = 9'h18e;
      expv[62] = 9'h189;
      expv[63] = 9'h189;
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
