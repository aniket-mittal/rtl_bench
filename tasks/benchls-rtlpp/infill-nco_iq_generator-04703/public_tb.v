// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04703 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h3ed30511;
    stim[1] = 31'h2c2ca4c0;
    stim[2] = 31'h76bdabf2;
    stim[3] = 31'h4dbf6ff6;
    stim[4] = 31'h68a0bc63;
    stim[5] = 31'h4f4eeb7b;
    stim[6] = 31'h4b7c3a36;
    stim[7] = 31'h54807e89;
    stim[8] = 31'h6d445853;
    stim[9] = 31'h6c77f7ff;
    stim[10] = 31'h729b9ed2;
    stim[11] = 31'h715492a3;
    stim[12] = 31'h7546a84c;
    stim[13] = 31'h75b06d2c;
    stim[14] = 31'h50ff05fc;
    stim[15] = 31'h6d6143f3;
    stim[16] = 31'h78cb0dd0;
    stim[17] = 31'h44c72e81;
    stim[18] = 31'h6992b745;
    stim[19] = 31'h3b25fb00;
    stim[20] = 31'h7a93a9cb;
    stim[21] = 31'h6864b59f;
    stim[22] = 31'h7dd68e9e;
    stim[23] = 31'h5e14ec8b;
    stim[24] = 31'h4bd38fb3;
    stim[25] = 31'h7f2d522b;
    stim[26] = 31'h5d383717;
    stim[27] = 31'h6ff09455;
    stim[28] = 31'h54f7db00;
    stim[29] = 31'h61e54661;
    stim[30] = 31'h7e9d1b61;
    stim[31] = 31'h6b2d8e6c;
    stim[32] = 31'h5dde823a;
    stim[33] = 31'h62fb98b8;
    stim[34] = 31'h76cb4101;
    stim[35] = 31'h7239363f;
    stim[36] = 31'h6fc5c966;
    stim[37] = 31'h7f669a2f;
    stim[38] = 31'h6c20a07b;
    stim[39] = 31'h5c961c7a;
    stim[40] = 31'h4a71d71c;
    stim[41] = 31'h7070146b;
    stim[42] = 31'h5b5ca6b5;
    stim[43] = 31'h640b9278;
    stim[44] = 31'h416b0653;
    stim[45] = 31'h69c2be4e;
    stim[46] = 31'h4f0907d1;
    stim[47] = 31'h5d532f26;
    stim[48] = 31'h5fb35938;
    stim[49] = 31'h7abc32f3;
    stim[50] = 31'h661e6c10;
    stim[51] = 31'h46e4ecfb;
    stim[52] = 31'h64531b80;
    stim[53] = 31'h615d4c6b;
    stim[54] = 31'h6e60ba8e;
    stim[55] = 31'h482419b2;
    stim[56] = 31'h442fd8c7;
    stim[57] = 31'h700efeb8;
    stim[58] = 31'h651d2bfb;
    stim[59] = 31'h6edecdd1;
    stim[60] = 31'h47a31476;
    stim[61] = 31'h24c4deee;
    stim[62] = 31'h5fb18103;
    stim[63] = 31'h772c08f2;
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
      expv[0] = 36'hxxxxxxxx9;
      expv[1] = 36'hxxxxxxxxe;
      expv[2] = 36'hxxxxxxxxc;
      expv[3] = 36'h000000001;
      expv[4] = 36'h000000004;
      expv[5] = 36'h000002473;
      expv[6] = 36'h00000247b;
      expv[7] = 36'h000002479;
      expv[8] = 36'h000002471;
      expv[9] = 36'h000005c66;
      expv[10] = 36'h0000029ab;
      expv[11] = 36'h00000362c;
      expv[12] = 36'h0000008c4;
      expv[13] = 36'h000001a1b;
      expv[14] = 36'h000002f5c;
      expv[15] = 36'h000002f59;
      expv[16] = 36'h000001603;
      expv[17] = 36'h000002363;
      expv[18] = 36'h00000236b;
      expv[19] = 36'h0000040fc;
      expv[20] = 36'h0000040fc;
      expv[21] = 36'h000000009;
      expv[22] = 36'h000001a93;
      expv[23] = 36'h0000022f9;
      expv[24] = 36'h0000022f1;
      expv[25] = 36'h0000022fb;
      expv[26] = 36'h000002ab1;
      expv[27] = 36'h000002ab6;
      expv[28] = 36'h00000271e;
      expv[29] = 36'h00000271e;
      expv[30] = 36'h000004c04;
      expv[31] = 36'h000000de6;
      expv[32] = 36'h000002c8c;
      expv[33] = 36'h000002c8c;
      expv[34] = 36'h000005594;
      expv[35] = 36'h000001883;
      expv[36] = 36'h000002f5e;
      expv[37] = 36'h000000194;
      expv[38] = 36'h000001153;
      expv[39] = 36'h0000030cc;
      expv[40] = 36'h0000030c9;
      expv[41] = 36'h0000030c6;
      expv[42] = 36'h0000063ee;
      expv[43] = 36'h0000063ee;
      expv[44] = 36'h000004fbc;
      expv[45] = 36'h000004fb9;
      expv[46] = 36'h000001524;
      expv[47] = 36'h00000152b;
      expv[48] = 36'h000001521;
      expv[49] = 36'h00000152b;
      expv[50] = 36'h000006afb;
      expv[51] = 36'h0000005be;
      expv[52] = 36'h0000005bc;
      expv[53] = 36'h0000012bc;
      expv[54] = 36'h000001711;
      expv[55] = 36'h000001864;
      expv[56] = 36'h000001864;
      expv[57] = 36'h000001863;
      expv[58] = 36'h00000332b;
      expv[59] = 36'h00000033c;
      expv[60] = 36'h000000849;
      expv[61] = 36'h00000084b;
      expv[62] = 36'h000000849;
      expv[63] = 36'h000000846;
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
