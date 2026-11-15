// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_088668 dut (
    .clk(clk),
    .data_out_sign(in_vec[17:17]),
    .point_address(in_vec[16:10]),
    .clk_dstb(in_vec[9:9]),
    .reset(in_vec[8:8]),
    .address_L0(in_vec[7:0]),
    .address_out(out_vec[16:5]),
    .read_en(out_vec[4:4]),
    .mux_control(out_vec[3:2]),
    .dstb(out_vec[1:1]),
    .trsf(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2d15c;
    stim[1] = 18'h3632f;
    stim[2] = 18'h0a62e;
    stim[3] = 18'h10000;
    stim[4] = 18'h32603;
    stim[5] = 18'h012a1;
    stim[6] = 18'h212c3;
    stim[7] = 18'h23b94;
    stim[8] = 18'h1c225;
    stim[9] = 18'h1449e;
    stim[10] = 18'h312f2;
    stim[11] = 18'h07c2f;
    stim[12] = 18'h1f08e;
    stim[13] = 18'h3a257;
    stim[14] = 18'h07459;
    stim[15] = 18'h098b4;
    stim[16] = 18'h308e6;
    stim[17] = 18'h242e7;
    stim[18] = 18'h18c11;
    stim[19] = 18'h174f8;
    stim[20] = 18'h202ad;
    stim[21] = 18'h2a88a;
    stim[22] = 18'h0a2f2;
    stim[23] = 18'h03881;
    stim[24] = 18'h1d952;
    stim[25] = 18'h1c564;
    stim[26] = 18'h2b1fc;
    stim[27] = 18'h0ac10;
    stim[28] = 18'h2aa35;
    stim[29] = 18'h21231;
    stim[30] = 18'h29c52;
    stim[31] = 18'h3d0b5;
    stim[32] = 18'h034c4;
    stim[33] = 18'h10c3a;
    stim[34] = 18'h20635;
    stim[35] = 18'h35417;
    stim[36] = 18'h23ea1;
    stim[37] = 18'h14a05;
    stim[38] = 18'h12097;
    stim[39] = 18'h030d4;
    stim[40] = 18'h1f864;
    stim[41] = 18'h3e029;
    stim[42] = 18'h09217;
    stim[43] = 18'h28c2b;
    stim[44] = 18'h01037;
    stim[45] = 18'h1ca2d;
    stim[46] = 18'h2f653;
    stim[47] = 18'h20084;
    stim[48] = 18'h118a8;
    stim[49] = 18'h1f6b8;
    stim[50] = 18'h1223e;
    stim[51] = 18'h2906d;
    stim[52] = 18'h1f853;
    stim[53] = 18'h0283a;
    stim[54] = 18'h00812;
    stim[55] = 18'h18098;
    stim[56] = 18'h294fd;
    stim[57] = 18'h208ca;
    stim[58] = 18'h36ae8;
    stim[59] = 18'h28c36;
    stim[60] = 18'h32afd;
    stim[61] = 18'h02a58;
    stim[62] = 18'h36862;
    stim[63] = 18'h08e46;
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
      expv[0] = 17'h00010;
      expv[1] = 17'h0ba10;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00010;
      expv[5] = 17'h00000;
      expv[6] = 17'h00010;
      expv[7] = 17'h00010;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00010;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00010;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00010;
      expv[17] = 17'h00010;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h00010;
      expv[21] = 17'h00010;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h0a600;
      expv[26] = 17'h0ca10;
      expv[27] = 17'h00000;
      expv[28] = 17'h00010;
      expv[29] = 17'h00010;
      expv[30] = 17'h00010;
      expv[31] = 17'h00010;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00010;
      expv[35] = 17'h00010;
      expv[36] = 17'h00010;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h00000;
      expv[40] = 17'h00000;
      expv[41] = 17'h00010;
      expv[42] = 17'h00000;
      expv[43] = 17'h00010;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h00010;
      expv[47] = 17'h00010;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00010;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00010;
      expv[57] = 17'h00010;
      expv[58] = 17'h00010;
      expv[59] = 17'h00010;
      expv[60] = 17'h00010;
      expv[61] = 17'h00000;
      expv[62] = 17'h00010;
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
