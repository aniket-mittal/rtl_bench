// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 50;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_087235 dut (
    .clock(clk),
    .aresetn(in_vec[30:30]),
    .R_in(in_vec[29:20]),
    .G_in(in_vec[19:10]),
    .B_in(in_vec[9:0]),
    .current_x(out_vec[49:40]),
    .current_y(out_vec[39:30]),
    .ready(out_vec[29:29]),
    .vga_clk(out_vec[28:28]),
    .R_out(out_vec[27:20]),
    .G_out(out_vec[19:12]),
    .B_out(out_vec[11:4]),
    .h_sync(out_vec[3:3]),
    .v_sync(out_vec[2:2]),
    .blank_n(out_vec[1:1]),
    .sync_n(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h3f134cc2;
    stim[1] = 31'h36a201e6;
    stim[2] = 31'h7dcd80c7;
    stim[3] = 31'h71997ef2;
    stim[4] = 31'h4c51190c;
    stim[5] = 31'h7567eb9b;
    stim[6] = 31'h7d7a97b0;
    stim[7] = 31'h563ca5e6;
    stim[8] = 31'h4c4e864b;
    stim[9] = 31'h640637c7;
    stim[10] = 31'h26ba2dea;
    stim[11] = 31'h7eb135c4;
    stim[12] = 31'h6e9af9e7;
    stim[13] = 31'h57015f7f;
    stim[14] = 31'h5ab0fe9b;
    stim[15] = 31'h61d0bd6f;
    stim[16] = 31'h7477f772;
    stim[17] = 31'h7f41f7e8;
    stim[18] = 31'h4886fa57;
    stim[19] = 31'h6c70b6f9;
    stim[20] = 31'h40dad385;
    stim[21] = 31'h71291ad2;
    stim[22] = 31'h612ed331;
    stim[23] = 31'h43fc91b3;
    stim[24] = 31'h7356c8e3;
    stim[25] = 31'h7f68a3be;
    stim[26] = 31'h44584b0c;
    stim[27] = 31'h74504426;
    stim[28] = 31'h6fbf8453;
    stim[29] = 31'h6c097a19;
    stim[30] = 31'h4db67efc;
    stim[31] = 31'h661e2053;
    stim[32] = 31'h660b0bcd;
    stim[33] = 31'h447b2687;
    stim[34] = 31'h6127e1fc;
    stim[35] = 31'h799ee91c;
    stim[36] = 31'h6e76f50e;
    stim[37] = 31'h297faa27;
    stim[38] = 31'h5aebff49;
    stim[39] = 31'h56015c8d;
    stim[40] = 31'h52ab4971;
    stim[41] = 31'h5d18bc6a;
    stim[42] = 31'h568890d5;
    stim[43] = 31'h728ce292;
    stim[44] = 31'h76cb7fba;
    stim[45] = 31'h7f1e852b;
    stim[46] = 31'h5832827f;
    stim[47] = 31'h736881c2;
    stim[48] = 31'h5336acb3;
    stim[49] = 31'h4d7feeb0;
    stim[50] = 31'h472ff026;
    stim[51] = 31'h5aa5c95b;
    stim[52] = 31'h592d711b;
    stim[53] = 31'h4c287164;
    stim[54] = 31'h7c061b0e;
    stim[55] = 31'h50e0003b;
    stim[56] = 31'h7bc980a3;
    stim[57] = 31'h7322c737;
    stim[58] = 31'h7ff6bbfd;
    stim[59] = 31'h5e4e5335;
    stim[60] = 31'h75a51e7f;
    stim[61] = 31'h4b89891f;
    stim[62] = 31'h6b911fc9;
    stim[63] = 31'h6afa3570;
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
      expv[0] = 50'h000001000000d;
      expv[1] = 50'h000001000000d;
      expv[2] = 50'h000001000000d;
      expv[3] = 50'h000001000000d;
      expv[4] = 50'h000001000000d;
      expv[5] = 50'h000001000000d;
      expv[6] = 50'h000001000000d;
      expv[7] = 50'h000001000000d;
      expv[8] = 50'h000001000000d;
      expv[9] = 50'h000001000000d;
      expv[10] = 50'h000001000000d;
      expv[11] = 50'h000001000000d;
      expv[12] = 50'h000001000000d;
      expv[13] = 50'h000001000000d;
      expv[14] = 50'h000001000000d;
      expv[15] = 50'h000001000000d;
      expv[16] = 50'h000001000000d;
      expv[17] = 50'h000001000000d;
      expv[18] = 50'h000001000000d;
      expv[19] = 50'h000001000000d;
      expv[20] = 50'h000001000000d;
      expv[21] = 50'h000001000000d;
      expv[22] = 50'h000001000000d;
      expv[23] = 50'h000001000000d;
      expv[24] = 50'h000001000000d;
      expv[25] = 50'h000001000000d;
      expv[26] = 50'h000001000000d;
      expv[27] = 50'h000001000000d;
      expv[28] = 50'h0000010000005;
      expv[29] = 50'h0000010000005;
      expv[30] = 50'h0000010000005;
      expv[31] = 50'h0000010000005;
      expv[32] = 50'h0000010000005;
      expv[33] = 50'h0000010000005;
      expv[34] = 50'h0000010000005;
      expv[35] = 50'h0000010000005;
      expv[36] = 50'h0000010000005;
      expv[37] = 50'h000001000000d;
      expv[38] = 50'h000001000000d;
      expv[39] = 50'h000001000000d;
      expv[40] = 50'h000001000000d;
      expv[41] = 50'h000001000000d;
      expv[42] = 50'h000001000000d;
      expv[43] = 50'h000001000000d;
      expv[44] = 50'h000001000000d;
      expv[45] = 50'h000001000000d;
      expv[46] = 50'h000001000000d;
      expv[47] = 50'h000001000000d;
      expv[48] = 50'h000001000000d;
      expv[49] = 50'h000001000000d;
      expv[50] = 50'h000001000000d;
      expv[51] = 50'h000001000000d;
      expv[52] = 50'h000001000000d;
      expv[53] = 50'h000001000000d;
      expv[54] = 50'h000001000000d;
      expv[55] = 50'h0000010000005;
      expv[56] = 50'h0000010000005;
      expv[57] = 50'h0000010000005;
      expv[58] = 50'h0000010000005;
      expv[59] = 50'h0000010000005;
      expv[60] = 50'h0000010000005;
      expv[61] = 50'h0000010000005;
      expv[62] = 50'h0000010000005;
      expv[63] = 50'h0000010000005;
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
