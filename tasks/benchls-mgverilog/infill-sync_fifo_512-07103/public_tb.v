// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07103 dut (
    .clk(clk),
    .data_write(in_vec[19:4]),
    .rst(in_vec[3:3]),
    .flush(in_vec[2:2]),
    .read(in_vec[1:1]),
    .write(in_vec[0:0]),
    .data_read(out_vec[17:2]),
    .full(out_vec[1:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h94b59;
    stim[1] = 20'h0eabc;
    stim[2] = 20'he5fc0;
    stim[3] = 20'h228e3;
    stim[4] = 20'h61b70;
    stim[5] = 20'hedb24;
    stim[6] = 20'h48d15;
    stim[7] = 20'h345e3;
    stim[8] = 20'hb1aa6;
    stim[9] = 20'hb9fc3;
    stim[10] = 20'h39e75;
    stim[11] = 20'h2e072;
    stim[12] = 20'he1bf4;
    stim[13] = 20'hc1f33;
    stim[14] = 20'h3e3b4;
    stim[15] = 20'h85cb7;
    stim[16] = 20'h64032;
    stim[17] = 20'h3def7;
    stim[18] = 20'hecf41;
    stim[19] = 20'h15ff4;
    stim[20] = 20'ha6d61;
    stim[21] = 20'h466a7;
    stim[22] = 20'h68fb6;
    stim[23] = 20'hb9a71;
    stim[24] = 20'h7ec71;
    stim[25] = 20'h4eb92;
    stim[26] = 20'h0c113;
    stim[27] = 20'h55694;
    stim[28] = 20'hec5f4;
    stim[29] = 20'h55f92;
    stim[30] = 20'h91796;
    stim[31] = 20'h43a20;
    stim[32] = 20'hbe153;
    stim[33] = 20'h8e116;
    stim[34] = 20'he4ed6;
    stim[35] = 20'h0cb51;
    stim[36] = 20'h80175;
    stim[37] = 20'h3d6c4;
    stim[38] = 20'h94ec4;
    stim[39] = 20'h97503;
    stim[40] = 20'h4ab21;
    stim[41] = 20'h91072;
    stim[42] = 20'hb83e3;
    stim[43] = 20'h80ff7;
    stim[44] = 20'h93a21;
    stim[45] = 20'h66695;
    stim[46] = 20'hac235;
    stim[47] = 20'hbe7e7;
    stim[48] = 20'h3e625;
    stim[49] = 20'hc3821;
    stim[50] = 20'h8c6a4;
    stim[51] = 20'hea475;
    stim[52] = 20'he8ec2;
    stim[53] = 20'hf56f6;
    stim[54] = 20'h824c3;
    stim[55] = 20'h294e5;
    stim[56] = 20'hd2930;
    stim[57] = 20'h87844;
    stim[58] = 20'h241d5;
    stim[59] = 20'hdad13;
    stim[60] = 20'h84ec1;
    stim[61] = 20'hc3357;
    stim[62] = 20'hfc6d2;
    stim[63] = 20'h44864;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'hxxxxx;
      expv[2] = 18'hxxxxx;
      expv[3] = 18'h08a39;
      expv[4] = 18'hxxxxx;
      expv[5] = 18'hxxxxx;
      expv[6] = 18'h12345;
      expv[7] = 18'h12345;
      expv[8] = 18'hxxxxx;
      expv[9] = 18'h2e7f1;
      expv[10] = 18'hxxxxx;
      expv[11] = 18'h2e7f1;
      expv[12] = 18'hxxxxx;
      expv[13] = 18'h307cd;
      expv[14] = 18'hxxxxx;
      expv[15] = 18'h2172d;
      expv[16] = 18'h2172d;
      expv[17] = 18'hxxxxx;
      expv[18] = 18'h0f7bd;
      expv[19] = 18'h0f7bc;
      expv[20] = 18'h29b59;
      expv[21] = 18'h29b58;
      expv[22] = 18'h29b59;
      expv[23] = 18'h2e69d;
      expv[24] = 18'h2e69c;
      expv[25] = 18'h2e69c;
      expv[26] = 18'hxxxxx;
      expv[27] = 18'h03044;
      expv[28] = 18'h2e69d;
      expv[29] = 18'h2e69d;
      expv[30] = 18'hxxxxx;
      expv[31] = 18'h2e69d;
      expv[32] = 18'h2f855;
      expv[33] = 18'hxxxxx;
      expv[34] = 18'h2f855;
      expv[35] = 18'h032d5;
      expv[36] = 18'h032d4;
      expv[37] = 18'h032d5;
      expv[38] = 18'h032d5;
      expv[39] = 18'h25d41;
      expv[40] = 18'hxxxxx;
      expv[41] = 18'hxxxxx;
      expv[42] = 18'h2e0f9;
      expv[43] = 18'hxxxxx;
      expv[44] = 18'h25d41;
      expv[45] = 18'h25d40;
      expv[46] = 18'h25d41;
      expv[47] = 18'h25d41;
      expv[48] = 18'h25d41;
      expv[49] = 18'h25d41;
      expv[50] = 18'h25d40;
      expv[51] = 18'h3a91d;
      expv[52] = 18'h3a91d;
      expv[53] = 18'hxxxxx;
      expv[54] = 18'h20931;
      expv[55] = 18'hxxxxx;
      expv[56] = 18'h20931;
      expv[57] = 18'h20931;
      expv[58] = 18'h09075;
      expv[59] = 18'h09075;
      expv[60] = 18'hxxxxx;
      expv[61] = 18'hxxxxx;
      expv[62] = 18'h09075;
      expv[63] = 18'hxxxxx;
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
