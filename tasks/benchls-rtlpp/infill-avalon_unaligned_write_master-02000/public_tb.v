// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02000 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h38edea02951ef3ffdc;
    stim[1] = 70'h3d40b8b58ca81310c9;
    stim[2] = 70'h1622e8d35a6c7c54db;
    stim[3] = 70'h0fea37bf021ae15056;
    stim[4] = 70'h0a19f2ed0d4352273a;
    stim[5] = 70'h0396dc950745a7ee16;
    stim[6] = 70'h0de3d884f01f716143;
    stim[7] = 70'h1536503c6c023c1bbe;
    stim[8] = 70'h07b5e2548e735617dc;
    stim[9] = 70'h01909ccb690e125297;
    stim[10] = 70'h1181ea8f4c10b112ca;
    stim[11] = 70'h1a2f234fa1001e6894;
    stim[12] = 70'h1ed19ef67465bc6896;
    stim[13] = 70'h1227d1ffc88cf1f9ed;
    stim[14] = 70'h05ba5dc7725553e892;
    stim[15] = 70'h1339bd8a33b1c1c23b;
    stim[16] = 70'h0b568926e4c5a80cbd;
    stim[17] = 70'h1284bbdbfe67e0976b;
    stim[18] = 70'h1a72317430e9c0c5f1;
    stim[19] = 70'h16ea03217f14d7a495;
    stim[20] = 70'h1a9cc976337889c7e5;
    stim[21] = 70'h0c6227eb743842a30a;
    stim[22] = 70'h1eb6506ff0d45e1489;
    stim[23] = 70'h0aa4b2a8559d4e2179;
    stim[24] = 70'h13024b65c18f4b76d9;
    stim[25] = 70'h0f65bbfa937a6e3dfb;
    stim[26] = 70'h0b0a593657bc3c5f3f;
    stim[27] = 70'h01ed350f141d51ab9b;
    stim[28] = 70'h0f7985dcdb0d7a2397;
    stim[29] = 70'h27e79bbf9354501e94;
    stim[30] = 70'h0fc5869da6413b11b9;
    stim[31] = 70'h04e8db27ad0b615dfc;
    stim[32] = 70'h1053fbdece370a9d12;
    stim[33] = 70'h1408e1c998e8009498;
    stim[34] = 70'h1d0f58647febd386d5;
    stim[35] = 70'h02c41d096ea343dde8;
    stim[36] = 70'h0862940f549f81fe86;
    stim[37] = 70'h193608ebfe17f57625;
    stim[38] = 70'h1bdd44b590df528898;
    stim[39] = 70'h0f49a897a03e285b57;
    stim[40] = 70'h11e4efeed766edd936;
    stim[41] = 70'h0d241c76925e624db9;
    stim[42] = 70'h10475533c4851a7281;
    stim[43] = 70'h1edf4fbe7ef0910568;
    stim[44] = 70'h1a9e53b0b2327399d3;
    stim[45] = 70'h1b25e1444c73c5356e;
    stim[46] = 70'h0f93b3b65a15c4a46b;
    stim[47] = 70'h20ccd3f7bac2d669b7;
    stim[48] = 70'h19a7697d0d745c69be;
    stim[49] = 70'h077607e0af4fe33189;
    stim[50] = 70'h1d1b7c29fda636b18b;
    stim[51] = 70'h14fbb7fdf9114f34ce;
    stim[52] = 70'h016e94109790505521;
    stim[53] = 70'h021094bf2191207c6e;
    stim[54] = 70'h019ce91be17511f127;
    stim[55] = 70'h175834700ad8f9e638;
    stim[56] = 70'h1887245db12bdb1008;
    stim[57] = 70'h0d2970b51173924fd3;
    stim[58] = 70'h11c29d6c76abb431bf;
    stim[59] = 70'h118b19b67af33c0b8f;
    stim[60] = 70'h1c7f67763cfb518500;
    stim[61] = 70'h0404c72cff925d0eaf;
    stim[62] = 70'h0aa2f56fec69d6a81c;
    stim[63] = 70'h1799db5f96a1a1bdff;
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
      expv[0] = 33'h11ef3ffdc;
      expv[1] = 33'h0a81310c8;
      expv[2] = 33'h06c7c54da;
      expv[3] = 33'h01ae15056;
      expv[4] = 33'h14352273a;
      expv[5] = 33'h145a7ee16;
      expv[6] = 33'h01f716142;
      expv[7] = 33'h0023c1bbe;
      expv[8] = 33'h0735617dc;
      expv[9] = 33'h10e125296;
      expv[10] = 33'h010b112ca;
      expv[11] = 33'h1001e6895;
      expv[12] = 33'h065bc6896;
      expv[13] = 33'h08cf1f9ec;
      expv[14] = 33'h05553e892;
      expv[15] = 33'h1b1c1c23a;
      expv[16] = 33'h0c5a80cbc;
      expv[17] = 33'h067e0976a;
      expv[18] = 33'h0e9c0c5f0;
      expv[19] = 33'h114d7a494;
      expv[20] = 33'h17889c7e4;
      expv[21] = 33'h03842a30a;
      expv[22] = 33'h0d45e1488;
      expv[23] = 33'h19d4e2178;
      expv[24] = 33'h18f4b76d8;
      expv[25] = 33'h17a6e3dfa;
      expv[26] = 33'h1bc3c5f3e;
      expv[27] = 33'h01d51ab9a;
      expv[28] = 33'h10d7a2396;
      expv[29] = 33'h154501e94;
      expv[30] = 33'h0413b11b8;
      expv[31] = 33'h10b615dfc;
      expv[32] = 33'h0370a9d12;
      expv[33] = 33'h0e8009499;
      expv[34] = 33'h1ebd386d4;
      expv[35] = 33'h0a343dde8;
      expv[36] = 33'h09f81fe86;
      expv[37] = 33'h017f57624;
      expv[38] = 33'h0df528899;
      expv[39] = 33'h03e285b56;
      expv[40] = 33'h166edd936;
      expv[41] = 33'h05e624db8;
      expv[42] = 33'h0851a7280;
      expv[43] = 33'h0f0910568;
      expv[44] = 33'h0327399d2;
      expv[45] = 33'h073c5356e;
      expv[46] = 33'h015c4a46a;
      expv[47] = 33'h0c2d669b6;
      expv[48] = 33'h1745c69be;
      expv[49] = 33'h14fe33188;
      expv[50] = 33'h1a636b18a;
      expv[51] = 33'h1114f34cf;
      expv[52] = 33'h190505520;
      expv[53] = 33'h191207c6e;
      expv[54] = 33'h17511f126;
      expv[55] = 33'h0d8f9e638;
      expv[56] = 33'h12bdb1009;
      expv[57] = 33'h173924fd2;
      expv[58] = 33'h0abb431be;
      expv[59] = 33'h0f33c0b8e;
      expv[60] = 33'h0fb518500;
      expv[61] = 33'h1925d0eae;
      expv[62] = 33'h069d6a81c;
      expv[63] = 33'h0a1a1bdfe;
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
