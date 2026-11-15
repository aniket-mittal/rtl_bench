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

  rtlpp_09668 dut (
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
    stim[0] = 31'h2f048cc5;
    stim[1] = 31'h1f907857;
    stim[2] = 31'h54d4b3f8;
    stim[3] = 31'h6eaf3b03;
    stim[4] = 31'h48ac4726;
    stim[5] = 31'h717943a0;
    stim[6] = 31'h6ce2db3b;
    stim[7] = 31'h73501d8e;
    stim[8] = 31'h42d1c7d3;
    stim[9] = 31'h42f161a9;
    stim[10] = 31'h42e465e0;
    stim[11] = 31'h7b890bf5;
    stim[12] = 31'h7568de98;
    stim[13] = 31'h593a79bf;
    stim[14] = 31'h1da3473c;
    stim[15] = 31'h54d54fe9;
    stim[16] = 31'h69282504;
    stim[17] = 31'h6f9a6b66;
    stim[18] = 31'h5991022c;
    stim[19] = 31'h66254bfd;
    stim[20] = 31'h60e31635;
    stim[21] = 31'h68c439a3;
    stim[22] = 31'h5109ea2f;
    stim[23] = 31'h5b770e26;
    stim[24] = 31'h448b8fb0;
    stim[25] = 31'h6146147b;
    stim[26] = 31'h22ec6c15;
    stim[27] = 31'h681b78d3;
    stim[28] = 31'h76682509;
    stim[29] = 31'h5a2a2dc8;
    stim[30] = 31'h6b1acbe6;
    stim[31] = 31'h54eae114;
    stim[32] = 31'h626efb33;
    stim[33] = 31'h53b517aa;
    stim[34] = 31'h7be90a8d;
    stim[35] = 31'h590062df;
    stim[36] = 31'h67722127;
    stim[37] = 31'h519d03f6;
    stim[38] = 31'h56cafe27;
    stim[39] = 31'h6a7f63e6;
    stim[40] = 31'h67b721ff;
    stim[41] = 31'h6b668de1;
    stim[42] = 31'h60dbf904;
    stim[43] = 31'h6689b5ab;
    stim[44] = 31'h7c8eb24d;
    stim[45] = 31'h71865050;
    stim[46] = 31'h50ab618d;
    stim[47] = 31'h40783065;
    stim[48] = 31'h43c8bef4;
    stim[49] = 31'h49b852ad;
    stim[50] = 31'h7a724bca;
    stim[51] = 31'h4deddf87;
    stim[52] = 31'h647d6d4a;
    stim[53] = 31'h6cfb75d3;
    stim[54] = 31'h7e0307a1;
    stim[55] = 31'h4bd1b56d;
    stim[56] = 31'h7c9b50dc;
    stim[57] = 31'h609bcb31;
    stim[58] = 31'h511f4886;
    stim[59] = 31'h71881d86;
    stim[60] = 31'h72973510;
    stim[61] = 31'h455bb737;
    stim[62] = 31'h4bef1063;
    stim[63] = 31'h6eb238f4;
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
      expv[0] = 36'hxxxxxxxxe;
      expv[1] = 36'hxxxxxxxx9;
      expv[2] = 36'hxxxxxxxxc;
      expv[3] = 36'hxxxxxxxx9;
      expv[4] = 36'h0000014d4;
      expv[5] = 36'h0000014d3;
      expv[6] = 36'h000002c3b;
      expv[7] = 36'h000003da9;
      expv[8] = 36'h000000a89;
      expv[9] = 36'h000000a89;
      expv[10] = 36'h000000a81;
      expv[11] = 36'h000000a83;
      expv[12] = 36'h00000268c;
      expv[13] = 36'h000000204;
      expv[14] = 36'h000000209;
      expv[15] = 36'h00000020c;
      expv[16] = 36'h000000209;
      expv[17] = 36'h0000014d4;
      expv[18] = 36'h000001dfb;
      expv[19] = 36'h000001dfe;
      expv[20] = 36'h00000472e;
      expv[21] = 36'h000000d4c;
      expv[22] = 36'h000000e31;
      expv[23] = 36'h000000e33;
      expv[24] = 36'h000000e3b;
      expv[25] = 36'h000000e3b;
      expv[26] = 36'h000004803;
      expv[27] = 36'h00000480b;
      expv[28] = 36'h000000009;
      expv[29] = 36'h000000816;
      expv[30] = 36'h000000813;
      expv[31] = 36'h0000038ac;
      expv[32] = 36'h0000038ac;
      expv[33] = 36'h0000018b4;
      expv[34] = 36'h0000018bb;
      expv[35] = 36'h000002ed9;
      expv[36] = 36'h000002ed1;
      expv[37] = 36'h0000023c3;
      expv[38] = 36'h0000023ce;
      expv[39] = 36'h0000023c9;
      expv[40] = 36'h000005391;
      expv[41] = 36'h000001e14;
      expv[42] = 36'h0000025d4;
      expv[43] = 36'h000003136;
      expv[44] = 36'h00000321c;
      expv[45] = 36'h000003891;
      expv[46] = 36'h000001526;
      expv[47] = 36'h000001526;
      expv[48] = 36'h000001526;
      expv[49] = 36'h00000152b;
      expv[50] = 36'h000001529;
      expv[51] = 36'h000004554;
      expv[52] = 36'h000004554;
      expv[53] = 36'h000002db3;
      expv[54] = 36'h000003239;
      expv[55] = 36'h000003f31;
      expv[56] = 36'h000003f3b;
      expv[57] = 36'h00000290b;
      expv[58] = 36'h0000005ac;
      expv[59] = 36'h0000005a1;
      expv[60] = 36'h000001756;
      expv[61] = 36'h0000028e3;
      expv[62] = 36'h0000028ee;
      expv[63] = 36'h0000028ec;
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
