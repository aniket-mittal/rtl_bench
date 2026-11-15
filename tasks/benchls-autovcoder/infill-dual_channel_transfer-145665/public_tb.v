// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_145665 dut (
    .clk(clk),
    .rst(in_vec[42:42]),
    .start_ch1(in_vec[41:41]),
    .start_ch2(in_vec[40:40]),
    .src_addr_ch1(in_vec[39:32]),
    .src_addr_ch2(in_vec[31:24]),
    .dest_addr_ch1(in_vec[23:16]),
    .dest_addr_ch2(in_vec[15:8]),
    .data_in(in_vec[7:0]),
    .data_out_ch1(out_vec[17:10]),
    .data_out_ch2(out_vec[9:2]),
    .done_ch1(out_vec[1:1]),
    .done_ch2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h76cdde683e8;
    stim[1] = 43'h6157a19c11e;
    stim[2] = 43'h6c094cc8991;
    stim[3] = 43'h13efa09770a;
    stim[4] = 43'h08721775d0d;
    stim[5] = 43'h0a74c2291d3;
    stim[6] = 43'h2df0d3c9ca8;
    stim[7] = 43'h1714ee014e2;
    stim[8] = 43'h0b3ae0592ef;
    stim[9] = 43'h396ace0ff36;
    stim[10] = 43'h2f5593ecd99;
    stim[11] = 43'h2b5c1fa4d43;
    stim[12] = 43'h24c07412990;
    stim[13] = 43'h322c327733c;
    stim[14] = 43'h0bd9e187def;
    stim[15] = 43'h05d8f99f3f6;
    stim[16] = 43'h03bebc18352;
    stim[17] = 43'h131714b6647;
    stim[18] = 43'h0c131adc1ea;
    stim[19] = 43'h13dec69b0fa;
    stim[20] = 43'h3d9016d7a34;
    stim[21] = 43'h2d67ca57c51;
    stim[22] = 43'h2ce04c84b27;
    stim[23] = 43'h3ff7d23369f;
    stim[24] = 43'h1703ec89eed;
    stim[25] = 43'h221254c9ea9;
    stim[26] = 43'h1fde3828408;
    stim[27] = 43'h09dbaffb345;
    stim[28] = 43'h275efcba4f4;
    stim[29] = 43'h31a3874c701;
    stim[30] = 43'h10a46be0026;
    stim[31] = 43'h3f3803cb921;
    stim[32] = 43'h1ea735f34cb;
    stim[33] = 43'h056bf32830f;
    stim[34] = 43'h1dac79d2014;
    stim[35] = 43'h16c9b3e6366;
    stim[36] = 43'h056b15e9665;
    stim[37] = 43'h0ec141fd68f;
    stim[38] = 43'h3e4200eb71c;
    stim[39] = 43'h39986653922;
    stim[40] = 43'h1fd9fa735a3;
    stim[41] = 43'h0617d6f95d5;
    stim[42] = 43'h19005fd0431;
    stim[43] = 43'h09cab04fd9e;
    stim[44] = 43'h145efd0c3c3;
    stim[45] = 43'h381328444c0;
    stim[46] = 43'h357e5babde4;
    stim[47] = 43'h2903c1b4fd3;
    stim[48] = 43'h0850f5017c2;
    stim[49] = 43'h3b92a24d4a4;
    stim[50] = 43'h3fc44eba3c7;
    stim[51] = 43'h28856660183;
    stim[52] = 43'h4e42a10426b;
    stim[53] = 43'h22b1d317590;
    stim[54] = 43'h294dce71733;
    stim[55] = 43'h1964f8ee42f;
    stim[56] = 43'h3678ec77e17;
    stim[57] = 43'h0065506cd18;
    stim[58] = 43'h13148c08b8a;
    stim[59] = 43'h24b5f2d80a4;
    stim[60] = 43'h220c6213fae;
    stim[61] = 43'h481df61ce6a;
    stim[62] = 43'h0185fa0b146;
    stim[63] = 43'h0074a8ac893;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00035;
      expv[6] = 18'h00035;
      expv[7] = 18'h00035;
      expv[8] = 18'h38837;
      expv[9] = 18'h38837;
      expv[10] = 18'h38835;
      expv[11] = 18'h26437;
      expv[12] = 18'h26435;
      expv[13] = 18'h24037;
      expv[14] = 18'h24035;
      expv[15] = 18'h3bc37;
      expv[16] = 18'h3bc37;
      expv[17] = 18'h3bc37;
      expv[18] = 18'h3bc36;
      expv[19] = 18'h3bfab;
      expv[20] = 18'h3bfaa;
      expv[21] = 18'h3bcd3;
      expv[22] = 18'h3bcd1;
      expv[23] = 18'h09cd3;
      expv[24] = 18'h09cd1;
      expv[25] = 18'h3b4d3;
      expv[26] = 18'h3b4d1;
      expv[27] = 18'h020d3;
      expv[28] = 18'h020d3;
      expv[29] = 18'h020d1;
      expv[30] = 18'h004d3;
      expv[31] = 18'h004d2;
      expv[32] = 18'h00487;
      expv[33] = 18'h00486;
      expv[34] = 18'h0043f;
      expv[35] = 18'h0043e;
      expv[36] = 18'h0059b;
      expv[37] = 18'h0059b;
      expv[38] = 18'h0059b;
      expv[39] = 18'h00599;
      expv[40] = 18'h0899b;
      expv[41] = 18'h0899a;
      expv[42] = 18'h08b57;
      expv[43] = 18'h08b56;
      expv[44] = 18'h08a7b;
      expv[45] = 18'h08a7a;
      expv[46] = 18'h08b03;
      expv[47] = 18'h08b01;
      expv[48] = 18'h34f03;
      expv[49] = 18'h34f03;
      expv[50] = 18'h34f01;
      expv[51] = 18'h31f03;
      expv[52] = 18'h00000;
      expv[53] = 18'h00000;
      expv[54] = 18'h00000;
      expv[55] = 18'h0cc02;
      expv[56] = 18'h0cc02;
      expv[57] = 18'h0cc5f;
      expv[58] = 18'h0cc5f;
      expv[59] = 18'h0cc5e;
      expv[60] = 18'h0ce93;
      expv[61] = 18'h00000;
      expv[62] = 18'h00000;
      expv[63] = 18'h00000;
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
