// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_121703 dut (
    .clk(clk),
    .rst_n(in_vec[19:19]),
    .in_valid(in_vec[18:18]),
    .in_data(in_vec[17:2]),
    .curr_mode(in_vec[1:0]),
    .out_valid(out_vec[8:8]),
    .out_dist(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h59ccb;
    stim[1] = 20'h25c15;
    stim[2] = 20'h88674;
    stim[3] = 20'h89422;
    stim[4] = 20'hda67d;
    stim[5] = 20'hf5ae0;
    stim[6] = 20'h88e0e;
    stim[7] = 20'hd4363;
    stim[8] = 20'ha3ac5;
    stim[9] = 20'hf19dd;
    stim[10] = 20'hde553;
    stim[11] = 20'h8fc84;
    stim[12] = 20'hcba3c;
    stim[13] = 20'he28ab;
    stim[14] = 20'h885ef;
    stim[15] = 20'he9e09;
    stim[16] = 20'hcf60b;
    stim[17] = 20'hb16c3;
    stim[18] = 20'h8fcdd;
    stim[19] = 20'hf9ec2;
    stim[20] = 20'hf00b1;
    stim[21] = 20'hf1f8f;
    stim[22] = 20'hba6cc;
    stim[23] = 20'hdc904;
    stim[24] = 20'hafeee;
    stim[25] = 20'hc69f3;
    stim[26] = 20'hf5527;
    stim[27] = 20'hca8b9;
    stim[28] = 20'h99df5;
    stim[29] = 20'h8092e;
    stim[30] = 20'h8e1f1;
    stim[31] = 20'h9d6ea;
    stim[32] = 20'hb15e0;
    stim[33] = 20'hf024f;
    stim[34] = 20'he8e82;
    stim[35] = 20'h98d63;
    stim[36] = 20'hf31bb;
    stim[37] = 20'hb447a;
    stim[38] = 20'hc8634;
    stim[39] = 20'had038;
    stim[40] = 20'ha63b2;
    stim[41] = 20'hc239b;
    stim[42] = 20'hc4913;
    stim[43] = 20'h9815d;
    stim[44] = 20'h98ce3;
    stim[45] = 20'hb2aea;
    stim[46] = 20'h9e3d6;
    stim[47] = 20'h92efb;
    stim[48] = 20'hf4390;
    stim[49] = 20'hba7bb;
    stim[50] = 20'hb13a2;
    stim[51] = 20'ha6bc5;
    stim[52] = 20'haced4;
    stim[53] = 20'h8a26e;
    stim[54] = 20'h9e984;
    stim[55] = 20'he8b23;
    stim[56] = 20'ha5f38;
    stim[57] = 20'h1140b;
    stim[58] = 20'h9704c;
    stim[59] = 20'hc23e2;
    stim[60] = 20'he073a;
    stim[61] = 20'hbc6c5;
    stim[62] = 20'hf2b3c;
    stim[63] = 20'h8fac1;
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
      expv[0] = 9'h001;
      expv[1] = 9'h001;
      expv[2] = 9'h001;
      expv[3] = 9'h001;
      expv[4] = 9'h001;
      expv[5] = 9'h001;
      expv[6] = 9'h001;
      expv[7] = 9'h001;
      expv[8] = 9'h001;
      expv[9] = 9'h001;
      expv[10] = 9'h001;
      expv[11] = 9'h002;
      expv[12] = 9'h002;
      expv[13] = 9'h002;
      expv[14] = 9'h002;
      expv[15] = 9'h006;
      expv[16] = 9'h006;
      expv[17] = 9'h006;
      expv[18] = 9'h009;
      expv[19] = 9'h009;
      expv[20] = 9'h00b;
      expv[21] = 9'h00b;
      expv[22] = 9'h00b;
      expv[23] = 9'h00b;
      expv[24] = 9'h00b;
      expv[25] = 9'h00b;
      expv[26] = 9'h00b;
      expv[27] = 9'h00b;
      expv[28] = 9'h00b;
      expv[29] = 9'h00b;
      expv[30] = 9'h015;
      expv[31] = 9'h015;
      expv[32] = 9'h015;
      expv[33] = 9'h015;
      expv[34] = 9'h015;
      expv[35] = 9'h015;
      expv[36] = 9'h015;
      expv[37] = 9'h015;
      expv[38] = 9'h015;
      expv[39] = 9'h015;
      expv[40] = 9'h015;
      expv[41] = 9'h015;
      expv[42] = 9'h015;
      expv[43] = 9'h015;
      expv[44] = 9'h015;
      expv[45] = 9'h015;
      expv[46] = 9'h015;
      expv[47] = 9'h015;
      expv[48] = 9'h015;
      expv[49] = 9'h015;
      expv[50] = 9'h015;
      expv[51] = 9'h015;
      expv[52] = 9'h015;
      expv[53] = 9'h015;
      expv[54] = 9'h015;
      expv[55] = 9'h015;
      expv[56] = 9'h015;
      expv[57] = 9'h001;
      expv[58] = 9'h001;
      expv[59] = 9'h001;
      expv[60] = 9'h001;
      expv[61] = 9'h001;
      expv[62] = 9'h001;
      expv[63] = 9'h001;
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
